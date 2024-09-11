package solutionwiki.model;
import java.sql.*;

public class SignUpModelBean {
	private String username;
	private String password;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void AddUser() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	    	Connection conn = DriverManager.getConnection("");
	    	Statement stmt = conn.createStatement();
            String sql = "INSERT INTO Users (username, password) VALUES ('" + username + "', '" + password + "')";
            stmt.executeUpdate(sql);
            
            stmt.close();
            conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 
	
}
