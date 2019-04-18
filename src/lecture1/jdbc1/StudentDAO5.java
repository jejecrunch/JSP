package lecture1.jdbc1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lecture1.DB;

public class StudentDAO5 {
	public static Student createStudent(ResultSet resultSet) throws SQLException {
		Student student = new Student();
		student.setId(resultSet.getInt("id"));
		student.setStudentNumber(resultSet.getString("studentNumber"));
		student.setName(resultSet.getString("name"));
		student.setDepartmentId(resultSet.getInt("departmentId"));
		student.setYear(resultSet.getInt("year"));
		student.setDepartmentName(resultSet.getString("departmentName"));
		return student;
	}

	public static List<Student> findAll(int currentPage, int pageSize) throws Exception {
		String sql = "SELECT s.*, d.departmentName " +
				"FROM student s LEFT JOIN department d ON s.departmentId = d.id " +
				"LIMIT ?, ?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
					statement.setInt(1, (currentPage-1)*pageSize);
					statement.setInt(2, pageSize);
					try (ResultSet resultSet = statement.executeQuery()) {
						ArrayList<Student> list = new ArrayList<Student>();
						while (resultSet.next()) {
							Student student = new Student();
							student.setId(resultSet.getInt("id"));
							student.setStudentNumber(resultSet.getString("studentNumber"));
							student.setName(resultSet.getString("name"));
							student.setDepartmentId(resultSet.getInt("departmentId"));
							student.setYear(resultSet.getInt("year"));
							student.setDepartmentName(resultSet.getString("departmentName"));
							list.add(student);
						}
						return list;
					}
				}

	}

	public static List<Student> findByName(String name, int currentPage, int pageSize) throws Exception {
		String sql = "SELECT s.*, d.departmentName " +
				"FROM student s LEFT JOIN department d ON s.departmentId = d.id " +
				"WHERE s.name LIKE ? " + 
				"LIMIT ?, ?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, name + "%");
			statement.setInt(2, (currentPage-1)*pageSize);
			statement.setInt(3, pageSize);
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<Student> list = new ArrayList<Student>();
				while (resultSet.next())
					list.add(createStudent(resultSet));
				return list;
			}
		}
	}

	public static List<Student> findByDepartmentId(int departmentId) throws Exception {
		String sql = "SELECT s.*, d.departmentName " +
				"FROM student s LEFT JOIN department d ON s.departmentId = d.id " +
				"WHERE s.departmentId = ?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, departmentId);
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<Student> list = new ArrayList<Student>();
				while (resultSet.next())
					list.add(createStudent(resultSet));
				return list;
			}
		}
	}
	
    public static int count() throws Exception {
        String sql = "SELECT COUNT(*) FROM student";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next())
                    return resultSet.getInt(1);
        }
        return 0;
    }

    public static int count(String name) throws Exception {
        String sql = "SELECT COUNT(*) FROM student WHERE name LIKE ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)){
        	statement.setString(1, name + "%");
        	try(ResultSet resultSet = statement.executeQuery()){
        		if(resultSet.next())
        			return resultSet.getInt(1);
        	}
        };
        return 0;
    }
}
