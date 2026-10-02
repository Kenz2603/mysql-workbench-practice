-- BAI THUC HANH: TRIGGER TRONG MYSQL
-- CSDL: company

CREATE DATABASE IF NOT EXISTS company;
USE company;

-- Tao lai bang de bai co the chay doc lap
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);

-- Xoa trigger cu neu da ton tai
DROP TRIGGER IF EXISTS update_department;

-- Tao trigger BEFORE INSERT:
-- salary >= 5000  -> Management
-- salary >= 3000  -> Sales
-- salary < 3000   -> Support
DELIMITER //

CREATE TRIGGER update_department
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary >= 5000 THEN
        SET NEW.department = 'Management';
    ELSEIF NEW.salary >= 3000 THEN
        SET NEW.department = 'Sales';
    ELSE
        SET NEW.department = 'Support';
    END IF;
END //

DELIMITER ;

-- Demo trigger
INSERT INTO employees (name, department, salary)
VALUES
    ('John Doe', 'A', 3500),
    ('Jane Smith', 'A', 2000),
    ('David Johnson', 'A', 6000);

-- Kiem tra ket qua
SELECT *
FROM employees
ORDER BY id;

-- Kiem tra trigger
SHOW TRIGGERS FROM company;

-- Ket qua department mong doi:
-- John Doe      -> Sales
-- Jane Smith    -> Support
-- David Johnson -> Management
