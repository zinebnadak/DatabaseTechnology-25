INTRODUCTION TO SQL (Structured Query Language)

Because I’m working with both Python and SQL, I need to run this script as a SQL query rather than just writing it.
I’m using PyCharm Community Edition, which doesn’t include built-in database tools — so when I write a .sql file, it’s simply a text file until it’s executed by a real database engine.
To actually run the SQL, I use an external tool such as MySQL, DBeaver, or SQLite’s command-line interface.
Remember that .sql files are just plain text scripts — they can be stored, shared, and version-controlled in GitHub like any other code file.

DrawSQL works with MySQL, and it’s mainly for visual design and generating SQL scripts, not for running queries directly.
MySQL Workbench is just a GUI tool. 
so I´ll need the MySQL server/database engine installed to actually run queries.

-------------------- MySQL Setup & Workflow (Mac/ with Homebrew) --------------------


Step 0 — Start MySQL server
brew services start mysql
- Check if it’s running
mysql.server status
ps aux | grep mysql

  
Step 1 — Create a MySQL user (only if you don’t have one yet)
- Log in as root:
mysql -u root -p

- In MySQL prompt:
CREATE USER 'zineb'@'localhost' IDENTIFIED BY 'skola';
GRANT ALL PRIVILEGES ON . TO 'zineb'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;

  
Step 2 — Connect to MySQL using your user
mysql -u zineb -p
- Enter password: skola
Check databases:
SHOW DATABASES;

  
Step 3 — Import a .sql file (from Terminal, outside MySQL prompt)
mysql -u zineb -p < ~/Desktop/world\ 
1
1.sql
mysql -u zineb -p < ~/Desktop/dreamhome.sql


Step 4 — Open MySQL Workbench
- Open Workbench
- Create a new connection:
Connection Name: zineb_local
Hostname: localhost
Port: 3306
Username: zineb
Password: skola
- Click Test Connection → should succeed


Step 5 — Refresh schemas in Workbench
- Right-click SCHEMAS panel → Refresh All
- You should see your imported databases: world, dreamhome


Step 6 — Explore tables in Workbench
USE world;
SHOW TABLES;

USE dreamhome;
SHOW TABLES;


Step 7 — Optional: Connect from Python (PyCharm)
import mysql.connector

conn = mysql.connector.connect(
host="localhost",
user="zineb",
password="skola",
database="world"
)
cursor = conn.cursor()
with open("sql/first_test.sql") as f:
cursor.execute(f.read(), multi=True)

conn.commit()
conn.close()


TO STOP ANYTHING RUNNING:
1 — Stop MySQL Homebrew service
brew services stop mysql
This stops the Homebrew-managed MySQL server if it’s running.

2 — Kill any leftover MySQL processes
sudo pkill mysqld
sudo pkill mysqld_safe
This force-stops any MySQL processes that are still alive.

3 — Verify that no MySQL server is running
ps aux | grep mysql
If only the grep mysql line appears, there are no running MySQL processes.

