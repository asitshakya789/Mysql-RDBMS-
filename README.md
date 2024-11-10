# MySQL Complete Guide: From Beginner to Advanced 🚀

A comprehensive guide to MySQL operations with easy-to-understand examples.

## What is MySQL?

MySQL is a widely-used, open-source relational database management system (RDBMS). It is designed to handle a range of applications, from small projects to large-scale enterprise solutions. MySQL is known for its reliability, performance, and ease of use.

## What is RDBMS?

RDBMS stands for Relational Database Management System. It is a software application that enables users to create, manage, and maintain relational databases. RDBMSs use structured query language (SQL) for accessing and manipulating data.

## 📚 Table of Contents
- [Getting Started](#getting-started)
- [Basic Operations](#basic-operations)
- [Working with Tables](#working-with-tables)
- [Data Operations](#data-operations)
- [Querying Data](#querying-data)
- [Advanced Topics](#advanced-topics)
- [Best Practices](#best-practices)

## 🚀 Getting Started

### Connect to MySQL
```sql
mysql -u username -p
```

### Database Management
```sql
-- Create new database
CREATE DATABASE my_app;

-- Show all databases
SHOW DATABASES;

-- Select a database to use
USE my_app;

-- Delete database
DROP DATABASE my_app;
```

## 📋 Basic Operations

### Creating Tables
```sql
-- Simple table
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT
);

-- Table with more specifications
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('active', 'inactive') DEFAULT 'active'
);
```

### Table Operations
```sql
-- List all tables
SHOW TABLES;

-- See table structure
DESCRIBE users;

-- Delete table
DROP TABLE users;

-- Modify table
ALTER TABLE users ADD COLUMN phone VARCHAR(15);
ALTER TABLE users DROP COLUMN phone;
```

## 💾 Data Operations

### Adding Data
```sql
-- Insert single row
INSERT INTO users (username, email) 
VALUES ('john_doe', 'john@example.com');

-- Insert multiple rows
INSERT INTO users (username, email) VALUES 
    ('jane_doe', 'jane@example.com'),
    ('bob123', 'bob@example.com');
```

### Reading Data
```sql
-- Select all columns
SELECT * FROM users;

-- Select specific columns
SELECT username, email FROM users;

-- Select with condition
SELECT * FROM users WHERE status = 'active';

-- Select with multiple conditions
SELECT * FROM users 
WHERE status = 'active' 
AND created_at >= '2023-01-01';
```

### Updating Data
```sql
-- Update single record
UPDATE users 
SET status = 'inactive' 
WHERE id = 1;

-- Update multiple records
UPDATE users 
SET status = 'inactive' 
WHERE created_at < '2023-01-01';
```

### Deleting Data
```sql
-- Delete single record
DELETE FROM users WHERE id = 1;

-- Delete with condition
DELETE FROM users WHERE status = 'inactive';

-- Delete all records
TRUNCATE TABLE users;
```

## 🔍 Querying Data

### Basic Queries
```sql
-- Filter with WHERE
SELECT * FROM users WHERE age >= 18;

-- Sort results
SELECT * FROM users ORDER BY username ASC;

-- Limit results
SELECT * FROM users LIMIT 10;

-- Skip and limit (pagination)
SELECT * FROM users LIMIT 10 OFFSET 20;
```

### Pattern Matching
```sql
-- Find usernames starting with 'j'
SELECT * FROM users WHERE username LIKE 'j%';

-- Find emails containing 'example'
SELECT * FROM users WHERE email LIKE '%example%';
```

### Aggregate Functions
```sql
-- Count total users
SELECT COUNT(*) FROM users;

-- Get average age
SELECT AVG(age) FROM users;

-- Find maximum value
SELECT MAX(age) FROM users;

-- Group and count
SELECT status, COUNT(*) as total 
FROM users 
GROUP BY status;
```

## 🎓 Advanced Topics

### Joins
```sql
-- Inner join
SELECT users.username, orders.order_date 
FROM users 
INNER JOIN orders ON users.id = orders.user_id;

-- Left join
SELECT users.username, orders.order_date 
FROM users 
LEFT JOIN orders ON users.id = orders.user_id;
```

### Subqueries
```sql
-- Subquery in WHERE
SELECT * FROM users 
WHERE id IN (SELECT user_id FROM orders);

-- Subquery in SELECT
SELECT username, 
    (SELECT COUNT(*) FROM orders WHERE orders.user_id = users.id) 
    as order_count 
FROM users;
```

### Indexes
```sql
-- Create index
CREATE INDEX idx_username ON users(username);

-- Create unique index
CREATE UNIQUE INDEX idx_email ON users(email);

-- Remove index
DROP INDEX idx_username ON users;
```

### Views
```sql
-- Create view
CREATE VIEW active_users AS 
SELECT * FROM users WHERE status = 'active';

-- Use view
SELECT * FROM active_users;

-- Drop view
DROP VIEW active_users;
```

## 💡 Best Practices

### Performance Tips
1. Always use appropriate data types
2. Create indexes for frequently searched columns
3. Use LIMIT in SELECT queries
4. Avoid SELECT *
5. Use prepared statements for security

### Backup and Restore
```sql
-- Backup database
mysqldump -u username -p database_name > backup.sql

-- Restore database
mysql -u username -p database_name < backup.sql
```

## 🔧 Common Operations

### String Operations
```sql
-- Concatenate strings
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM users;

-- Convert case
SELECT LOWER(username), UPPER(email) FROM users;
```

### Date Operations
```sql
-- Current date/time
SELECT NOW();

-- Format date
SELECT DATE_FORMAT(created_at, '%Y-%m-%d') FROM users;

-- Date calculations
SELECT username, DATEDIFF(NOW(), created_at) as days_since_joined 
FROM users;
```

### Transactions
```sql
-- Start transaction
START TRANSACTION;

-- Multiple operations
INSERT INTO users (username, email) VALUES ('new_user', 'new@example.com');
UPDATE users SET status = 'active' WHERE username = 'new_user';

-- Commit or rollback
COMMIT;
-- or
ROLLBACK;
```

### SELECT
```sql
SELECT column1, column2 FROM table_name;
SELECT * FROM table_name;
```

### WHERE
```sql
SELECT column1, column2 FROM table_name WHERE condition;
SELECT * FROM table_name WHERE age >= 18;
```

### AND, OR, NOT
```sql
SELECT * FROM table_name WHERE condition1 AND condition2;
SELECT * FROM table_name WHERE condition1 OR condition2;
SELECT * FROM table_name WHERE NOT condition;
```

### ORDER BY
```sql
SELECT * FROM table_name ORDER BY column1 ASC|DESC;
```

### INSERT INTO
```sql
INSERT INTO table_name (column1, column2) VALUES (value1, value2);
INSERT INTO table_name VALUES (value1, value2);
```

### NULL Values
```sql
SELECT column_names FROM table_name WHERE column_name IS NULL;
SELECT column_names FROM table_name WHERE column_name IS NOT NULL;
```

### UPDATE
```sql
UPDATE table_name SET column1 = value1 WHERE condition;
```

### DELETE
```sql
DELETE FROM table_name WHERE condition;
```

### LIMIT
```sql
SELECT column_names FROM table_name LIMIT number;
```

### MIN and MAX
```sql
SELECT MIN(column_name) FROM table_name;
SELECT MAX(column_name) FROM table_name;
```

### COUNT, AVG, SUM
```sql
SELECT COUNT(column_name) FROM table_name;
SELECT AVG(column_name) FROM table_name;
SELECT SUM(column_name) FROM table_name;
```

### LIKE
```sql
SELECT column1 FROM table_name WHERE column_name LIKE pattern;
-- % represents zero, one, or multiple characters
-- _ represents one single character
```

### Wildcards
```sql
SELECT * FROM table_name WHERE column LIKE 'a%';    -- Starts with a
SELECT * FROM table_name WHERE column LIKE '%a';    -- Ends with a
SELECT * FROM table_name WHERE column LIKE '%a%';   -- Contains a
```

### IN
```sql
SELECT * FROM table_name WHERE column_name IN (value1, value2);
```

### BETWEEN
```sql
SELECT * FROM table_name WHERE column_name BETWEEN value1 AND value2;
```

### Aliases
```sql
SELECT column_name AS alias_name FROM table_name;
SELECT column_name alias_name FROM table_name;
```

### Joins
#### INNER JOIN
```sql
SELECT columns FROM table1 INNER JOIN table2 ON table1.column = table2.column;
```

#### LEFT JOIN
```sql
SELECT columns FROM table1 LEFT JOIN table2 ON table1.column = table2.column;
```

#### RIGHT JOIN
```sql
SELECT columns FROM table1 RIGHT JOIN table2 ON table1.column = table2.column;
```

#### CROSS JOIN
```sql
SELECT columns FROM table1 CROSS JOIN table2;
```

#### Self Join
```sql
SELECT columns FROM table1 T1, table1 T2 WHERE condition;
```

### UNION
```sql
SELECT columns FROM table1 UNION SELECT columns FROM table2;
```

### GROUP BY
```sql
SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name;
```

### HAVING
```sql
SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;
```

### EXISTS
```sql
SELECT column_name FROM table_name
WHERE EXISTS (SELECT column_name FROM table_name WHERE condition);
```

### ANY, ALL
```sql
SELECT column_name FROM table_name
WHERE column_name operator ANY/ALL
(SELECT column_name FROM table_name WHERE condition);
```

### INSERT SELECT
```sql
INSERT INTO table2 SELECT * FROM table1;
```

### CASE
```sql
SELECT 
    CASE
        WHEN condition1 THEN result1
        WHEN condition2 THEN result2
        ELSE result3
    END
FROM table_name;
```

### Null Functions
```sql
SELECT IFNULL(column_name, 'Alternative value') FROM table_name;
SELECT COALESCE(value1, value2, ..., value_n);
```

### Comments
```sql
-- Single line comment
/* Multi-line
   comment */
```

## Database Operations

### Create Database
```sql
CREATE DATABASE database_name;
```

### Drop Database
```sql
DROP DATABASE database_name;
```

### Create Table
```sql
CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    column3 datatype constraint
);
```

### Drop Table
```sql
DROP TABLE table_name;
```

### Alter Table
```sql
ALTER TABLE table_name ADD column_name datatype;
ALTER TABLE table_name DROP COLUMN column_name;
ALTER TABLE table_name MODIFY COLUMN column_name datatype;
```

### Constraints
```sql
-- NOT NULL
column_name datatype NOT NULL

-- UNIQUE
column_name datatype UNIQUE

-- PRIMARY KEY
column_name datatype PRIMARY KEY

-- FOREIGN KEY
FOREIGN KEY (column_name) REFERENCES table_name(column_name)

-- CHECK
CHECK (condition)

-- DEFAULT
column_name datatype DEFAULT value
```

### Create Index
```sql
CREATE INDEX index_name ON table_name (column1, column2);
```

### Auto Increment
```sql
column_name datatype AUTO_INCREMENT
```

### Views
```sql
CREATE VIEW view_name AS
SELECT column1, column2
FROM table_name
WHERE condition;
```

## References

### Common Data Types
- INT - Integer
- DECIMAL(size,d) - Decimal numbers
- CHAR(size) - Fixed-length string
- VARCHAR(size) - Variable-length string
- TEXT - String with maximum length of 65,535 characters
- DATE - Date in YYYY-MM-DD format
- DATETIME - Date and time combination
- TIMESTAMP - Timestamp
- BOOLEAN - True or False

### Common Functions
- String Functions: CONCAT(), SUBSTRING(), TRIM(), UPPER(), LOWER()
- Numeric Functions: ROUND(), CEIL(), FLOOR(), ABS()
- Date Functions: NOW(), CURDATE(), DATEDIFF(), DATE_FORMAT()
- Aggregate Functions: COUNT(), SUM(), AVG(), MIN(), MAX()


### MySQL Functions
- String: CONCAT(), SUBSTRING(), TRIM()
- Numeric: ROUND(), CEIL(), FLOOR()
- Date: NOW(), CURDATE(), DATE_FORMAT()
- Aggregate: COUNT(), SUM(), AVG(), MIN(), MAX()

### MySQL Operators
- Arithmetic: +, -, *, /, %
- Comparison: =, >, <, >=, <=, <>
- Logical: AND, OR, NOT
- Pattern Matching: LIKE, IN, BETWEEN

---
## Contributing

We welcome contributions! If you have suggestions or improvements, please submit a pull request.
## Contact

For any questions or feedback, please reach out to [asitshakya789@gmail.com](mailto:asitshakya789@gmail.com).
## Thank You!

Thank you for taking the time to read this guide. Happy coding!
