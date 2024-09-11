package solutionwiki.model;

import java.sql.*;

public class LikesBean {
	private int solutionId;
	private int likes;
	
	public LikesBean() {}
	
	public void addLikes() {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;

	    try {
	        // 데이터베이스에 연결합니다.
	        connection = DriverManager.getConnection("");

	        // likes 값을 증가시키는 SQL 쿼리를 준비합니다.
	        String sql = "UPDATE Solutions SET likes = likes + 1 WHERE solution_id = ?";
	        preparedStatement = connection.prepareStatement(sql);
	        preparedStatement.setInt(1, this.solutionId);

	        // SQL 쿼리를 실행합니다.
	        preparedStatement.executeUpdate();

	        // user_id 값을 가져오는 SQL 쿼리를 준비합니다.
	        sql = "SELECT user_id FROM Solutions WHERE solution_id = ?";
	        preparedStatement = connection.prepareStatement(sql);
	        preparedStatement.setInt(1, this.solutionId);

	        // SQL 쿼리를 실행하고 결과를 가져옵니다.
	        resultSet = preparedStatement.executeQuery();
	        int userId = -1;
	        if (resultSet.next()) {
	            userId = resultSet.getInt("user_id");
	        }

	        // total_likes 값을 증가시키는 SQL 쿼리를 준비합니다.
	        sql = "UPDATE Users SET total_likes = total_likes + 1 WHERE user_id = ?";
	        preparedStatement = connection.prepareStatement(sql);
	        preparedStatement.setInt(1, userId);

	        // SQL 쿼리를 실행합니다.
	        preparedStatement.executeUpdate();

	        // likes 값을 조회하는 SQL 쿼리를 준비합니다.
	        sql = "SELECT likes FROM Solutions WHERE solution_id = ?";
	        preparedStatement = connection.prepareStatement(sql);
	        preparedStatement.setInt(1, this.solutionId);

	        // SQL 쿼리를 실행하고 결과를 가져옵니다.
	        resultSet = preparedStatement.executeQuery();

	        if (resultSet.next()) {
	            this.likes = resultSet.getInt("likes");
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // 사용이 끝난 자원을 정리합니다.
	        if (resultSet != null) {
	            try { resultSet.close(); } catch (SQLException e) { e.printStackTrace(); }
	        }
	        if (preparedStatement != null) {
	            try { preparedStatement.close(); } catch (SQLException e) { e.printStackTrace(); }
	        }
	        if (connection != null) {
	            try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
	        }
	    }
	}
	public int getSolutionId() {
		return solutionId;
	}
	public void setSolutionId(int solutionId) {
		this.solutionId = solutionId;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}
	
}
