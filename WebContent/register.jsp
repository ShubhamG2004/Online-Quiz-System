<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register - Online Quiz System</title>
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
    
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
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
    
    input[type="text"], input[type="email"], input[type="password"] {
        width: 100%;
        padding: 14px 15px 14px 45px;
        border: 2px solid #e2e8f0;
        border-radius: 12px;
        font-size: 15px;
        transition: all 0.3s ease;
        font-family: inherit;
    }
    
    input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus {
        outline: none;
        border-color: #f5576c;
        box-shadow: 0 0 0 3px rgba(245, 87, 108, 0.1);
    }
    
    input[type="submit"] {
        width: 100%;
        padding: 14px;
        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        color: white;
        border: none;
        border-radius: 12px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        box-shadow: 0 4px 15px rgba(245, 87, 108, 0.4);
        margin-top: 10px;
    }
    
    input[type="submit"]:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(245, 87, 108, 0.5);
    }
    
    input[type="submit"]:active {
        transform: translateY(0);
    }
    
    .link {
        text-align: center;
        margin-top: 25px;
        color: #718096;
        font-size: 14px;
    }
    
    .link a {
        color: #f5576c;
        text-decoration: none;
        font-weight: 600;
        transition: all 0.2s ease;
    }
    
    .link a:hover {
        color: #e4465b;
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
            <div class="logo">✨</div>
            <h2>Create Account</h2>
            <p class="subtitle">Join us and start your quiz journey today</p>
        </div>
        
        <form action="RegisterServlet" method="post">
            <div class="form-group">
                <label for="name">Full Name</label>
                <div class="input-wrapper">
                    <span class="input-icon">👤</span>
                    <input type="text" id="name" name="name" placeholder="John Doe" required>
                </div>
            </div>
            
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
                    <input type="password" id="password" name="password" placeholder="Create a strong password" required>
                </div>
            </div>
            
            <input type="submit" value="Create Account">
        </form>
        
        <div class="divider"><span>or</span></div>
        
        <div class="link">
            Already have an account? <a href="login.jsp">Login here</a>
        </div>
    </div>
</body>
</html>
