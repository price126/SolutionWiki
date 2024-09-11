package solutionwiki.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RequestDataBean {
    private int id;
    private String category;
    private int userId;
    private String title;
    private String content;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public static class RequestDao {
        private Connection getConnection() throws Exception {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection("");
        }

        public ArrayList<RequestDataBean> getRequestData() {
            ArrayList<RequestDataBean> requestData = new ArrayList<>();
            try {
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement("SELECT request_id, category, title, content FROM Requests ORDER BY request_id DESC");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    RequestDataBean data = new RequestDataBean();
                    data.setId(rs.getInt("request_id"));
                    data.setCategory(rs.getString("category"));
                    data.setTitle(rs.getString("title"));
                    data.setContent(rs.getString("content"));
                    requestData.add(data);
                }
                rs.close();
                ps.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return requestData;
        }

        public RequestDataBean getRequestDataById(int id) {
            RequestDataBean requestData = null;
            try {
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement("SELECT request_id, category, title, content FROM Requests WHERE request_id = ?");
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    requestData = new RequestDataBean();
                    requestData.setId(rs.getInt("request_id"));
                    requestData.setCategory(rs.getString("category"));
                    requestData.setTitle(rs.getString("title"));
                    requestData.setContent(rs.getString("content"));
                }
                rs.close();
                ps.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return requestData;
        }
        
        public void addRequestData(RequestDataBean requestData) {
            try {
                Connection conn = getConnection();
                System.out.println(requestData.getCategory());
                System.out.println(requestData.getUserId());
                System.out.println(requestData.getTitle());
                System.out.println(requestData.getContent());
                PreparedStatement ps = conn.prepareStatement("INSERT INTO Requests (category, user_id, title, content) VALUES (?, ?, ?, ?)");
                ps.setString(1, requestData.getCategory());
                ps.setInt(2, requestData.getUserId()); 
                ps.setString(3, requestData.getTitle());
                ps.setString(4, requestData.getContent());
                ps.executeUpdate();
                ps.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
}
