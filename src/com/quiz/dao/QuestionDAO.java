package com.quiz.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.quiz.model.Question;
import com.quiz.util.DBConnection;

public class QuestionDAO {

    public List<Question> getAllQuestions() {
        List<Question> questions = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT q.*, c.name as category_name FROM questions q " +
                "LEFT JOIN categories c ON q.category_id = c.id"
            );

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setQuestion(rs.getString("question"));
                q.setOption1(rs.getString("option1"));
                q.setOption2(rs.getString("option2"));
                q.setOption3(rs.getString("option3"));
                q.setOption4(rs.getString("option4"));
                q.setAnswer(rs.getString("answer"));
                q.setCategoryId(rs.getInt("category_id"));
                q.setCategoryName(rs.getString("category_name"));
                questions.add(q);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return questions;
    }

    public List<Question> getQuestionsByCategory(int categoryId) {
        List<Question> questions = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT q.*, c.name as category_name FROM questions q " +
                "LEFT JOIN categories c ON q.category_id = c.id " +
                "WHERE q.category_id = ?"
            );
            ps.setInt(1, categoryId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setId(rs.getInt("id"));
                q.setQuestion(rs.getString("question"));
                q.setOption1(rs.getString("option1"));
                q.setOption2(rs.getString("option2"));
                q.setOption3(rs.getString("option3"));
                q.setOption4(rs.getString("option4"));
                q.setAnswer(rs.getString("answer"));
                q.setCategoryId(rs.getInt("category_id"));
                q.setCategoryName(rs.getString("category_name"));
                questions.add(q);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return questions;
    }

    public Question getQuestionById(int id) {
        Question q = null;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT q.*, c.name as category_name FROM questions q " +
                "LEFT JOIN categories c ON q.category_id = c.id " +
                "WHERE q.id=?"
            );
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                q = new Question();
                q.setId(rs.getInt("id"));
                q.setQuestion(rs.getString("question"));
                q.setOption1(rs.getString("option1"));
                q.setOption2(rs.getString("option2"));
                q.setOption3(rs.getString("option3"));
                q.setOption4(rs.getString("option4"));
                q.setAnswer(rs.getString("answer"));
                q.setCategoryId(rs.getInt("category_id"));
                q.setCategoryName(rs.getString("category_name"));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return q;
    }

    public boolean addQuestion(Question question) {
        boolean isInserted = false;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO questions(question,option1,option2,option3,option4,answer,category_id) VALUES(?,?,?,?,?,?,?)"
            );
            ps.setString(1, question.getQuestion());
            ps.setString(2, question.getOption1());
            ps.setString(3, question.getOption2());
            ps.setString(4, question.getOption3());
            ps.setString(5, question.getOption4());
            ps.setString(6, question.getAnswer());
            ps.setInt(7, question.getCategoryId());

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
}
