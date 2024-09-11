package solutionwiki.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import solutionwiki.model.RequestDataBean;
import solutionwiki.model.RequestDataBean.RequestDao;
import solutionwiki.model.UserDataBean;

@WebServlet("/createRequest")
public class CreateRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); 
        String category = request.getParameter("category");
        String title = request.getParameter("request_title");
        String content = request.getParameter("content");
        String username = (String)request.getSession().getAttribute("username");
        
        UserDataBean.UserDao userDao = new UserDataBean.UserDao(); 
        UserDataBean userInfo = userDao.getUserByUsername(username);
        int userId = userInfo.getUserId();

        RequestDataBean requestData = new RequestDataBean();
        requestData.setCategory(category);
        requestData.setTitle(title);
        requestData.setContent(content);
        requestData.setUserId(userId);

        RequestDao requestDao = new RequestDao();
        try {
        	requestDao.addRequestData(requestData);
        	request.getSession().setAttribute("isSubmitted", "true");
        }
        catch(Exception e) {
        	e.printStackTrace();
        }
        
        response.sendRedirect("/request");
    }
}
