---------------------- /* Schema SQL */----------------------

CREATE TABLE students (
    student_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    role VARCHAR(50), -- Role could be 'man', 'woman', etc. as seen in the INSERT statements
    age INT,
    nationality VARCHAR(100),
    registration_date DATE
);

/* 1. Multi-row insert */
-- Insert several rows at once using multiple sets of parentheses.
Example:
INSERT INTO students (first_name, last_name, role, age, nationality)
VALUES
('Zineb', 'Nadak', 'woman', 20, 'Moroccan'),
('Mariam', 'Nadak', 'woman', 22, 'Finnish');

/* 2. Single-row insert */
-- Insert one row at a time.
Example:
INSERT INTO students (...) VALUES (...);

/* 3. Insert using defaults */
-- Only specify some columns; others take DEFAULT or NULL if allowed.
Example:
INSERT INTO students (first_name, last_name, age)
VALUES ('Lina', 'Peterson', 19);

/* 4. Insert without column names */
-- Must provide all values in the exact table column order.
Example:
INSERT INTO students VALUES (NULL, 'Tom', 'Smith', 'Man', 21, 'British');

/* 5. Insert from another table (INSERT ... SELECT) */
-- Copy data from another table.
Example:
INSERT INTO students (first_name, last_name, role, age, nationality)
SELECT first_name, last_name, role, age, nationality
FROM temp_students;

/* 6. Using expressions / functions */
-- Use SQL functions like CURRENT_DATE for dynamic values.
Example:
INSERT INTO students (first_name, last_name, role, age, nationality, registration_date)
VALUES ('Lina', 'Peterson', 'Fru', 19, 'Swedish', CURRENT_DATE);

/* 7. General Tips */
-- Order of values must match column order if not specifying columns.
-- NULL can be inserted explicitly if column allows it.
-- Constraints (NOT NULL, UNIQUE, CHECK) may prevent insertion if violated.





---------------------- /* Query SQL */ ----------------------

SELECT first_name, last_name, age, nationality
FROM students
WHERE age = 20
ORDER BY age DESC;

/*
[OPERATION] [column_list / whole_table]
FROM [table_name]
WHERE [condition]
GROUP BY [columns]
ORDER BY [columns]
*/

/* QUERY SQL - Common Commands & Use Cases:
1. SELECT -> view one or more columns from table(s).
2. WHERE -> filter rows by condition(s).
3. ORDER BY -> sort the result set by column(s) (ASC or DESC).
4. GROUP BY -> group rows by column(s) and apply aggregate functions.
5. HAVING -> filter groups created by GROUP BY.
6. UPDATE -> modify existing rows in a table.
*/

