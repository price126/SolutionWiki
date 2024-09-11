package solutionwiki.model;

import java.sql.*;
import java.util.*;

public class ChapterInfoBean {
   private String bookId;
    private String chpaterNum;
    private List<String> problems;
   private List<List<SolutionBean>> solutions;

    public ChapterInfoBean() {
        this.problems = new ArrayList<>();
        this.solutions = new ArrayList<>();
    }
    public String findChapterId() {
       try {
          Class.forName("com.mysql.jdbc.Driver");
          Connection conn = DriverManager.getConnection("");
          Statement stmt = conn.createStatement();

          // bookId와 chapterNum으로 chapterId 찾기
          String query = "SELECT chapter_id FROM Chapters WHERE book_id = '" + bookId + "' AND chapter_num = '" + chpaterNum + "'";
          ResultSet rs = stmt.executeQuery(query);

          String chapterId = null;
          if (rs.next()) {
             chapterId = rs.getString("chapter_id");
          }

          rs.close();
          stmt.close();
          conn.close();

          return chapterId; // 찾은 chapterId를 반환
       } catch (Exception e) {
          e.printStackTrace();
          return null; // 예외 발생 시 null 반환
       }

    }

    public void findProblems() {
       // 여기에서 DB에 접근하여 bookId에 해당하는 책 정보를 가져와서
        // chapter, problem 등의 필드를 설정해야 합니다.
        try {
           Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("");
            Statement stmt = conn.createStatement();
            
            // 1. bookId, chapterNum으로 chapterId 찾기
            String chapterId = findChapterId();
            if (chapterId == null) {
             throw new Exception("Chapter not found with given bookId and chapterNum");
          }
            
            // 2. chapterId를 외래키로 갖는 Problems 테이블의 문제를 찾아 *로 받아와서 problems List에 저장
            String problemQuery = "SELECT * FROM Problems WHERE chapter_id = '" + chapterId + "'";
            ResultSet rs_problems = stmt.executeQuery(problemQuery);
            while (rs_problems.next()) {
                this.problems.add(rs_problems.getString("problem_id"));
            }
            rs_problems.close();

            // 3. 찾은 문제의 problem_id를 외래키로 갖는 Solutions 테이블의 솔루션 가져오기 
            for (String problem : this.problems) {
               String solutionQuery = "SELECT Solutions.*, Users.username FROM Solutions " + 
                      "INNER JOIN Users ON Solutions.user_id = Users.user_id " +
                      "WHERE Solutions.problem_id = '" + problem + "' " +
                      "ORDER BY Solutions.likes DESC";
              ResultSet rs_solution = stmt.executeQuery(solutionQuery);
                List<SolutionBean> problemSolutions = new ArrayList<>();
              while (rs_solution.next()) {
                  SolutionBean solution = new SolutionBean();
                  solution.setSolutionId(rs_solution.getInt("solution_id"));
                  solution.setUserName(rs_solution.getString("username"));
                  solution.setContent(rs_solution.getString("content"));
                  solution.setLikes(rs_solution.getInt("likes"));
                  problemSolutions.add(solution);
              }
              this.solutions.add(problemSolutions);
              rs_solution.close();
            }
            
            
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public String getBookId() { return bookId; }
   public void setBookId(String bookId) { this.bookId = bookId; }
   public String getChpaterNum() { return chpaterNum; }
   public void setChpaterNum(String chpaterNum) { this.chpaterNum = chpaterNum; }
   public List<String> getProblems() { return problems; }
   public void setProblems(List<String> problems) { this.problems = problems; }
   public List<List<SolutionBean>> getSolutions() { return solutions; }
   public void setSolutions(List<List<SolutionBean>> solutions) { this.solutions = solutions; }


}