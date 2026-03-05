package com.quiz.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class ResultServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int score = 0;
        int totalQuestions = 5; // Adjust based on your quiz

        for (int i = 1; i <= totalQuestions; i++) {
            String answer = request.getParameter("q" + i);
            String correctAnswer = request.getParameter("correct" + i);

            if (answer != null && answer.equals(correctAnswer)) {
                score++;
            }
        }

        request.setAttribute("score", score);
        request.setAttribute("total", totalQuestions);

        RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
        rd.forward(request, response);

    }
}
