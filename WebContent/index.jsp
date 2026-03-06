<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online Quiz System</title>
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
    
    @keyframes gradient {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }
    
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
        background-size: 200% 200%;
        animation: gradient 15s ease infinite;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }
    
    .container {
        text-align: center;
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        padding: 60px 50px;
        border-radius: 20px;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        max-width: 600px;
        width: 100%;
        animation: fadeIn 0.6s ease;
    }
    
    .logo {
        font-size: 64px;
        margin-bottom: 20px;
    }
    
    h1 {
        color: #2d3748;
        margin-bottom: 15px;
        font-size: 32px;
        font-weight: 700;
    }
    
    .subtitle {
        color: #718096;
        font-size: 18px;
        margin-bottom: 40px;
        line-height: 1.6;
    }
    
    .features {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
        gap: 20px;
        margin-bottom: 40px;
    }
    
    .feature {
        padding: 20px;
        background: linear-gradient(135deg, #f6f7fb 0%, #fafafc 100%);
        border-radius: 12px;
        border: 1px solid rgba(102, 126, 234, 0.1);
    }
    
    .feature-icon {
        font-size: 32px;
        margin-bottom: 10px;
    }
    
    .feature-text {
        font-size: 14px;
        color: #4a5568;
        font-weight: 500;
    }
    
    .button-group {
        display: flex;
        gap: 20px;
        justify-content: center;
        flex-wrap: wrap;
    }
    
    .btn {
        padding: 14px 40px;
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
    
    .btn-login {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
    }
    
    .btn-login:hover {
        background: linear-gradient(135deg, #5568d3 0%, #653a8a 100%);
    }
    
    .btn-register {
        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        color: white;
    }
    
    .btn-register:hover {
        background: linear-gradient(135deg, #e082ea 0%, #e4465b 100%);
    }
    
    @media (max-width: 600px) {
        .container {
            padding: 40px 30px;
        }
        h1 {
            font-size: 26px;
        }
        .logo {
            font-size: 48px;
        }
        .button-group {
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
        <div class="logo">📚</div>
        <h1>Welcome to Online Quiz System</h1>
        <p class="subtitle">Test your knowledge with our engaging quizzes and track your progress</p>
        
        <div class="features">
            <div class="feature">
                <div class="feature-icon">⚡</div>
                <div class="feature-text">Quick Tests</div>
            </div>
            <div class="feature">
                <div class="feature-icon">📊</div>
                <div class="feature-text">Track Progress</div>
            </div>
            <div class="feature">
                <div class="feature-icon">🏆</div>
                <div class="feature-text">Get Results</div>
            </div>
        </div>
        
        <div class="button-group">
            <a href="login.jsp" class="btn btn-login">
                <span>🔐</span> Login
            </a>
            <a href="register.jsp" class="btn btn-register">
                <span>✨</span> Register
            </a>
        </div>
    </div>
</body>
</html>
