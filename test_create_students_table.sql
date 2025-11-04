-- Create a table called students
CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    major TEXT
);

-- Insert sample data
INSERT INTO students (name, major)
VALUES
('Alice', 'Computer Science'),
('Bob', 'Mathematics');
