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
<title>Quiz - Online Quiz System</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    @keyframes pulse {
        0%, 100% { transform: scale(1); }
        50% { transform: scale(1.05); }
    }
    
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        padding: 20px;
    }
    
    .container {
        background: white;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        max-width: 800px;
        margin: 0 auto;
        animation: fadeIn 0.6s ease;
    }
    
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
        padding-bottom: 20px;
        border-bottom: 2px solid #e2e8f0;
    }
    
    .header-left {
        display: flex;
        align-items: center;
        gap: 15px;
    }
    
    .quiz-icon {
        font-size: 36px;
    }
    
    h2 {
        color: #2d3748;
        font-size: 28px;
        font-weight: 700;
    }
    
    .header-right {
        text-align: right;
    }
    
    .user-info {
        color: #718096;
        font-size: 14px;
        margin-bottom: 8px;
    }
    
    .timer-container {
        display: flex;
        align-items: center;
        gap: 8px;
        background: linear-gradient(135deg, #fee 0%, #fdd 100%);
        padding: 10px 20px;
        border-radius: 25px;
        border: 2px solid #fcc;
    }
    
    .timer {
        font-size: 24px;
        color: #e74c3c;
        font-weight: bold;
    }
    
    .timer.warning {
        animation: pulse 1s ease-in-out infinite;
    }
    
    .progress-bar {
        width: 100%;
        height: 8px;
        background-color: #e2e8f0;
        border-radius: 10px;
        margin-bottom: 30px;
        overflow: hidden;
    }
    
    .progress-fill {
        height: 100%;
        background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
        width: 0%;
        transition: width 0.3s ease;
    }
    
    .question-container {
        margin-bottom: 30px;
        padding: 25px;
        background: linear-gradient(135deg, #f8f9ff 0%, #fef9ff 100%);
        border-radius: 15px;
        border: 2px solid #e6e8ff;
        transition: all 0.3s ease;
        animation: fadeIn 0.4s ease;
    }
    
    .question-container:hover {
        border-color: #667eea;
        box-shadow: 0 4px 12px rgba(102, 126, 234, 0.15);
    }
    
    .question-title {
        font-weight: 600;
        color: #2d3748;
        margin-bottom: 20px;
        font-size: 17px;
        line-height: 1.6;
    }
    
    .option {
        margin-bottom: 12px;
        position: relative;
    }
    
    .option input[type="radio"] {
        position: absolute;
        opacity: 0;
        cursor: pointer;
    }
    
    .option label {
        display: block;
        padding: 14px 20px 14px 50px;
        background: white;
        border: 2px solid #e2e8f0;
        border-radius: 10px;
        cursor: pointer;
        transition: all 0.3s ease;
        position: relative;
        font-size: 15px;
        color: #4a5568;
    }
    
    .option label:before {
        content: '';
        position: absolute;
        left: 18px;
        top: 50%;
        transform: translateY(-50%);
        width: 20px;
        height: 20px;
        border: 2px solid #cbd5e0;
        border-radius: 50%;
        transition: all 0.3s ease;
    }
    
    .option label:after {
        content: '';
        position: absolute;
        left: 23px;
        top: 50%;
        transform: translateY(-50%) scale(0);
        width: 10px;
        height: 10px;
        background: #667eea;
        border-radius: 50%;
        transition: all 0.3s ease;
    }
    
    .option input[type="radio"]:checked + label {
        background: linear-gradient(135deg, #eef2ff 0%, #f5f3ff 100%);
        border-color: #667eea;
        color: #2d3748;
        font-weight: 500;
    }
    
    .option input[type="radio"]:checked + label:before {
        border-color: #667eea;
    }
    
    .option input[type="radio"]:checked + label:after {
        transform: translateY(-50%) scale(1);
    }
    
    .option label:hover {
        border-color: #667eea;
        background: #fafcff;
    }
    
    .submit-btn {
        width: 100%;
        padding: 16px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border: none;
        border-radius: 12px;
        font-size: 18px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        margin-top: 10px;
    }
    
    .submit-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(102, 126, 234, 0.5);
    }
    
    .submit-btn:active {
        transform: translateY(0);
    }
    
    @media (max-width: 768px) {
        .container {
            padding: 25px 20px;
        }
        
        .header {
            flex-direction: column;
            gap: 15px;
            text-align: center;
        }
        
        .header-right {
            text-align: center;
        }
        
        h2 {
            font-size: 22px;
        }
        
        .question-title {
            font-size: 16px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="header-left">
                <span class="quiz-icon">📝</span>
                <h2>Java Quiz</h2>
            </div>
            <div class="header-right">
                <div class="user-info">👤 <%= session.getAttribute("userName") %></div>
                <div class="timer-container">
                    <span>⏱️</span>
                    <div class="timer" id="timer">60</div>
                    <span>sec</span>
                </div>
            </div>
        </div>
        
        <div class="progress-bar">
            <div class="progress-fill" id="progressBar"></div>
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

            <button type="submit" class="submit-btn">🚀 Submit Quiz</button>
        </form>
    </div>

    <script>
        var timeLeft = 60;
        var totalQuestions = 5;
        var answeredQuestions = 0;
        
        // Track progress
        function updateProgress() {
            var radios = document.querySelectorAll('input[type="radio"]:checked');
            answeredQuestions = 0;
            var checkedQuestions = new Set();
            
            radios.forEach(function(radio) {
                var questionName = radio.name;
                if (!checkedQuestions.has(questionName)) {
                    answeredQuestions++;
                    checkedQuestions.add(questionName);
                }
            });
            
            var progress = (answeredQuestions / totalQuestions) * 100;
            document.getElementById('progressBar').style.width = progress + '%';
        }
        
        // Add event listeners to all radio buttons
        var allRadios = document.querySelectorAll('input[type="radio"]');
        allRadios.forEach(function(radio) {
            radio.addEventListener('change', updateProgress);
        });
        
        // Timer
        var timer = setInterval(function(){
            timeLeft--;
            var timerElement = document.getElementById("timer");
            timerElement.innerHTML = timeLeft;
            
            // Add warning animation when time is low
            if (timeLeft <= 10 && !timerElement.classList.contains('warning')) {
                timerElement.classList.add('warning');
            }

            if(timeLeft <= 0){
                clearInterval(timer);
                document.getElementById("quizForm").submit();
            }

        },1000);
    </script>
</body>
</html>
