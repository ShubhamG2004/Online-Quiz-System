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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Result - Online Quiz System</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: scale(0.9); }
        to { opacity: 1; transform: scale(1); }
    }
    
    @keyframes celebrate {
        0%, 100% { transform: rotate(0deg); }
        25% { transform: rotate(-10deg); }
        75% { transform: rotate(10deg); }
    }
    
    @keyframes slideUp {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
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
        padding: 60px 50px;
        border-radius: 20px;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        text-align: center;
        max-width: 550px;
        width: 100%;
        animation: fadeIn 0.6s ease;
    }
    
    .result-icon {
        font-size: 80px;
        margin-bottom: 20px;
        animation: celebrate 2s ease-in-out infinite;
    }
    
    h2 {
        color: #2d3748;
        margin-bottom: 30px;
        font-size: 32px;
        font-weight: 700;
        animation: slideUp 0.6s ease 0.2s both;
    }
    
    .score-card {
        background: linear-gradient(135deg, #f6f8fb 0%, #f1f3f9 100%);
        padding: 30px;
        border-radius: 15px;
        margin-bottom: 25px;
        border: 2px solid #e2e8f0;
        animation: slideUp 0.6s ease 0.3s both;
    }
    
    .score-display {
        font-size: 56px;
        font-weight: bold;
        margin-bottom: 15px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }
    
    .score-label {
        font-size: 14px;
        color: #718096;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: 600;
    }
    
    .result-message {
        font-size: 22px;
        color: #2d3748;
        margin-bottom: 15px;
        font-weight: 600;
        animation: slideUp 0.6s ease 0.4s both;
    }
    
    .percentage-badge {
        display: inline-block;
        padding: 10px 25px;
        border-radius: 25px;
        font-size: 18px;
        font-weight: 600;
        margin-bottom: 35px;
        animation: slideUp 0.6s ease 0.5s both;
    }
    
    .excellent {
        background: linear-gradient(135deg, #d4f4dd 0%, #b8e6c3 100%);
        color: #2f855a;
    }
    
    .good {
        background: linear-gradient(135deg, #d9e8ff 0%, #c3dbff 100%);
        color: #2c5282;
    }
    
    .tryagain {
        background: linear-gradient(135deg, #fed7d7 0%, #fbb6ce 100%);
        color: #c53030;
    }
    
    .stats-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 15px;
        margin-bottom: 35px;
        animation: slideUp 0.6s ease 0.6s both;
    }
    
    .stat-box {
        background: white;
        padding: 20px;
        border-radius: 12px;
        border: 2px solid #e2e8f0;
    }
    
    .stat-value {
        font-size: 28px;
        font-weight: bold;
        color: #667eea;
        margin-bottom: 5px;
    }
    
    .stat-label {
        font-size: 13px;
        color: #718096;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    
    .buttons {
        display: flex;
        gap: 15px;
        justify-content: center;
        flex-wrap: wrap;
        animation: slideUp 0.6s ease 0.7s both;
    }
    
    .btn {
        padding: 14px 35px;
        font-size: 16px;
        font-weight: 600;
        border: none;
        border-radius: 50px;
        cursor: pointer;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 8px;
        transition: all 0.3s ease;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }
    
    .btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
    }
    
    .btn-quiz {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
    }
    
    .btn-home {
        background: white;
        color: #4a5568;
        border: 2px solid #e2e8f0;
    }
    
    .btn-home:hover {
        background: #f7fafc;
        border-color: #cbd5e0;
    }
    
    @media (max-width: 600px) {
        .container {
            padding: 40px 30px;
        }
        h2 {
            font-size: 26px;
        }
        .score-display {
            font-size: 48px;
        }
        .result-icon {
            font-size: 60px;
        }
        .buttons {
            flex-direction: column;
            width: 100%;
        }
        .btn {
            width: 100%;
            justify-content: center;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <%
            Integer score = (Integer)request.getAttribute("score");
            Integer total = (Integer)request.getAttribute("total");
            if (score == null) score = 0;
            if (total == null) total = 5;
            
            double percentage = (double)score / total * 100;
            String message = "";
            String icon = "";
            String badgeClass = "";
            
            if (percentage >= 80) {
                message = "Outstanding Performance!";
                icon = "🎉";
                badgeClass = "excellent";
            } else if (percentage >= 60) {
                message = "Great Job!";
                icon = "👍";
                badgeClass = "good";
            } else {
                message = "Keep Learning!";
                icon = "💪";
                badgeClass = "tryagain";
            }
        %>
        
        <div class="result-icon"><%= icon %></div>
        <h2>Quiz Completed!</h2>
        
        <div class="score-card">
            <div class="score-display"><%= score %> / <%= total %></div>
            <div class="score-label">Your Score</div>
        </div>
        
        <div class="result-message"><%= message %></div>
        
        <div class="percentage-badge <%= badgeClass %>">
            <%= String.format("%.0f", percentage) %>% SCORE
        </div>
        
        <div class="stats-grid">
            <div class="stat-box">
                <div class="stat-value"><%= score %></div>
                <div class="stat-label">Correct</div>
            </div>
            <div class="stat-box">
                <div class="stat-value"><%= total - score %></div>
                <div class="stat-label">Incorrect</div>
            </div>
        </div>
        
        <div class="buttons">
            <a href="quiz.jsp" class="btn btn-quiz">
                <span>🔄</span> Try Again
            </a>
            <a href="LeaderboardServlet" class="btn btn-leaderboard" style="background: linear-gradient(135deg, #f5af19 0%, #f12711 100%);">
                <span>🏆</span> Leaderboard
            </a>
            <a href="index.jsp" class="btn btn-home">
                <span>🏠</span> Home
            </a>
        </div>
    </div>
</body>
</html>
