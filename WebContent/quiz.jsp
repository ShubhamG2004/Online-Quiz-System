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
<title>Quiz - Online Quiz System</title>
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
        padding: 20px;
    }
    .container {
        background: white;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        max-width: 600px;
        margin: 0 auto;
    }
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
    }
    h2 {
        color: #333;
    }
    .timer {
        font-size: 24px;
        color: #e74c3c;
        font-weight: bold;
    }
    .question-container {
        margin-bottom: 30px;
        padding: 20px;
        background-color: #f5f5f5;
        border-radius: 5px;
    }
    .question-title {
        font-weight: bold;
        color: #333;
        margin-bottom: 15px;
    }
    .option {
        margin-bottom: 10px;
    }
    .option input[type="radio"] {
        margin-right: 10px;
        cursor: pointer;
    }
    .option label {
        cursor: pointer;
    }
    .submit-btn {
        width: 100%;
        padding: 12px;
        background-color: #667eea;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }
    .submit-btn:hover {
        background-color: #5568d3;
    }
    .user-info {
        color: #666;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Quiz</h2>
            <div>
                <div class="user-info">Hello, <%= session.getAttribute("userName") %></div>
                <div class="timer">Time Left: <span id="timer">60</span>s</div>
            </div>
        </div>

        <form action="QuizServlet" method="post" id="quizForm">

            <div class="question-container">
                <div class="question-title">1. What is Java?</div>
                <div class="option">
                    <input type="radio" name="q1" value="a" id="q1a" required>
                    <label for="q1a">Programming Language</label>
                </div>
                <div class="option">
                    <input type="radio" name="q1" value="b" id="q1b">
                    <label for="q1b">Database</label>
                </div>
                <div class="option">
                    <input type="radio" name="q1" value="c" id="q1c">
                    <label for="q1c">Browser</label>
                </div>
                <input type="hidden" name="correct1" value="a">
            </div>

            <div class="question-container">
                <div class="question-title">2. Which keyword is used to create a class in Java?</div>
                <div class="option">
                    <input type="radio" name="q2" value="a" id="q2a" required>
                    <label for="q2a">def</label>
                </div>
                <div class="option">
                    <input type="radio" name="q2" value="b" id="q2b">
                    <label for="q2b">class</label>
                </div>
                <div class="option">
                    <input type="radio" name="q2" value="c" id="q2c">
                    <label for="q2c">struct</label>
                </div>
                <input type="hidden" name="correct2" value="b">
            </div>

            <div class="question-container">
                <div class="question-title">3. What is Java Virtual Machine (JVM)?</div>
                <div class="option">
                    <input type="radio" name="q3" value="a" id="q3a" required>
                    <label for="q3a">Hardware</label>
                </div>
                <div class="option">
                    <input type="radio" name="q3" value="b" id="q3b">
                    <label for="q3b">An abstract machine</label>
                </div>
                <div class="option">
                    <input type="radio" name="q3" value="c" id="q3c">
                    <label for="q3c">Software library</label>
                </div>
                <input type="hidden" name="correct3" value="b">
            </div>

            <div class="question-container">
                <div class="question-title">4. Which statement is true about Java?</div>
                <div class="option">
                    <input type="radio" name="q4" value="a" id="q4a" required>
                    <label for="q4a">Platform dependent</label>
                </div>
                <div class="option">
                    <input type="radio" name="q4" value="b" id="q4b">
                    <label for="q4b">Platform independent</label>
                </div>
                <div class="option">
                    <input type="radio" name="q4" value="c" id="q4c">
                    <label for="q4c">Not secure</label>
                </div>
                <input type="hidden" name="correct4" value="b">
            </div>

            <div class="question-container">
                <div class="question-title">5. What is the size of float in Java?</div>
                <div class="option">
                    <input type="radio" name="q5" value="a" id="q5a" required>
                    <label for="q5a">4 bytes</label>
                </div>
                <div class="option">
                    <input type="radio" name="q5" value="b" id="q5b">
                    <label for="q5b">8 bytes</label>
                </div>
                <div class="option">
                    <input type="radio" name="q5" value="c" id="q5c">
                    <label for="q5c">2 bytes</label>
                </div>
                <input type="hidden" name="correct5" value="a">
            </div>

            <button type="submit" class="submit-btn">Submit Quiz</button>
        </form>
    </div>

    <script>
        var timeLeft = 60;

        var timer = setInterval(function(){

            timeLeft--;

            document.getElementById("timer").innerHTML = timeLeft;

            if(timeLeft <= 0){
                clearInterval(timer);
                document.getElementById("quizForm").submit();
            }

        },1000);
    </script>
</body>
</html>
