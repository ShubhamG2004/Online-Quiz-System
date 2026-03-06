<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Panel - Online Quiz System</title>
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
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        padding: 20px;
    }
    
    .container {
        background: white;
        padding: 50px 40px;
        border-radius: 20px;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        max-width: 700px;
        margin: 0 auto;
        animation: fadeIn 0.6s ease;
    }
    
    .header {
        text-align: center;
        margin-bottom: 40px;
    }
    
    .admin-icon {
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
    
    .alert-success {
        padding: 15px 20px;
        background: linear-gradient(135deg, #d4edda 0%, #c3e6cb 100%);
        color: #155724;
        border: 2px solid #c3e6cb;
        border-radius: 12px;
        margin-bottom: 25px;
        font-size: 15px;
        text-align: center;
        font-weight: 500;
        animation: fadeIn 0.4s ease;
    }
    
    .form-group {
        margin-bottom: 25px;
    }
    
    label {
        display: block;
        margin-bottom: 8px;
        color: #4a5568;
        font-weight: 600;
        font-size: 14px;
    }
    
    .required {
        color: #e53e3e;
    }
    
    input[type="text"], textarea, select {
        width: 100%;
        padding: 14px 16px;
        border: 2px solid #e2e8f0;
        border-radius: 12px;
        font-size: 15px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        transition: all 0.3s ease;
        background: white;
    }
    
    input[type="text"]:focus, textarea:focus, select:focus {
        outline: none;
        border-color: #667eea;
        box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }
    
    textarea {
        resize: vertical;
        min-height: 100px;
        line-height: 1.6;
    }
    
    select {
        cursor: pointer;
        appearance: none;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23667eea' d='M6 9L1 4h10z'/%3E%3C/svg%3E");
        background-repeat: no-repeat;
        background-position: right 16px center;
        padding-right: 45px;
    }
    
    .options-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 15px;
    }
    
    input[type="submit"] {
        width: 100%;
        padding: 16px;
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
    
    .section-title {
        font-size: 16px;
        font-weight: 600;
        color: #2d3748;
        margin-top: 30px;
        margin-bottom: 15px;
        padding-bottom: 10px;
        border-bottom: 2px solid #e2e8f0;
    }
    
    @media (max-width: 768px) {
        .container {
            padding: 40px 25px;
        }
        
        .options-grid {
            grid-template-columns: 1fr;
        }
        
        h2 {
            font-size: 24px;
        }
        
        .admin-icon {
            font-size: 48px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="admin-icon">👨‍💼</div>
            <h2>Admin Panel</h2>
            <p class="subtitle">Create and manage quiz questions</p>
        </div>
        
        <%
            String success = request.getParameter("success");
            if (success != null && success.equals("1")) {
        %>
        <div class="alert-success">
            ✅ Question added successfully!
        </div>
        <%
            }
        %>
        
        <form action="AddQuestionServlet" method="post">
            <div class="form-group">
                <label for="question">Question <span class="required">*</span></label>
                <textarea id="question" name="question" placeholder="Enter your question here..." required></textarea>
            </div>
            
            <div class="section-title">📝 Answer Options</div>
            
            <div class="options-grid">
                <div class="form-group">
                    <label for="option1">Option 1 <span class="required">*</span></label>
                    <input type="text" id="option1" name="option1" placeholder="First option" required>
                </div>
                
                <div class="form-group">
                    <label for="option2">Option 2 <span class="required">*</span></label>
                    <input type="text" id="option2" name="option2" placeholder="Second option" required>
                </div>
                
                <div class="form-group">
                    <label for="option3">Option 3 <span class="required">*</span></label>
                    <input type="text" id="option3" name="option3" placeholder="Third option" required>
                </div>
                
                <div class="form-group">
                    <label for="option4">Option 4 <span class="required">*</span></label>
                    <input type="text" id="option4" name="option4" placeholder="Fourth option" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="answer">Correct Answer <span class="required">*</span></label>
                <select id="answer" name="answer" required>
                    <option value="">-- Select the correct answer --</option>
                    <option value="a">Option 1</option>
                    <option value="b">Option 2</option>
                    <option value="c">Option 3</option>
                    <option value="d">Option 4</option>
                </select>
            </div>
            
            <input type="submit" value="➕ Add Question to Quiz">
        </form>
    </div>
</body>
</html>
