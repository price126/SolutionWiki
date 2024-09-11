package solutionwiki.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import solutionwiki.model.ChapterInfoBean;
import solutionwiki.model.SolutionDataBean;

@WebServlet("/SolutionUpload")
public class SolutionUpload extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        int problem_id = Integer.parseInt(request.getParameter("problem_id"));
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        String contents = request.getParameter("contents");

        SolutionDataBean solutionData = new SolutionDataBean();
        solutionData.setProblemId(problem_id);
        solutionData.setUserId(user_id);
        solutionData.setContent(contents);
        solutionData.solutionDA();

        ChapterInfoBean chapterBean = (ChapterInfoBean) request.getSession().getAttribute("chapterBean");
        response.sendRedirect(
                "FindProblem?bookId=" + chapterBean.getBookId() + "&chapterNum=" + chapterBean.getChpaterNum());
    }
}
