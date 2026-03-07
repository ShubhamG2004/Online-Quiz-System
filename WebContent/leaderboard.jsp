<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leaderboard - Online Quiz System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            padding: 40px;
            max-width: 900px;
            width: 100%;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h1 {
            color: #667eea;
            font-size: 2.5em;
            margin-bottom: 10px;
        }

        .header .trophy {
            font-size: 3em;
            margin-bottom: 10px;
        }

        .header p {
            color: #666;
            font-size: 1.1em;
        }

        .leaderboard-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        .leaderboard-table thead {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .leaderboard-table th {
            padding: 15px;
            text-align: left;
            font-weight: 600;
            font-size: 1em;
        }

        .leaderboard-table td {
            padding: 15px;
            border-bottom: 1px solid #eee;
        }

        .leaderboard-table tbody tr:hover {
            background: #f8f9fa;
            transition: background 0.3s ease;
        }

        .rank {
            font-weight: bold;
            font-size: 1.2em;
            width: 60px;
            text-align: center;
        }

        .rank-1 {
            color: #FFD700;
            font-size: 1.5em;
        }

        .rank-2 {
            color: #C0C0C0;
            font-size: 1.4em;
        }

        .rank-3 {
            color: #CD7F32;
            font-size: 1.3em;
        }

        .username {
            font-weight: 600;
            color: #333;
        }

        .score {
            font-weight: bold;
            color: #667eea;
            font-size: 1.1em;
        }

        .date {
            color: #999;
            font-size: 0.9em;
        }

        .medal {
            font-size: 1.5em;
            margin-right: 5px;
        }

        .nav-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 30px;
        }

        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 25px;
            font-size: 1em;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
            font-weight: 600;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 20px rgba(102, 126, 234, 0.4);
        }

        .btn-secondary {
            background: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background: #5a6268;
            transform: translateY(-2px);
        }

        .no-data {
            text-align: center;
            padding: 40px;
            color: #999;
            font-size: 1.2em;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            .header h1 {
                font-size: 1.8em;
            }

            .leaderboard-table th,
            .leaderboard-table td {
                padding: 10px 5px;
                font-size: 0.9em;
            }

            .date {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="trophy">🏆</div>
            <h1>Leaderboard</h1>
            <p>Top Quiz Champions</p>
        </div>

        <%
            List<Map<String, Object>> leaderboard = 
                (List<Map<String, Object>>) request.getAttribute("leaderboard");
            
            if (leaderboard != null && !leaderboard.isEmpty()) {
        %>
            <table class="leaderboard-table">
                <thead>
                    <tr>
                        <th style="text-align: center;">Rank</th>
                        <th>Username</th>
                        <th style="text-align: center;">Score</th>
                        <th style="text-align: center;">Percentage</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy HH:mm");
                        int rank = 1;
                        for (Map<String, Object> entry : leaderboard) {
                            String username = (String) entry.get("username");
                            int score = (Integer) entry.get("score");
                            int totalQuestions = (Integer) entry.get("total_questions");
                            java.sql.Timestamp quizDate = (java.sql.Timestamp) entry.get("quiz_date");
                            
                            double percentage = (totalQuestions > 0) ? 
                                ((double) score / totalQuestions * 100) : 0;
                            
                            String rankClass = "";
                            String medal = "";
                            if (rank == 1) {
                                rankClass = "rank-1";
                                medal = "🥇";
                            } else if (rank == 2) {
                                rankClass = "rank-2";
                                medal = "🥈";
                            } else if (rank == 3) {
                                rankClass = "rank-3";
                                medal = "🥉";
                            }
                    %>
                    <tr>
                        <td class="rank <%= rankClass %>" style="text-align: center;">
                            <span class="medal"><%= medal %></span>
                            <%= (medal.isEmpty() ? "#" + rank : "") %>
                        </td>
                        <td class="username"><%= username %></td>
                        <td class="score" style="text-align: center;">
                            <%= score %> / <%= totalQuestions %>
                        </td>
                        <td style="text-align: center; color: #28a745; font-weight: bold;">
                            <%= String.format("%.1f", percentage) %>%
                        </td>
                        <td class="date"><%= sdf.format(quizDate) %></td>
                    </tr>
                    <%
                            rank++;
                        }
                    %>
                </tbody>
            </table>
        <%
            } else {
        %>
            <div class="no-data">
                <p>📊 No quiz results yet. Be the first to take the quiz!</p>
            </div>
        <%
            }
        %>

        <div class="nav-buttons">
            <% if (session.getAttribute("username") != null) { %>
                <a href="quiz.jsp" class="btn btn-primary">Take Quiz</a>
                <a href="result.jsp" class="btn btn-secondary">My Results</a>
            <% } else { %>
                <a href="login.jsp" class="btn btn-primary">Login to Play</a>
            <% } %>
            <a href="index.jsp" class="btn btn-secondary">Home</a>
        </div>
    </div>
</body>
</html>
