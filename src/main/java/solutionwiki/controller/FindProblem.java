package solutionwiki.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import solutionwiki.model.ChapterInfoBean;

/**
 * Servlet implementation class findSolution
 * book_detail에서 책이 선택되면 해당 서블릿으로 form 전송
 */
@WebServlet("/FindProblem")
public class FindProblem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bookId = (String) request.getParameter("bookId");
		String chapterNum = (String) request.getParameter("chapterNum");

		ChapterInfoBean chapterBean = new ChapterInfoBean();
		chapterBean.setBookId(bookId);
		chapterBean.setChpaterNum(chapterNum);
		chapterBean.findProblems();
		request.setAttribute("chapterBean", chapterBean);
		request.getSession().setAttribute("chapterBean", chapterBean);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/book_detail2.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
