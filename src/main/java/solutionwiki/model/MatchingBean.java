package solutionwiki.model;

import java.sql.*;

public class MatchingBean {
	private String tmp_Id;
	private String tmp_pw;
	
	public String getTmp_Id() {
		return tmp_Id;
	}

	public void setTmp_Id(String tmp_Id) {
		this.tmp_Id = tmp_Id;
	}

	public String getTmp_pw() {
		return tmp_pw;
	}

	public void setTmp_pw(String tmp_pw) {
		this.tmp_pw = tmp_pw;
	}

	public boolean Matching() {
		
		try {
			Connection conn = DriverManager.getConnection("");
			
	    	String sql = "SELECT * FROM Users WHERE username='" + tmp_Id + "' AND password='" + tmp_pw + "'";
	    	try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
				return rs.next();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
        return false;
		
	}
}
