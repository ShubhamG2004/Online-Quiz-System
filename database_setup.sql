-- Online Quiz System Database Setup Script
-- Execute this script in MySQL to set up the database

CREATE DATABASE IF NOT EXISTS quizdb;
USE quizdb;

-- Users Table
CREATE TABLE IF NOT EXISTS users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Questions Table
CREATE TABLE IF NOT EXISTS questions(
    id INT AUTO_INCREMENT PRIMARY KEY,
    question TEXT NOT NULL,
    option1 VARCHAR(255) NOT NULL,
    option2 VARCHAR(255) NOT NULL,
    option3 VARCHAR(255) NOT NULL,
    option4 VARCHAR(255) NOT NULL,
    answer VARCHAR(1) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Results Table
CREATE TABLE IF NOT EXISTS results(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    score INT NOT NULL,
    total_questions INT DEFAULT 5,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Sample Questions (Optional)
INSERT INTO questions(question, option1, option2, option3, option4, answer) VALUES
('What is Java?', 'Programming Language', 'Database', 'Browser', 'Operating System', 'a'),
('Which keyword is used to create a class in Java?', 'def', 'class', 'struct', 'interface', 'b'),
('What is Java Virtual Machine (JVM)?', 'Hardware', 'An abstract machine', 'Software library', 'Browser', 'b'),
('Which statement is true about Java?', 'Platform dependent', 'Platform independent', 'Not secure', 'Slow', 'b'),
('What is the size of float in Java?', '4 bytes', '8 bytes', '2 bytes', '1 byte', 'a');

-- Display all tables
SHOW TABLES;
