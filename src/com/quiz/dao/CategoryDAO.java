package com.quiz.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.quiz.model.Category;
import com.quiz.util.DBConnection;

public class CategoryDAO {

    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM categories ORDER BY name");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));
                categories.add(category);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }

    public Category getCategoryById(int id) {
        Category category = null;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM categories WHERE id=?");
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return category;
    }

    public boolean addCategory(Category category) {
        boolean isInserted = false;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO categories (name, description) VALUES (?, ?)"
            );
            ps.setString(1, category.getName());
            ps.setString(2, category.getDescription());

            int result = ps.executeUpdate();
            if (result > 0) {
                isInserted = true;
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isInserted;
    }

    public boolean updateCategory(Category category) {
        boolean isUpdated = false;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "UPDATE categories SET name=?, description=? WHERE id=?"
            );
            ps.setString(1, category.getName());
            ps.setString(2, category.getDescription());
            ps.setInt(3, category.getId());

            int result = ps.executeUpdate();
            if (result > 0) {
                isUpdated = true;
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isUpdated;
    }

    public boolean deleteCategory(int id) {
        boolean isDeleted = false;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM categories WHERE id=?");
            ps.setInt(1, id);

            int result = ps.executeUpdate();
            if (result > 0) {
                isDeleted = true;
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isDeleted;
    }
}
