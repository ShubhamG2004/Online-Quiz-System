<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result - Online Quiz System</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }
    .container {
        background: white;
        padding: 60px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        text-align: center;
        max-width: 500px;
    }
    h2 {
        color: #333;
        margin-bottom: 30px;
    }
    .score-display {
        font-size: 48px;
        color: #667eea;
        font-weight: bold;
        margin-bottom: 20px;
    }
    .result-message {
        font-size: 20px;
        color: #555;
        margin-bottom: 40px;
    }
    .buttons {
        display: flex;
        gap: 15px;
        justify-content: center;
    }
    .btn {
        padding: 12px 30px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
        transition: 0.3s;
    }
    .btn-quiz {
        background-color: #667eea;
        color: white;
    }
    .btn-quiz:hover {
        background-color: #5568d3;
    }
    .btn-home {
        background-color: #95a5a6;
        color: white;
    }
    .btn-home:hover {
        background-color: #7f8c8d;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Quiz Result</h2>
        <%
            Integer score = (Integer)request.getAttribute("score");
            Integer total = (Integer)request.getAttribute("total");
            if (score == null) score = 0;
            if (total == null) total = 5;
        %>
        <div class="score-display"><%= score %> / <%= total %></div>
        <%
            double percentage = (double)score / total * 100;
            String message = "";
            if (percentage >= 80) {
                message = "Excellent! You passed with flying colors!";
            } else if (percentage >= 60) {
                message = "Good job! You passed the quiz.";
            } else {
                message = "Keep practicing! Better luck next time.";
            }
        %>
        <div class="result-message"><%= message %></div>
        <p style="color: #666; margin-bottom: 40px;">Percentage: <%= String.format("%.2f", percentage) %>%</p>
        <div class="buttons">
            <a href="quiz.jsp" class="btn btn-quiz">Take Quiz Again</a>
            <a href="index.jsp" class="btn btn-home">Go Home</a>
        </div>
    </div>
</body>
</html>
