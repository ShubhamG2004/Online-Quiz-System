# Online Quiz System

A web-based quiz management system built with Java Servlets, JSP, MySQL, and Apache Tomcat.

## 🎯 Project Overview

This is a complete online quiz system where users can:
- Register and login
- Take timed quizzes (60 seconds)
- View their scores and performance
- Admins can add new questions
- Track quiz results

## 🛠️ Tech Stack

| Component | Technology |
|-----------|-----------|
| Frontend | JSP, HTML, CSS, JavaScript |
| Backend | Java Servlet |
| Database | MySQL |
| Server | Apache Tomcat 8.5+ |
| Connection | JDBC (MySQL Connector/J) |

## 📁 Project Structure

```
OnlineQuizSystem/
│
├── src/com/quiz/
│   ├── servlet/
│   │   ├── LoginServlet.java
│   │   ├── RegisterServlet.java
│   │   ├── QuizServlet.java
│   │   ├── ResultServlet.java
│   │   └── AddQuestionServlet.java
│   │
│   ├── dao/
│   │   ├── UserDAO.java
│   │   └── QuestionDAO.java
│   │
│   ├── model/
│   │   ├── User.java
│   │   ├── Question.java
│   │   └── Result.java
│   │
│   └── util/
│       └── DBConnection.java
│
├── WebContent/
│   ├── index.jsp
│   ├── login.jsp
│   ├── register.jsp
│   ├── quiz.jsp
│   ├── result.jsp
│   ├── admin.jsp
│   │
│   └── WEB-INF/
│       └── web.xml
│
├── database_setup.sql
└── README.md
```

## 🚀 Setup Instructions

### Prerequisites
- Java JDK 8 or higher
- MySQL Server (5.7 or higher)
- Apache Tomcat 8.5 or higher
- MySQL Connector/J (JDBC Driver)

### Step 1: Database Setup

1. Open MySQL command line or MySQL Workbench
2. Execute the `database_setup.sql` script:
   ```sql
   SOURCE path/to/database_setup.sql;
   ```
   Or copy and paste the contents directly

3. Verify the database and tables are created:
   ```sql
   USE quizdb;
   SHOW TABLES;
   ```

### Step 2: MySQL Configuration

Update the DB connection parameters in [DBConnection.java](src/com/quiz/util/DBConnection.java):

```java
con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/quizdb",
    "root",           // Change your username
    "password"        // Change your password
);
```

### Step 3: Download MySQL JDBC Driver

