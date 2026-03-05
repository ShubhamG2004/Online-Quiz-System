package com.quiz.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import com.quiz.util.DBConnection;

public class AddQuestionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String question = request.getParameter("question");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        String answer = request.getParameter("answer");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "insert into questions(question,option1,option2,option3,option4,answer) values(?,?,?,?,?,?)"
            );

            ps.setString(1, question);
            ps.setString(2, option1);
            ps.setString(3, option2);
            ps.setString(4, option3);
            ps.setString(5, option4);
            ps.setString(6, answer);

            ps.executeUpdate();
            con.close();

            response.sendRedirect("admin.jsp?success=1");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
