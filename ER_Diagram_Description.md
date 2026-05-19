# ER Diagram Explanation – Student Information System

## Overview
The ER (Entity Relationship) Diagram represents the database structure of the Student Information System project. It illustrates the entities, attributes, primary keys, foreign keys, and relationships between different tables in the database.

---

# Entities and Attributes

## 1. Departments
This table stores department information.

### Attributes:
- department_id (Primary Key)
- department_name

### Relationship:
- One department can have many students.
- One department can offer many courses.

---

## 2. Students
This table stores student details.

### Attributes:
- student_id (Primary Key)
- name
- age
- gender
- department_id (Foreign Key)

### Relationship:
- Many students belong to one department.
- One student can enroll in multiple courses.
- One student can have multiple marks records.

---

## 3. Courses
This table stores course information.

### Attributes:
- course_id (Primary Key)
- course_name
- department_id (Foreign Key)

### Relationship:
- Many courses belong to one department.
- One course can have many enrollments.
- One course can have multiple marks records.

---

## 4. Enrollments
This table manages student course enrollments.

### Attributes:
- enrollment_id (Primary Key)
- student_id (Foreign Key)
- course_id (Foreign Key)
- semester

### Relationship:
- Acts as a bridge table between Students and Courses.
- Represents a many-to-many relationship between students and courses.

---

## 5. Marks
This table stores student marks for courses.

### Attributes:
- mark_id (Primary Key)
- student_id (Foreign Key)
- course_id (Foreign Key)
- marks

### Relationship:
- One student can have many marks records.
- One course can contain marks of many students.

---

# Relationships Summary

- One Department → Many Students
- One Department → Many Courses
- One Student → Many Enrollments
- One Course → Many Enrollments
- One Student → Many Marks
- One Course → Many Marks

---

# Purpose of ER Diagram
The ER Diagram helps in:
- Understanding database structure
- Identifying relationships between tables
- Maintaining data integrity
- Designing relational databases efficiently

---

# Conclusion
The ER Diagram provides a clear representation of the Student Information System database and demonstrates the implementation of relational database concepts such as primary keys, foreign keys, and entity relationships using MySQL.
