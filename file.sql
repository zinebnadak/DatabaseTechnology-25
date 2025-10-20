
-- bcs i go from python to .sql i need to run this script as a SQL query.
-- I am using PyCharm Community Edition, which doesn't have built-in database tools
-- I need to use an external tool (such as MySQL Workbench, DBeaver, or SQLite3 command-line tools) to run my .sql file.


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
