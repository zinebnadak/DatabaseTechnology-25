
-- bcs i go from python to .sql i need to run this script as a SQL query.
-- I am using PyCharm Community Edition, which doesn't have built-in database tools
-- so writing the file doesn’t run the SQL — it’s just text until you execute it using a database engine.
-- I need to use an external tool (such as MySQL Workbench, DBeaver, or SQLite3 command-line tools) to run my .sql file.

sqlite3 --version
sqlite3 mydatabase.db
.read path/to/yourfile.sql

If you want a graphical interface:
For SQLite:
Choose the .db file you created earlier.
✅ Done! You can see your tables and data in the sidebar.

Regardless of which database you use: .sql files are plain text in GitHub


make a clean folder for your project.

In your Terminal, type:

cd ~/Desktop
mkdir sql_demo
cd sql_demo


Now create your database file:

sqlite3 mydatabase.db


✅ You’ll see this prompt:

sqlite>


You are now inside the SQLite shell — it’s connected to your new database file.

You can test it by typing:

.tables

(it will show nothing yet — the database is empty)

Then leave SQLite by typing:

.exit


That will bring you back to your regular Terminal prompt.

📄 Step 3: Create an SQL Script File

Now open PyCharm (or TextEdit, or VS Code — anything works).

Go to ~/Desktop/sql_demo/

Create a new file called setup.sql

Paste this example content:

CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE
);

INSERT INTO users (name, email)
VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com');


💾 Save the file.

▶️ Step 4: Run Your SQL File

Back in your Terminal, still inside the sql_demo folder, type:

sqlite3 mydatabase.db


Now, inside the SQLite prompt, type:

.read setup.sql


✅ That command executes everything in your setup.sql file.

Now check that it worked:

SELECT * FROM users;


You should see something like:

1|Alice|alice@example.com
2|Bob|bob@example.com


Then exit SQLite:

.exit

🖥️ Step 5: (Optional) View It in DBeaver GUI

If you want a visual interface (tables, rows, queries):

Download DBeaver Community Edition — https://dbeaver.io/download/

Open it → Database → New Database Connection → SQLite

Select your file:
~/Desktop/sql_demo/mydatabase.db

Click Finish

✅ You’ll see your users table in the sidebar — and can browse or edit data visually.

🌐 Step 6: Save or Share on GitHub





















-- Example run
-- This script will create a users table, insert three rows of data, and then retrieve and display all the rows from the users table.

-- Create a test table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- Insert some data
INSERT INTO users (name, email) VALUES ('Alice', 'alice@example.com');
INSERT INTO users (name, email) VALUES ('Bob', 'bob@example.com');
INSERT INTO users (name, email) VALUES ('Charlie', 'charlie@example.com');

-- Query the data
SELECT * FROM users;
