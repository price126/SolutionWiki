package solutionwiki.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import solutionwiki.model.RequestDataBean;
import solutionwiki.model.RequestDataBean.RequestDao;

@WebServlet("/request/*")
public class ShowRequestServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String pathInfo = request.getPathInfo();
        int id = Integer.parseInt(pathInfo.substring(1));

        RequestDao requestDao = new RequestDao();
        RequestDataBean requestData = requestDao.getRequestDataById(id);

        request.setAttribute("category", requestData.getCategory());
        request.setAttribute("title", requestData.getTitle());
        request.setAttribute("content", requestData.getContent());

        request.getRequestDispatcher("/show_request.jsp").forward(request, response);
    }
}
