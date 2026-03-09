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

-- Categories Table
CREATE TABLE IF NOT EXISTS categories(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
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
    category_id INT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET DEFAULT
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

-- Sample Categories
INSERT INTO categories(name, description) VALUES
('Java Programming', 'Questions related to Java programming language, syntax, and concepts'),
('Database', 'Questions about SQL, databases, and data management'),
('Web Development', 'Questions related to HTML, CSS, JavaScript, and web technologies'),
('Data Structures', 'Questions about arrays, linked lists, trees, graphs, and algorithms'),
('General Knowledge', 'Miscellaneous questions on various topics');

-- Sample Questions (with Categories)
INSERT INTO questions(question, option1, option2, option3, option4, answer, category_id) VALUES
('What is Java?', 'Programming Language', 'Database', 'Browser', 'Operating System', 'a', 1),
('Which keyword is used to create a class in Java?', 'def', 'class', 'struct', 'interface', 'b', 1),
('What is Java Virtual Machine (JVM)?', 'Hardware', 'An abstract machine', 'Software library', 'Browser', 'b', 1),
('Which statement is true about Java?', 'Platform dependent', 'Platform independent', 'Not secure', 'Slow', 'b', 1),
('What is the size of float in Java?', '4 bytes', '8 bytes', '2 bytes', '1 byte', 'a', 1),
('What does SQL stand for?', 'Structured Query Language', 'Simple Question Language', 'System Quality Logic', 'Server Query List', 'a', 2),
('Which HTML tag is used for creating a hyperlink?', '<link>', '<a>', '<href>', '<url>', 'b', 3),
('What is the time complexity of binary search?', 'O(n)', 'O(log n)', 'O(n^2)', 'O(1)', 'b', 4);

-- Display all tables
SHOW TABLES;
