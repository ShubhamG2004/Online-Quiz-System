-- Database Migration Script for Category Feature
-- Execute this script if you already have an existing database

USE quizdb;

-- Step 1: Create the categories table
CREATE TABLE IF NOT EXISTS categories(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 2: Insert default categories
INSERT INTO categories(name, description) VALUES
('Java Programming', 'Questions related to Java programming language, syntax, and concepts'),
('Database', 'Questions about SQL, databases, and data management'),
('Web Development', 'Questions related to HTML, CSS, JavaScript, and web technologies'),
('Data Structures', 'Questions about arrays, linked lists, trees, graphs, and algorithms'),
('General Knowledge', 'Miscellaneous questions on various topics');

-- Step 3: Add category_id column to questions table
ALTER TABLE questions 
ADD COLUMN category_id INT DEFAULT 1 AFTER answer;

-- Step 4: Add foreign key constraint
ALTER TABLE questions
ADD CONSTRAINT fk_category
FOREIGN KEY (category_id) REFERENCES categories(id)
ON DELETE SET DEFAULT;

-- Step 5: Optionally update existing questions to appropriate categories
-- Uncomment the following lines if you want to categorize existing questions
-- UPDATE questions SET category_id = 1 WHERE question LIKE '%Java%' OR question LIKE '%JVM%';
-- UPDATE questions SET category_id = 2 WHERE question LIKE '%SQL%' OR question LIKE '%database%';
-- UPDATE questions SET category_id = 3 WHERE question LIKE '%HTML%' OR question LIKE '%CSS%' OR question LIKE '%JavaScript%';
-- UPDATE questions SET category_id = 4 WHERE question LIKE '%array%' OR question LIKE '%search%' OR question LIKE '%complexity%';

-- Verify the changes
SELECT * FROM categories;
SELECT q.id, q.question, c.name as category FROM questions q 
LEFT JOIN categories c ON q.category_id = c.id 
LIMIT 10;
