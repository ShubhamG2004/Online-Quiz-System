# Quick Deployment Guide for Online Quiz System

## 🚀 Fastest Way to Deploy (5 Minutes)

### Prerequisites Check
- [ ] Java installed: `java -version`
- [ ] MySQL running: MySQL service started
- [ ] Tomcat downloaded and extracted

### Step 1: Database Setup (1 min)
```bash
# Open MySQL and run:
mysql -u root -p < database_setup.sql
# Enter password when prompted
```

### Step 2: Configure Database Connection (30 sec)
Edit `src/com/quiz/util/DBConnection.java`:
```java
// Change these values to match your setup:
"jdbc:mysql://localhost:3306/quizdb"  // Change localhost/port if needed
"root"                                  // Your MySQL username
"password"                              // Your MySQL password
```

### Step 3: Setup MySQL JDBC Driver (1 min)
1. Download: https://dev.mysql.com/downloads/connector/j/
2. Extract the JAR
3. Copy to: `WebContent/WEB-INF/lib/mysql-connector-java-x.x.x.jar`

### Step 4: Compile Project (1 min)
```bash
# Linux/Mac
cd OnlineQuiz
mkdir -p bin

# Compile all Java files
javac -d bin -cp "WebContent/WEB-INF/lib/*:src" src/com/quiz/util/*.java
javac -d bin -cp "WebContent/WEB-INF/lib/*:src:bin" src/com/quiz/model/*.java
javac -d bin -cp "WebContent/WEB-INF/lib/*:src:bin" src/com/quiz/dao/*.java
javac -d bin -cp "WebContent/WEB-INF/lib/*:src:bin" src/com/quiz/servlet/*.java
```

### Step 5: Deploy to Tomcat (1 min)
```bash
# Option A: Copy to webapps
cp -r . $TOMCAT_HOME/webapps/OnlineQuiz

# Option B: Or create WAR and deploy
jar -cvf OnlineQuiz.war -C WebContent .
cp OnlineQuiz.war $TOMCAT_HOME/webapps/

# Start Tomcat
$TOMCAT_HOME/bin/startup.sh    # Linux/Mac
$TOMCAT_HOME/bin/startup.bat   # Windows
```

### Step 6: Test Application (30 sec)
1. Open browser: http://localhost:8080/OnlineQuiz
2. Click "Register" and create a test account
3. Login and take the quiz
4. Check results

---

## 📋 Eclipse IDE Deployment (Recommended)

### Import Project
1. File → Import → Existing Projects into Workspace
2. Select OnlineQuiz folder
3. Right-click → Configure → Convert to Faceted Form
4. Check "Dynamic Web Module"
5. Apply

### Configure Tomcat
1. Window → Preferences → Server → Runtime Environments
2. Add Apache Tomcat 8.5/9.0
3. Select it as default

### Setup JDBC Driver
1. Project → Properties → Java Build Path
2. Add External JAR → Select MySQL Connector JAR
3. Add to Deployment Assembly

### Run Project
1. Right-click Project → Run As → Run on Server
2. Select Tomcat server
3. Finish

---

## 🐧 Linux/Unix Deployment

### On Ubuntu/Debian
```bash
# Install dependencies
sudo apt-get install default-jdk
sudo apt-get install mysql-server
sudo apt-get install tomcat9

# Create directory
sudo mkdir -p /var/lib/tomcat9/webapps/OnlineQuiz
sudo cp -r OnlineQuiz/* /var/lib/tomcat9/webapps/OnlineQuiz/

# Change permissions
sudo chown -R tomcat9:tomcat9 /var/lib/tomcat9/webapps/OnlineQuiz

# Restart Tomcat
sudo systemctl restart tomcat9
```

---

## 🪟 Windows Deployment

### Manual Steps
1. Extract Tomcat to: `C:\Program Files\Tomcat`
2. Copy project to: `C:\Program Files\Tomcat\webapps\OnlineQuiz`
3. Run: `C:\Program Files\Tomcat\bin\startup.bat`
4. Open: `http://localhost:8080/OnlineQuiz`

### Using Command Prompt
```cmd
cd C:\Program Files\Tomcat\bin
startup.bat
```

---

## 🔍 Verify Deployment

Check these after starting:
- ✅ http://localhost:8080/OnlineQuiz → Loads homepage
- ✅ Database connection works (no connection errors)
- ✅ Register → Can create account
- ✅ Login → Can login successfully
- ✅ Quiz → Can take quiz with timer
- ✅ Result → Can see score

---

## 📊 Common Ports
- Tomcat: 8080 (default)
- MySQL: 3306 (default)
- Change in: Tomcat/conf/server.xml, MySQL config

---

## 🆘 Troubleshooting Deployment

| Problem | Cause | Solution |
|---------|-------|----------|
| Port 8080 in use | Another service using it | Change Tomcat port in server.xml |
| DATABASE ERROR | MySQL not running | Start MySQL: `sudo systemctl start mysql` |
| 404 error | Wrong path | Check context path in manager |
| Slow startup | Compilation needed | Pre-compile all Java files |
| JDBC error | Wrong JAR location | Place JAR in WEB-INF/lib |

---

## 📝 Environment Variables (Optional)

### Linux/Mac
```bash
# Add to ~/.bashrc or ~/.zshrc
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export TOMCAT_HOME=/opt/tomcat
export PATH=$JAVA_HOME/bin:$TOMCAT_HOME/bin:$PATH

# Reload
source ~/.bashrc
```

### Windows
1. Right-click My Computer → Properties
2. Advanced System Settings → Environment Variables
3. New Variable:
   - JAVA_HOME = C:\Program Files\Java\jdk-11
   - TOMCAT_HOME = C:\Program Files\Tomcat
4. Edit PATH, add: %JAVA_HOME%\bin;%TOMCAT_HOME%\bin

---

## 🎯 Next Steps After Deployment

1. **Add Sample Data**: Insert more questions via admin panel
2. **Customize UI**: Modify CSS in JSP files
3. **Add Features**: Implement leaderboard, history, etc.
4. **Security**: Add password hashing, input validation
5. **Testing**: Write JUnit tests for DAO classes
6. **Documentation**: Update README with custom features

---

**You're all set! 🎉**

