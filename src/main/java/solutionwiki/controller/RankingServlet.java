package solutionwiki.controller;

import solutionwiki.model.UserDataBean;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.AbstractMap;

@WebServlet("/ranking")
public class RankingServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    UserDataBean.UserDao userDao = new UserDataBean.UserDao();
	    ArrayList<AbstractMap.SimpleEntry<Integer, UserDataBean>> rankingData = userDao.getRankingData();
	    request.setAttribute("rankingData", rankingData);
	    
	    RequestDispatcher view = request.getRequestDispatcher("/ranking.jsp");
	    view.forward(request, response);
	}
}
