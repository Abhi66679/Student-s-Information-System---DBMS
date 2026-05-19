CREATE DATABASE StudentInformationSystem;

USE StudentInformationSystem;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    department_id INT
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Mechanical'),
(3, 'Electronics');

INSERT INTO Students VALUES
(101, 'Ravi', 20, 'Male', 1),
(102, 'Anjali', 21, 'Female', 1),
(103, 'Kiran', 22, 'Male', 2),
(104, 'Sneha', 20, 'Female', 3),
(105, 'Arjun', 23, 'Male', 2);

INSERT INTO Courses VALUES
(201, 'DBMS', 1),
(202, 'Data Structures', 1),
(203, 'Thermodynamics', 2),
(204, 'Circuits', 3),
(205, 'Operating Systems', 1);

INSERT INTO Enrollments VALUES
(1, 101, 201, 'Sem1'),
(2, 101, 202, 'Sem1'),
(3, 102, 201, 'Sem1'),
(4, 103, 203, 'Sem1'),
(5, 104, 204, 'Sem1'),
(6, 105, 203, 'Sem1');

INSERT INTO Marks VALUES
(1, 101, 201, 85),
(2, 101, 202, 78),
(3, 102, 201, 92),
(4, 103, 203, 67),
(5, 104, 204, 74),
(6, 105, 203, 80);

-- Retrieve student names along with their courses and marks
SELECT s.name, c.course_name, m.marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
JOIN Courses c ON c.course_id = m.course_id;

-- Find the average marks obtained by students in each course
SELECT course_id, AVG(marks) AS avg_marks
FROM Marks
GROUP BY course_id;

-- Find the highest marks scored by any student
SELECT MAX(marks) AS highest_marks
FROM Marks;

-- Retrieve names of students who scored above average marks
SELECT name
FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Marks
    WHERE marks > (SELECT AVG(marks) FROM Marks)
);

-- Display student names along with department and enrolled courses
SELECT s.name, d.department_name, c.course_name
FROM Students s
JOIN Departments d ON s.department_id = d.department_id
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- Create a view for student marks
CREATE VIEW StudentMarksView AS
SELECT s.name, c.course_name, m.marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
JOIN Courses c ON c.course_id = m.course_id;

-- Create a view for department students
CREATE VIEW DepartmentStudents AS
SELECT s.name, d.department_name
FROM Students s
JOIN Departments d ON s.department_id = d.department_id;

-- Display all records from StudentMarksView
SELECT * FROM StudentMarksView;

-- Display all records from DepartmentStudents
SELECT * FROM DepartmentStudents;

-- Count number of students in each department
SELECT department_id, COUNT(*) AS total_students
FROM Students
GROUP BY department_id;

-- Find students who scored more than 80 marks
SELECT s.name, m.marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
WHERE m.marks > 80;
