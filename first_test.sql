-- File: v1_create_students_table.sql
-- Purpose: Create a students table and insert sample data

-- Use the Högskolan database
USE Högskolan;

-- Create table
CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade VARCHAR(5)
);

-- Insert sample data
INSERT INTO students (first_name, last_name, age, grade) VALUES
('Alice', 'Johnson', 20, 'A'),
('Bob', 'Smith', 22, 'B'),
('Charlie', 'Lee', 19, 'A'),
('Diana', 'Garcia', 21, 'C');

-- Show all students
SELECT * FROM students;



