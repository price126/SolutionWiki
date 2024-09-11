package solutionwiki.controller;

import solutionwiki.model.RequestDataBean;
import solutionwiki.model.RequestDataBean.RequestDao;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/request")
public class RequestServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    RequestDao requestDao = new RequestDataBean.RequestDao();
	    ArrayList<RequestDataBean> requestData = requestDao.getRequestData(); // 20개의 요청글 = 한 페이지
	    request.setAttribute("requestData", requestData);

	    RequestDispatcher view = request.getRequestDispatcher("/request.jsp");
	    view.forward(request, response);
	}
}
