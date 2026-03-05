<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel - Online Quiz System</title>
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
    h2 {
        color: #333;
        margin-bottom: 30px;
        text-align: center;
    }
    .form-group {
        margin-bottom: 20px;
    }
    label {
        display: block;
        margin-bottom: 5px;
        color: #555;
        font-weight: bold;
    }
    input[type="text"], textarea, select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 14px;
        font-family: Arial, sans-serif;
    }
    textarea {
        resize: vertical;
        min-height: 80px;
    }
    input[type="submit"] {
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
    input[type="submit"]:hover {
        background-color: #5568d3;
    }
    .success {
        color: green;
        text-align: center;
        margin-bottom: 15px;
        padding: 10px;
        background-color: #d4edda;
        border-radius: 5px;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Add New Question</h2>
        <%
            String success = request.getParameter("success");
            if (success != null && success.equals("1")) {
        %>
        <p class="success">Question added successfully!</p>
        <%
            }
        %>
        <form action="AddQuestionServlet" method="post">
            <div class="form-group">
                <label for="question">Question:</label>
                <textarea id="question" name="question" required></textarea>
            </div>
            <div class="form-group">
                <label for="option1">Option 1:</label>
                <input type="text" id="option1" name="option1" required>
            </div>
            <div class="form-group">
                <label for="option2">Option 2:</label>
                <input type="text" id="option2" name="option2" required>
            </div>
            <div class="form-group">
                <label for="option3">Option 3:</label>
                <input type="text" id="option3" name="option3" required>
            </div>
            <div class="form-group">
                <label for="option4">Option 4:</label>
                <input type="text" id="option4" name="option4" required>
            </div>
            <div class="form-group">
                <label for="answer">Correct Answer:</label>
                <select id="answer" name="answer" required>
                    <option value="">Select Answer</option>
                    <option value="a">Option 1</option>
                    <option value="b">Option 2</option>
                    <option value="c">Option 3</option>
                    <option value="d">Option 4</option>
                </select>
            </div>
            <input type="submit" value="Add Question">
        </form>
    </div>
</body>
</html>
