package solutionwiki.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.AbstractMap;

public class UserDataBean {
    private int userId;
    private String username;
    private int totalLikes;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getTotalLikes() {
        return totalLikes;
    }

    public void setTotalLikes(int totalLikes) {
        this.totalLikes = totalLikes;
    }

    public static class UserDao {
        public UserDataBean getUserByUsername(String username) {
            UserDataBean user = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("");
                PreparedStatement ps = conn.prepareStatement("SELECT user_id, total_likes FROM Users WHERE username = ?");
                ps.setString(1, username);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    user = new UserDataBean();
                    user.setUserId(rs.getInt("user_id"));
                    user.setTotalLikes(rs.getInt("total_likes"));
                }
                rs.close();
                ps.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return user;
        }

        public ArrayList<AbstractMap.SimpleEntry<Integer, UserDataBean>> getRankingData() {
            ArrayList<AbstractMap.SimpleEntry<Integer, UserDataBean>> rankingData = new ArrayList<>();
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("");
                PreparedStatement ps = conn.prepareStatement("SELECT user_id, username, total_likes FROM Users ORDER BY total_likes DESC");
                ResultSet rs = ps.executeQuery();
                int rank = 1;
                while (rs.next()) {
                    UserDataBean user = new UserDataBean();
                    user.setUserId(rs.getInt("user_id"));
                    user.setUsername(rs.getString("username"));
                    user.setTotalLikes(rs.getInt("total_likes"));
                    
                    rankingData.add(new AbstractMap.SimpleEntry<>(rank++, user));
                }
                rs.close();
                ps.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return rankingData;
        }

    }
}
