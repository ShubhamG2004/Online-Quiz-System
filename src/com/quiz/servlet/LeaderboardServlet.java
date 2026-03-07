package com.quiz.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import com.quiz.util.DBConnection;

public class LeaderboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String, Object>> leaderboard = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            // Get top 10 scores with user information
            PreparedStatement ps = con.prepareStatement(
                    "SELECT u.username, r.score, r.total_questions, r.quiz_date " +
                    "FROM results r " +
                    "JOIN users u ON r.user_id = u.id " +
                    "ORDER BY r.score DESC, r.quiz_date DESC " +
                    "LIMIT 10"
            );

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> entry = new HashMap<>();
                entry.put("username", rs.getString("username"));
                entry.put("score", rs.getInt("score"));
                entry.put("total_questions", rs.getInt("total_questions"));
                entry.put("quiz_date", rs.getTimestamp("quiz_date"));
                leaderboard.add(entry);
            }

            con.close();

            request.setAttribute("leaderboard", leaderboard);
            RequestDispatcher rd = request.getRequestDispatcher("leaderboard.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
