#This Python script runs an external Basic SQL file on the MySQL database.

#Purpose:
#- Automates the execution of Basic SQL scripts (tables creation, data insertion, etc.).
#- Ensures that the same Basic SQL file can be reused anytime without manually copying code into DBeaver.
#- Makes it easy to integrate the database setup with Python applications.
#- Supports version-controlled Basic SQL scripts in a workflow with PyCharm, DBeaver, and GitHub.

#In short: instead of manually executing Basic SQL in DBeaver, this script lets Python read and run the Basic SQL file automatically.

#After this, running your Python script will:
#Connect to your Högskolan database.
#Execute all commands in first_test.sql.
#Commit changes and close the connection.

#The only part you need to change in your Python file when running a different .sql file is the path to the new Basic SQL file. Everything else in the Python script stays the same.
# sql_file_path = "/Users/zineb/Pycharm/September/DatabaseTechnology-25/Test/new_file"

import mysql.connector

# -----------------------------
# 1. Connect to MySQL
# -----------------------------
conn = mysql.connector.connect(
    host="localhost",       # MySQL server
    user="root",            # Your MySQL username
    password="DataBaser!25",# Replace with your MySQL password
    database="Högskolan"    # The database you created
)

cursor = conn.cursor()

# -----------------------------
# 2. Open and read Basic SQL file
# -----------------------------
# Replace path with the actual path to your Basic SQL file on Desktop
sql_file_path = "/Archive /Test/first_test.sql"

with open(sql_file_path, "r") as file:
    sql_script = file.read()



# -----------------------------
# 3. Execute Basic SQL script safely
# -----------------------------
for statement in sql_script.split(';'):
    statement = statement.strip()
    # skip empty statements or comments
    if not statement or statement.startswith('--'):
        continue

    cursor.execute(statement)
    print(f"Executed: {statement}")

    # If it's a SELECT statement, fetch and print results immediately
    if statement.lower().startswith("select"):
        rows = cursor.fetchall()
        print("\nResults:")
        for row in rows:
            print(row)


# -----------------------------
# 4. Commit and close
# -----------------------------
conn.commit()
cursor.close()
conn.close()

print("Basic SQL script executed successfully!")



#When you run this you will get "Basic SQL script executed successfully!", that means:

#Your first_test.sql file was read by Python.
# All Basic SQL statements (CREATE TABLE, INSERT) executed successfully.
# The SELECT statement fetched and printed the data (if you added that optional part).
# conn.commit() ran without errors — no more “unread result” issue.
# The database now has your students table with all sample data. ✅

#Now you can Verify in DBeaver (optional)