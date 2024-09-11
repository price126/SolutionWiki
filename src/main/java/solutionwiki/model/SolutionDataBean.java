package solutionwiki.model;

import java.sql.*;

public class SolutionDataBean {
	private int problemId;
	private int userId;
	private String content;
	
	public void solutionDA() {
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("");;
            PreparedStatement ps = conn.prepareStatement("INSERT INTO Solutions (problem_id, user_id, content) VALUES (?, ?, ?)");
            ps.setInt(1, problemId);
            ps.setInt(2, userId); 
            ps.setString(3, content);
            ps.executeUpdate();
            
            ps.close();
            conn.close();
            
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}
	
	
	public int getProblemId() { return problemId; }
	public void setProblemId(int problem_id) { this.problemId = problem_id; }
	public int getUserId() { return userId;	}
	public void setUserId(int user_id) { this.userId = user_id; }
	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }
}
