package solutionwiki.model;

import java.sql.*;

public class GetChnumBean {
	private String book_id;
	private int total_ch;
	
	public String Get_book_id() { 
		return this.book_id;
	}
	
	public int Get_total_ch() {
		return this.total_ch;
	}
	
	public void Set_book_id(String id) {
		this.book_id = id;
	}
	
	public void Set_total_ch() {
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection conn = DriverManager.getConnection("");
    		
    		String query = "SELECT * FROM Books WHERE book_id = '" + book_id + "'";
    		Statement stmt = conn.createStatement();
    		ResultSet rs = stmt.executeQuery(query);
    		
    		if (rs.next()) {
    			total_ch = rs.getInt("chapter_total_num");
    			System.out.println(total_ch);
    		} else {
    			System.out.println("아직 등록되지 않은 서적입니다.");
    		}
    		
    		rs.close();
    		stmt.close();
    		conn.close();
    		
        } catch (ClassNotFoundException | SQLException e) {
    		e.printStackTrace();
    	} 
	}
}
