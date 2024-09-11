package solutionwiki.model;

import java.sql.*;

public class MaxLikeBean {
	private int MaxLike;
	private String MaxUser;
	
	public int getMaxLike() {
		return MaxLike;
	}
	
	public String getMaxUser() {
		return MaxUser;
	}

	public void setMaxLike(int maxLike) {
		MaxLike = maxLike;
	}
	
	public void setMaxUser(String maxUser) {
		MaxUser = maxUser;
	}

	public int select_MaxLike() {
		int max=-1;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection conn = DriverManager.getConnection("");
        	
        	String query = "SELECT * FROM Users ORDER BY total_likes DESC LIMIT 1";
        	
        	Statement stmt= conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            
            if (rs.next()) {
                max = rs.getInt("total_like");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
		return max;
	}
	
	public String select_UserMax() {
        String maxUser = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("");

            String query = "SELECT username FROM Users ORDER BY total_like DESC LIMIT 1";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            if (rs.next()) {
                maxUser = rs.getString("username");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return maxUser;
    }
	
	
}