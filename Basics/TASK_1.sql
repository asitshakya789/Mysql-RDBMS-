CREATE TABLE employees
     (emp_id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(50) NOT NULL,
      desig VARCHAR(255) DEFAULT 'Probation',
      dept VARCHAR(100) 
     );