4 — Remove leftover socket/pid files (optional)
sudo rm -f /tmp/mysql.sock
sudo rm -f /usr/local/var/mysql/*.pid
This clears leftover files that sometimes prevent MySQL from starting.



IF YOU SEE THIS IN TERMINAL TO VERIFY IF SOMETHING IS RUNNING: "zineb            31756   0.0  0.0 34121296    652 s000  S+    2:42PM   0:00.01 grep mysql
zineb@ZMAC ~ % " means: 

- zineb → the macOS user running the command.
- 31756 → the process ID (PID) of this process.
- 0.0 0.0 → CPU and memory usage of the process.
- 34121296 652 → virtual memory size and resident memory.
- s000 → terminal (tty) the process is attached to.
- S+ → process state (S = sleeping, + = in foreground).
- 2:42PM → start time of the process.
- 0:00.01 → CPU time used.
- grep mysql → the command itself (the grep mysql you ran).
✅ Important: This line is just the grep mysql command you ran, not a MySQL server.

So if you see only this line after ps aux | grep mysql, it means no MySQL server is currently running.


------------------------------------------------------
------------------------------------------------------
----------- When you start a work session: -----------
------------------------------------------------------
------------------------------------------------------


Stage	        Tool	                Description
Design schema	PyCharm	                Write .sql
Execute schema	DBeaver + MySQL	        Run SQL
Inspect results	DBeaver	                Verify
Commit scripts	GitHub	                Version control
Automate setup	Python + MySQL connector Optional

--------> Optional: Setting up once for efficiency
Create folders in PyCharm:
- sql/ for scripts
- python/ for integration scripts
- Configure DBeaver to auto-connect on startup.
- Use descriptive file names (e.g., v1_setup.sql, v2_alter_table.sql).
- Keep your .db file in the same repo so Python and DBeaver point to the same path.

----------- WORKFLOW OVERVIEW -----------

(when working with databases in Pycharm + DBeaver + Mysql + GitHub)

------------------ WORKFLOW USING DBEAVER ONLY -----------------
Step 0 — Prep

Start MySQL server:
brew services start mysql   # macOS
sudo systemctl start mysql  # Linux
Open PyCharm → your project folder.
Open DBeaver:
Connect to MySQL:

Host: localhost
Port: 3306
User: root
Password: <your password>

(Optional) Open PyCharm terminal for Git.

Step 1 — Choose or create a database
In DBeaver, check the Database Navigator panel.
If your target database exists (e.g., school), click it.
If not, right-click → Create New Database, give it a name.

Step 2 — Create/Edit your SQL file
In PyCharm, create .sql files in your /sql folder.
Example v1_create_students_table.sql:
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    grade VARCHAR(5)
);
Save the file.

Step 3 — Run SQL in DBeaver
In Database Navigator, right-click the database → SQL Editor → New SQL Script.
Open your .sql file: File → Open File → select your file.
Execute (▶️ or Ctrl+Enter / Cmd+Enter).
Verify in Database Navigator:
Expand database → Tables → students → Right-click → View Data → All Rows.

Step 4 — Version Control (GitHub)
In PyCharm terminal:
git status
git add sql/v1_create_students_table.sql
git commit -m "Add students table schema"
git push
Only commit .sql files (not database data).

Step 5 — Optional Python Integration
Later, you can automate running these SQL files in Python:
import mysql.connector
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="yourpassword",
    database="school"
)
cursor = conn.cursor()
with open("sql/v1_create_students_table.sql") as f:
    cursor.execute(f.read(), multi=True)
conn.commit()
conn.close()

Step 6 — Organize & iterate
Always create new .sql files for updates.
Add header comments with file name, author, date, and purpose.
Run → Verify → Commit → Push.



----------------- WORKFLOW USING MYSQL ONLY (PyCharm Terminal) -----------------
Step 0 — Prep
Start MySQL server:
mysql.server start
If permission errors appear, fix /usr/local/var/mysql ownership:
sudo chown -R _mysql:_mysql /usr/local/var/mysql
sudo chmod -R 755 /usr/local/var/mysql
Open PyCharm terminal.

Step 1 — Choose or create a database
Log in to MySQL:
mysql -u root -p
Check existing databases:
SHOW DATABASES;
Create database if it doesn’t exist (use backticks for special characters):
CREATE DATABASE `högskolan`;
Exit MySQL:
exit;

Step 2 — Create/Edit your SQL file
In PyCharm /sql folder, create .sql files (same as DBeaver workflow).
Example v1_create_students_table.sql:
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    grade VARCHAR(5)
);

Step 3 — Run SQL from terminal
Navigate to the folder containing your SQL file:
cd /path/to/project/sql
Execute the file on your chosen database:
mysql -u root -p "högskolan" < v1_create_students_table.sql
Enter root password (DataBaser!25) when prompted.
Use quotes for database names with special characters.

Step 4 — Verify tables/data
Log in:
mysql -u root -p
Switch to your database:
USE `högskolan`;
SHOW TABLES;
SELECT * FROM students;

Step 5 — Version Control (GitHub)
Same as DBeaver workflow:
git status
git add sql/v1_create_students_table.sql
git commit -m "Add students table schema"
git push

Step 6 — Optional Python Integration
Run .sql files from Python:
import mysql.connector
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="DataBaser!25",
    database="högskolan"
)
cursor = conn.cursor()
with open("sql/v1_create_students_table.sql") as f:
    cursor.execute(f.read(), multi=True)
conn.commit()
conn.close()

Step 7 — Organize & iterate
Always create new .sql files for changes.
Include header comments:
-- File: v2_add_courses_table.sql
-- Author: Zineb
-- Date: 2025-11-13
-- Purpose: Add new table for course management
Run → Verify → Commit → Push.