1. Download MySQL Connector/J from: https://dev.mysql.com/downloads/connector/j/
2. Extract the JAR file
3. Copy `mysql-connector-java-x.x.x.jar` to:
   - `WebContent/WEB-INF/lib/` (create lib folder if it doesn't exist)

### Step 4: Compile Java Files

Navigate to project root and compile:

```bash
javac -d bin -cp src src/com/quiz/util/*.java
javac -d bin -cp src src/com/quiz/model/*.java
javac -d bin -cp src:WebContent/WEB-INF/lib/* src/com/quiz/dao/*.java
javac -d bin -cp src:WebContent/WEB-INF/lib/* src/com/quiz/servlet/*.java
```

Or use an IDE like Eclipse/IntelliJ to build automatically.

### Step 5: Deploy on Tomcat

1. **Create WAR file** or deploy directly:
   - Copy the entire project folder to: `TOMCAT_HOME/webapps/OnlineQuiz`

2. **For WAR deployment:**
   - Package into WAR: `jar -cvf OnlineQuiz.war -C WebContent .`
   - Copy to: `TOMCAT_HOME/webapps/`

3. **Start Tomcat:**
   ```bash
   cd TOMCAT_HOME/bin
   ./startup.sh          # Linux/Mac
   startup.bat           # Windows
   ```

4. **Access the application:**
   - Open browser: `http://localhost:8080/OnlineQuiz`

## 📖 User Guide

### For Students

1. **Homepage** - Choose to Login or Register
2. **Register** - Create a new account with name, email, and password
3. **Login** - Login with your credentials
4. **Quiz** - Answer 5 questions in 60 seconds
5. **Result** - View your score and percentage

### For Administrators

1. Navigate to `admin.jsp`
2. Add new questions with 4 options and correct answer
3. Questions will be available for all users in the quiz

## 🔑 Default Test Credentials

After database setup, you can create test users:

```sql
INSERT INTO users(name, email, password) VALUES
('John Doe', 'john@example.com', 'password123'),
('Jane Smith', 'jane@example.com', 'password456');
```

Login with:
- Email: `john@example.com`
- Password: `password123`

## 🎨 Features Included

✅ User Registration and Login  
✅ Session Management  
✅ Timed Quiz (60 seconds)  
✅ Multiple Choice Questions  
✅ Score Calculation  
✅ Result Display with Percentage  
✅ Admin Panel for Adding Questions  
✅ Responsive Design  
✅ Database Integration (JDBC)  

## 🚀 Advanced Features (For Resume Enhancement)

Consider adding these features:

- ✨ **Random Questions** - Shuffle questions for each quiz attempt
- ⏰ **Pagination** - Display questions one by one
- 🏆 **Leaderboard** - Show top scorers with ranking
- 📊 **Result History** - View past quiz attempts
- 🔐 **Password Hashing** - Use BCrypt for password security
- 📧 **Email Verification** - Verify emails during registration
- 🎯 **Difficulty Levels** - Easy, Medium, Hard questions
- 📱 **Mobile Responsive** - Better mobile experience
- 🌙 **Dark Mode** - Toggle theme option
- 📈 **Analytics Dashboard** - Statistics for admins

## 🔧 Troubleshooting

### Common Issues

| Issue | Solution |
|-------|----------|
| "No suitable driver found" | Ensure MySQL JDBC JAR is in WEB-INF/lib |
| "Connection refused" | Check MySQL is running, verify host/port/credentials |
| "404 error" | Check servlet mapping in web.xml |
| "Session expired" | User session timed out, login again |
| "Table doesn't exist" | Run database_setup.sql script |

### Enable Debug Logging

In DBConnection.java, uncomment:
```java
System.out.println("Database connection successful!");
```

## 📝 File Descriptions

### Java Classes

- **DBConnection.java** - Manages database connections
- **User.java** - User model class
- **Question.java** - Question model class
- **Result.java** - Result model class
- **UserDAO.java** - Database operations for users
- **QuestionDAO.java** - Database operations for questions
- **LoginServlet.java** - Handles user login
- **RegisterServlet.java** - Handles user registration
- **QuizServlet.java** - Processes quiz submission
- **ResultServlet.java** - Displays results
- **AddQuestionServlet.java** - Adds questions by admin

### JSP Pages

- **index.jsp** - Homepage with login/register options
- **login.jsp** - User login page
- **register.jsp** - User registration page
- **quiz.jsp** - Quiz page with timer
- **result.jsp** - Results and score display
- **admin.jsp** - Admin panel to add questions

## 🔐 Security Notes

⚠️ **Important:** This is a learning project. For production:

1. Use password hashing (BCrypt/Argon2)
2. Implement parameterized queries (already done)
3. Add CSRF protection
4. Use HTTPS
5. Implement proper input validation
6. Add role-based access control (RBAC)
7. Use prepared statements (already implemented)
8. Implement rate limiting
9. Add logging and monitoring

## 📚 Learning Resources

- [Java Servlet Tutorial](https://docs.oracle.com/javaee/7/tutorial/servlets.htm)
- [JSP Tutorial](https://docs.oracle.com/javaee/7/tutorial/jsps.htm)
- [JDBC Guide](https://docs.oracle.com/javase/tutorial/jdbc/basics/index.html)
- [Apache Tomcat Documentation](https://tomcat.apache.org/tomcat-9.0-doc/)

## 🎓 For Interview/Resume

### Key Points to Highlight

1. **Full-stack web application** with MVC architecture
2. **Database design** with normalized tables and relationships
3. **Session management** for stateful operations
4. **JDBC** for database connectivity
5. **Prepared statements** to prevent SQL injection
6. **Servlet lifecycle** and request/response handling
7. **JSP templating** for dynamic content
8. **Timer implementation** using JavaScript
9. **Form handling** and validation
10. **Error handling** and exception management

### Potential Interview Questions

- "How does session management work in this project?"
- "Why use prepared statements instead of string concatenation?"
- "How to add random questions?"
- "Explain the flow from login to result display"
- "How would you scale this to handle 1000 concurrent users?"
- "How to implement password hashing?"

## 📞 Support

For issues or questions, refer to the troubleshooting section or check:
- Tomcat logs: `TOMCAT_HOME/logs/catalina.out`
- Browser console: F12 → Console tab
- MySQL logs: Check MySQL error log

## 📄 License

This project is created for educational purposes.

---

**Happy Coding! 🎉**

