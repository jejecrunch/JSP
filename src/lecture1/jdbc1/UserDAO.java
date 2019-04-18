package lecture1.jdbc1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import lecture1.DB;

public class UserDAO {

	public static List<User> findAll() throws Exception {
        String sql = "SELECT u.*, d.departmentName " +
                     "FROM user u LEFT JOIN department d ON u.departmentId = d.id";
        try (Connection connection = DB.getConnection("student1");
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()) {
            ArrayList<User> list = new ArrayList<User>();
            while (resultSet.next ()) {
                User user1 = new User();
                user1.setId(resultSet.getInt("id"));
                user1.setUserid(resultSet.getString("userid"));
                user1.setName(resultSet.getString("name"));
                user1.setDepartmentId(resultSet.getInt("departmentId"));
                user1.setEmail(resultSet.getString("email"));
                user1.setDepartmentName(resultSet.getString("departmentName"));
                user1.setEnabled(resultSet.getBoolean("enabled"));
                user1.setUserType(resultSet.getString("userType"));
                list.add(user1);
            }
            return list; 
        }
    }
	
}
