package solutionwiki.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import solutionwiki.model.ChapterInfoBean;
import solutionwiki.model.UserDataBean;

/**
 * Servlet implementation class FindSolution
 */
@WebServlet("/FindSolution")
public class FindSolution extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ChapterInfoBean chapterBean = (ChapterInfoBean) request.getSession().getAttribute("chapterBean");

		request.setAttribute("chapterBean", chapterBean);

		UserDataBean.UserDao userdatadao = new UserDataBean.UserDao();
	    UserDataBean userdata = userdatadao.getUserByUsername((String) request.getSession().getAttribute("username"));
	    request.setAttribute("user_id", userdata.getUserId());
		if (request.getParameter("full") != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/book_detail3.jsp");
			dispatcher.forward(request, response);
		}
		if (request.getParameter("edit") != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/book_detail5.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
