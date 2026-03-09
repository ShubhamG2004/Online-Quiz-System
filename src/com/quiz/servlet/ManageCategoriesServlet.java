package com.quiz.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.quiz.dao.CategoryDAO;
import com.quiz.model.Category;

public class ManageCategoriesServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        CategoryDAO categoryDAO = new CategoryDAO();

        if ("add".equals(action)) {
            String name = request.getParameter("name");
            String description = request.getParameter("description");

            Category category = new Category();
            category.setName(name);
            category.setDescription(description);

            boolean success = categoryDAO.addCategory(category);
            if (success) {
                response.sendRedirect("categories.jsp?success=added");
            } else {
                response.sendRedirect("categories.jsp?error=add_failed");
            }
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");

            Category category = new Category(id, name, description);
            boolean success = categoryDAO.updateCategory(category);
            
            if (success) {
                response.sendRedirect("categories.jsp?success=updated");
            } else {
                response.sendRedirect("categories.jsp?error=update_failed");
            }
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean success = categoryDAO.deleteCategory(id);
            
            if (success) {
                response.sendRedirect("categories.jsp?success=deleted");
            } else {
                response.sendRedirect("categories.jsp?error=delete_failed");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
