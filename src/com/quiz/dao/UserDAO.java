package com.quiz.dao;

import java.sql.*;
import com.quiz.model.User;
import com.quiz.util.DBConnection;

public class UserDAO {

    public boolean registerUser(User user) {
        boolean isInserted = false;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("insert into users(name,email,password) values(?,?,?)");
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());

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

    public User loginUser(String email, String password) {
        User user = null;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from users where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public User getUserById(int id) {
        User user = null;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from users where id=?");
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
