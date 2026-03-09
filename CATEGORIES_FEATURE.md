# Question Categories Feature - Documentation

## Overview
The Question Categories feature allows you to organize quiz questions by subject or topic, making it easier to manage questions and potentially create category-specific quizzes in the future.

## What's New

### 1. Database Changes
- **New Table**: `categories` - Stores category information (id, name, description)
- **Updated Table**: `questions` - Added `category_id` field to link questions to categories
- **Default Categories**: 5 pre-populated categories:
  - Java Programming
  - Database
  - Web Development
  - Data Structures
  - General Knowledge

### 2. New Java Classes

#### Model Classes
- **`Category.java`** (`src/com/quiz/model/Category.java`)
  - Represents a category with id, name, and description
  - Includes getters and setters for all fields

#### DAO Classes
- **`CategoryDAO.java`** (`src/com/quiz/dao/CategoryDAO.java`)
  - `getAllCategories()` - Retrieve all categories
  - `getCategoryById(int id)` - Get a specific category
  - `addCategory(Category)` - Add a new category
  - `updateCategory(Category)` - Update existing category
  - `deleteCategory(int id)` - Delete a category

#### Updated Classes
- **`Question.java`** - Added categoryId and categoryName fields
- **`QuestionDAO.java`** - Updated to handle category information:
  - `getAllQuestions()` - Now includes category data via JOIN
  - `getQuestionsByCategory(int categoryId)` - NEW: Filter questions by category
  - `addQuestion(Question)` - Now accepts category_id

### 3. New Servlet
- **`ManageCategoriesServlet.java`** (`src/com/quiz/servlet/ManageCategoriesServlet.java`)
  - Handles add, update, and delete operations for categories
  - Mapped to `/ManageCategoriesServlet` in web.xml

### 4. Updated Web Pages

#### admin.jsp
- Added category dropdown before the question field
- Categories are dynamically loaded from the database
- Link to "Manage Categories" page added to navigation

#### categories.jsp (NEW)
- View all existing categories
- Add new categories with name and description
- Delete categories (questions move to "General" category)
- Beautiful, modern UI consistent with the rest of the application

### 5. Updated Configuration
- **web.xml** - Added servlet mapping for `ManageCategoriesServlet`

## Installation Instructions

### For New Installations
1. Simply run `database_setup.sql` - it includes all category tables and sample data

### For Existing Installations
1. **Backup your database first!**
2. Run `database_migration_categories.sql` to add the categories feature
3. Existing questions will default to category_id = 1 (General Knowledge)
4. Restart your application server

## Usage Guide

### Managing Categories
1. Navigate to Admin Panel (admin.jsp)
2. Click "📚 Manage Categories" button
3. **To Add a Category:**
   - Fill in the category name (required)
   - Add an optional description
   - Click "Add Category"
4. **To Delete a Category:**
   - Click the "🗑️ Delete" button next to any category
   - Confirm the deletion
   - Note: Questions in the deleted category will be moved to "General Knowledge"

### Adding Questions with Categories
1. Go to Admin Panel (admin.jsp)
2. Select a category from the dropdown (required)
3. Fill in the question and options
4. Submit the form

### Future Enhancements (Not Yet Implemented)
The following features can be easily added using the existing infrastructure:
- Filter quiz questions by category on the quiz page
- Display category statistics (question count per category)
- Allow users to select which category they want to be quizzed on
- Category-based leaderboards
- Edit category functionality

## API Reference

### CategoryDAO Methods
```java
// Get all categories
List<Category> getAllCategories()

// Get category by ID
Category getCategoryById(int id)

// Add new category
boolean addCategory(Category category)

// Update category
boolean updateCategory(Category category)

// Delete category
boolean deleteCategory(int id)
```

### QuestionDAO New/Updated Methods
```java
// Get questions filtered by category
List<Question> getQuestionsByCategory(int categoryId)

// Get all questions with category information
List<Question> getAllQuestions() // Now includes category data
```

## Database Schema

### categories Table
```sql
CREATE TABLE categories(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### questions Table (Updated)
```sql
CREATE TABLE questions(
    id INT AUTO_INCREMENT PRIMARY KEY,
    question TEXT NOT NULL,
    option1 VARCHAR(255) NOT NULL,
    option2 VARCHAR(255) NOT NULL,
    option3 VARCHAR(255) NOT NULL,
    option4 VARCHAR(255) NOT NULL,
    answer VARCHAR(1) NOT NULL,
    category_id INT DEFAULT 1,  -- NEW FIELD
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET DEFAULT
);
```

## Technical Notes

### Foreign Key Behavior
- When a category is deleted, associated questions are set to category_id = 1 (General Knowledge)
- This is handled by the `ON DELETE SET DEFAULT` constraint

### Category Names Must Be Unique
- The database enforces unique category names
- Attempting to add duplicate categories will fail

### Default Category
- All new questions without a specified category default to category_id = 1
- Ensure "General Knowledge" (or your default category) always exists

## Troubleshooting

### Problem: Questions not showing categories
**Solution**: Run the migration script to add the category_id column to existing questions

### Problem: Category dropdown is empty
**Solution**: Verify categories exist in the database:
```sql
SELECT * FROM categories;
```
If empty, insert the default categories from `database_setup.sql`

### Problem: Cannot delete category
**Solution**: This may occur if you try to delete category_id = 1 or if there's a foreign key constraint issue. Verify the foreign key is set correctly.

## Files Modified/Created

### Created:
- `src/com/quiz/model/Category.java`
- `src/com/quiz/dao/CategoryDAO.java`
- `src/com/quiz/servlet/ManageCategoriesServlet.java`
- `WebContent/categories.jsp`
- `database_migration_categories.sql`
- `CATEGORIES_FEATURE.md` (this file)

### Modified:
- `src/com/quiz/model/Question.java`
- `src/com/quiz/dao/QuestionDAO.java`
- `src/com/quiz/servlet/AddQuestionServlet.java`
- `WebContent/admin.jsp`
- `WebContent/WEB-INF/web.xml`
- `database_setup.sql`

## Future Development Ideas

1. **Category-Based Quiz Selection**: Allow users to choose which category to be quizzed on
2. **Mixed Category Quizzes**: Create quizzes with questions from multiple categories
3. **Category Statistics**: Show how many questions exist in each category
4. **Category Icons**: Add custom icons for each category
5. **Subcategories**: Implement a hierarchical category system
6. **Category-Based Difficulty**: Assign difficulty levels within each category
7. **Edit Categories**: Add UI to edit category names and descriptions
8. **Category Permissions**: Allow different admin levels for different categories

## Support
For issues or questions, please refer to the main project documentation or contact the development team.
