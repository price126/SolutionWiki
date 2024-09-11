package solutionwiki.controller;

import solutionwiki.model.UserDataBean;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet("/myPage")
public class UserController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDataBean.UserDao userDao = new UserDataBean.UserDao();
        
        HttpSession session = request.getSession();
        UserDataBean user = userDao.getUserByUsername((String)session.getAttribute("username"));
        request.setAttribute("user", user);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/profile.jsp");
        dispatcher.forward(request, response);
    }
}
