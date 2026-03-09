<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.quiz.dao.CategoryDAO, com.quiz.model.Category" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Categories - Online Quiz System</title>
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
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        max-width: 1000px;
        margin: 0 auto;
        animation: fadeIn 0.6s ease;
    }
    
    .header {
        text-align: center;
        margin-bottom: 30px;
    }
    
    .category-icon {
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
    
    .alert {
        padding: 15px 20px;
        border-radius: 12px;
        margin-bottom: 25px;
        font-size: 15px;
        text-align: center;
        font-weight: 500;
        animation: fadeIn 0.4s ease;
    }
    
    .alert-success {
        background: linear-gradient(135deg, #d4edda 0%, #c3e6cb 100%);
        color: #155724;
        border: 2px solid #c3e6cb;
    }
    
    .alert-error {
        background: linear-gradient(135deg, #f8d7da 0%, #f5c6cb 100%);
        color: #721c24;
        border: 2px solid #f5c6cb;
    }
    
    .form-section {
        background: #f8f9fa;
        padding: 25px;
        border-radius: 15px;
        margin-bottom: 30px;
    }
    
    .form-section h3 {
        color: #2d3748;
        margin-bottom: 20px;
        font-size: 20px;
    }
    
    .form-group {
        margin-bottom: 20px;
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
    
    input[type="text"], textarea {
        width: 100%;
        padding: 12px 16px;
        border: 2px solid #e2e8f0;
        border-radius: 10px;
        font-size: 15px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        transition: all 0.3s ease;
    }
    
    input[type="text"]:focus, textarea:focus {
        outline: none;
        border-color: #667eea;
        box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }
    
    textarea {
        resize: vertical;
        min-height: 80px;
    }
    
    .btn {
        padding: 12px 24px;
        border: none;
        border-radius: 10px;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        display: inline-block;
    }
    
    .btn-primary {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
    }
    
    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(102, 126, 234, 0.5);
    }
    
    .btn-danger {
        background: linear-gradient(135deg, #f12711 0%, #f5af19 100%);
        color: white;
    }
    
    .btn-secondary {
        background: #6c757d;
        color: white;
    }
    
    .categories-list {
        margin-top: 20px;
    }
    
    .category-card {
        background: white;
        border: 2px solid #e2e8f0;
        border-radius: 12px;
        padding: 20px;
        margin-bottom: 15px;
        transition: all 0.3s ease;
    }
    
    .category-card:hover {
        border-color: #667eea;
        box-shadow: 0 4px 15px rgba(102, 126, 234, 0.2);
    }
    
    .category-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 10px;
    }
    
    .category-name {
        font-size: 18px;
        font-weight: 700;
        color: #2d3748;
    }
    
    .category-description {
        color: #718096;
        font-size: 14px;
        line-height: 1.6;
    }
    
    .category-actions {
        display: flex;
        gap: 10px;
    }
    
    .btn-small {
        padding: 8px 16px;
        font-size: 13px;
    }
    
    .nav-links {
        display: flex;
        gap: 15px;
        justify-content: center;
        margin-top: 30px;
    }
    
    @media (max-width: 768px) {
        .container {
            padding: 30px 20px;
        }
        
        .category-header {
            flex-direction: column;
            align-items: flex-start;
            gap: 10px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="category-icon">📚</div>
            <h2>Manage Categories</h2>
            <p class="subtitle">Organize quiz questions by subject/category</p>
        </div>
        
        <%
            String success = request.getParameter("success");
            String error = request.getParameter("error");
            
            if (success != null) {
                if (success.equals("added")) {
        %>
        <div class="alert alert-success">
            ✅ Category added successfully!
        </div>
        <%
                } else if (success.equals("updated")) {
        %>
        <div class="alert alert-success">
            ✅ Category updated successfully!
        </div>
        <%
                } else if (success.equals("deleted")) {
        %>
        <div class="alert alert-success">
            ✅ Category deleted successfully!
        </div>
        <%
                }
            }
            
            if (error != null) {
        %>
        <div class="alert alert-error">
            ❌ Operation failed. Please try again.
        </div>
        <%
            }
        %>
        
        <div class="form-section">
            <h3>➕ Add New Category</h3>
            <form action="ManageCategoriesServlet" method="post">
                <input type="hidden" name="action" value="add">
                
                <div class="form-group">
                    <label for="name">Category Name <span class="required">*</span></label>
                    <input type="text" id="name" name="name" placeholder="e.g., Java Programming" required>
                </div>
                
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" placeholder="Brief description of this category..."></textarea>
                </div>
                
                <button type="submit" class="btn btn-primary">Add Category</button>
            </form>
        </div>
        
        <div class="categories-list">
            <h3 style="color: #2d3748; margin-bottom: 20px;">📋 Existing Categories</h3>
            
            <%
                CategoryDAO categoryDAO = new CategoryDAO();
                List<Category> categories = categoryDAO.getAllCategories();
                
                if (categories.isEmpty()) {
            %>
            <p style="text-align: center; color: #718096; padding: 20px;">No categories found. Add your first category above!</p>
            <%
                } else {
                    for(Category cat : categories) {
            %>
            <div class="category-card">
                <div class="category-header">
                    <div>
                        <div class="category-name"><%= cat.getName() %></div>
                        <div class="category-description">
                            <%= cat.getDescription() != null ? cat.getDescription() : "No description provided" %>
                        </div>
                    </div>
                    <div class="category-actions">
                        <form action="ManageCategoriesServlet" method="post" style="display: inline;" 
                              onsubmit="return confirm('Are you sure you want to delete this category? Questions in this category will be moved to General.');">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="<%= cat.getId() %>">
                            <button type="submit" class="btn btn-danger btn-small">🗑️ Delete</button>
                        </form>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
        
        <div class="nav-links">
            <a href="admin.jsp" class="btn btn-primary">➕ Add Questions</a>
            <a href="LeaderboardServlet" class="btn btn-secondary">🏆 Leaderboard</a>
            <a href="index.jsp" class="btn btn-secondary">🏠 Home</a>
        </div>
    </div>
</body>
</html>
