package lecture1.jdbc1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import lecture1.DB;

public class UserDAO2 {

	public static User createUser(ResultSet resultSet) throws SQLException {
		User user = new User();
		user.setId(resultSet.getInt("id"));
		user.setUserid(resultSet.getString("userid"));
		user.setName(resultSet.getString("name"));
		user.setDepartmentId(resultSet.getInt("departmentId"));
		user.setEmail(resultSet.getString("email"));
		user.setDepartmentName(resultSet.getString("departmentName"));
		user.setEnabled(resultSet.getBoolean("enabled"));
		user.setUserType(resultSet.getString("userType"));
		return user;
	}

	public static List<User> findAll() throws Exception {
		String sql = "SELECT u.*, d.departmentName " +
				"FROM user u LEFT JOIN department d ON u.departmentId = d.id";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {
			ArrayList<User> list = new ArrayList<User>();
			while (resultSet.next())
				list.add(createUser(resultSet));
			return list; 
		}
	}

	public static List<User> findByName(String name) throws Exception {
		String sql = "SELECT u.*, d.departmentName " +
				"FROM user u LEFT JOIN department d ON u.departmentId = d.id " +
				"WHERE u.name LIKE ?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, name + "%");
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<User> list = new ArrayList<User>();
				while (resultSet.next())
					list.add(createUser(resultSet));
				return list;
			}
		}
	}
	
	public static List<User> findByDepartmentId(int departmentId) throws Exception {
        String sql = "SELECT u.*, d.departmentName " +
                     "FROM user u LEFT JOIN department d ON u.departmentId = d.id " +
                     "WHERE u.departmentId = ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, departmentId);
            try (ResultSet resultSet = statement.executeQuery()) {
                ArrayList<User> list = new ArrayList<User>();
                while (resultSet.next())
                    list.add(createUser(resultSet));
                return list;
            }
        }
    }
	
	public static List<User> findByNameAndDepartmentId(String name, int departmentId) throws Exception {
        String sql = "SELECT u.*, d.departmentName " +
                     "FROM user u LEFT JOIN department d ON u.departmentId = d.id " +
                     "WHERE u.name LIKE ? AND u.departmentId = ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name + "%");
        	statement.setInt(2, departmentId);
            try (ResultSet resultSet = statement.executeQuery()) {
                ArrayList<User> list = new ArrayList<User>();
                while (resultSet.next())
                    list.add(createUser(resultSet));
                return list;
            }
        }
    }

}
