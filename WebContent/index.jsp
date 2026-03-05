<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Quiz System</title>
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
    }
    .container {
        text-align: center;
        background: white;
        padding: 50px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    h1 {
        color: #333;
        margin-bottom: 30px;
    }
    .button-group {
        display: flex;
        gap: 20px;
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
    .btn-login {
        background-color: #667eea;
        color: white;
    }
    .btn-login:hover {
        background-color: #5568d3;
    }
    .btn-register {
        background-color: #764ba2;
        color: white;
    }
    .btn-register:hover {
        background-color: #653a8a;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Online Quiz System</h1>
        <p style="margin-bottom: 30px;">Test your knowledge with our engaging quizzes</p>
        <div class="button-group">
            <a href="login.jsp" class="btn btn-login">Login</a>
            <a href="register.jsp" class="btn btn-register">Register</a>
        </div>
    </div>
</body>
</html>
