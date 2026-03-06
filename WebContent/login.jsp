<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - Online Quiz System</title>
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
    
    @keyframes shake {
        0%, 100% { transform: translateX(0); }
        25% { transform: translateX(-10px); }
        75% { transform: translateX(10px); }
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
        padding: 50px 40px;
        border-radius: 20px;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        width: 100%;
        max-width: 440px;
        animation: fadeIn 0.6s ease;
    }
    
    .header {
        text-align: center;
        margin-bottom: 35px;
    }
    
    .logo {
        font-size: 56px;
        margin-bottom: 15px;
    }
    
    h2 {
        color: #2d3748;
        margin-bottom: 10px;
        font-size: 28px;
        font-weight: 700;
    }
    
    .subtitle {
        color: #718096;
        font-size: 14px;
    }
    
    .form-group {
        margin-bottom: 25px;
        position: relative;
    }
    
    label {
        display: block;
        margin-bottom: 8px;
        color: #4a5568;
        font-weight: 600;
        font-size: 14px;
    }
    
    .input-wrapper {
        position: relative;
    }
    
    .input-icon {
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: #a0aec0;
        font-size: 18px;
    }
    
    input[type="email"], input[type="password"] {
        width: 100%;
        padding: 14px 15px 14px 45px;
        border: 2px solid #e2e8f0;
        border-radius: 12px;
        font-size: 15px;
        transition: all 0.3s ease;
        font-family: inherit;
    }
    
    input[type="email"]:focus, input[type="password"]:focus {
        outline: none;
        border-color: #667eea;
        box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }
    
    input[type="submit"] {
        width: 100%;
        padding: 14px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border: none;
        border-radius: 12px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        margin-top: 10px;
    }
    
    input[type="submit"]:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(102, 126, 234, 0.5);
    }
    
    input[type="submit"]:active {
        transform: translateY(0);
    }
    
    .alert {
        padding: 12px 15px;
        border-radius: 10px;
        margin-bottom: 20px;
        font-size: 14px;
        text-align: center;
        animation: fadeIn 0.4s ease;
    }
    
    .error {
        background-color: #fed7d7;
        color: #c53030;
        border: 1px solid #fc8181;
        animation: shake 0.5s ease;
    }
    
    .success {
        background-color: #c6f6d5;
        color: #2f855a;
        border: 1px solid #9ae6b4;
    }
    
    .link {
        text-align: center;
        margin-top: 25px;
        color: #718096;
        font-size: 14px;
    }
    
    .link a {
        color: #667eea;
        text-decoration: none;
        font-weight: 600;
        transition: all 0.2s ease;
    }
    
    .link a:hover {
        color: #5568d3;
        text-decoration: underline;
    }
    
    .divider {
        display: flex;
        align-items: center;
        margin: 25px 0;
        color: #a0aec0;
        font-size: 13px;
    }
    
    .divider::before,
    .divider::after {
        content: '';
        flex: 1;
        height: 1px;
        background: #e2e8f0;
    }
    
    .divider span {
        padding: 0 15px;
    }
    
    @media (max-width: 480px) {
        .container {
            padding: 40px 30px;
        }
        h2 {
            font-size: 24px;
        }
        .logo {
            font-size: 48px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo">🔐</div>
            <h2>Welcome Back</h2>
            <p class="subtitle">Login to continue your learning journey</p>
        </div>
        
        <%
            String error = request.getParameter("error");
            if (error != null && error.equals("1")) {
        %>
        <div class="alert error">
            ❌ Invalid email or password!
        </div>
        <%
            }
            String success = request.getParameter("success");
            if (success != null && success.equals("1")) {
        %>
        <div class="alert success">
            ✅ Registration successful! Please login.
        </div>
        <%
            }
        %>
        
        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="email">Email Address</label>
                <div class="input-wrapper">
                    <span class="input-icon">📧</span>
                    <input type="email" id="email" name="email" placeholder="you@example.com" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <div class="input-wrapper">
                    <span class="input-icon">🔒</span>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
            </div>
            
            <input type="submit" value="Login to Account">
        </form>
        
        <div class="divider"><span>or</span></div>
        
        <div class="link">
            Don't have an account? <a href="register.jsp">Create one now</a>
        </div>
    </div>
</body>
</html>
