package com.quiz.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.quiz.util.DBConnection;

public class QuizServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int score = 0;
        int totalQuestions = 5;

        for (int i = 1; i <= totalQuestions; i++) {
            String answer = request.getParameter("q" + i);
            String correctAnswer = request.getParameter("correct" + i);

            if (answer != null && answer.equals(correctAnswer)) {
                score++;
            }
        }

        try {
            HttpSession session = request.getSession();
            int userId = (Integer) session.getAttribute("userId");

            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("insert into results(user_id,score) values(?,?)");
            ps.setInt(1, userId);
            ps.setInt(2, score);
            ps.executeUpdate();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("score", score);
        request.setAttribute("total", totalQuestions);

        RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
        rd.forward(request, response);
    }
}
