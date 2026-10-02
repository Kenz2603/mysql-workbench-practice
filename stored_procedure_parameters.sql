-- BAI THUC HANH: TRUYEN THAM SO VAO STORED PROCEDURE
-- CSDL: classicmodels

USE classicmodels;

-- =========================================================
-- 1. THAM SO IN
-- =========================================================
DROP PROCEDURE IF EXISTS getCusById;

DELIMITER //

CREATE PROCEDURE getCusById(IN cusNum INT)
BEGIN
    SELECT *
    FROM customers
    WHERE customerNumber = cusNum;
END //

DELIMITER ;

-- Goi procedure voi customerNumber = 175
CALL getCusById(175);


-- =========================================================
-- 2. THAM SO OUT
-- =========================================================
DROP PROCEDURE IF EXISTS GetCustomersCountByCity;

DELIMITER //

CREATE PROCEDURE GetCustomersCountByCity(
    IN in_city VARCHAR(50),
    OUT total INT
)
BEGIN
    SELECT COUNT(customerNumber)
    INTO total
    FROM customers
    WHERE city = in_city;
END //

DELIMITER ;

-- Dem so khach hang o Lyon
CALL GetCustomersCountByCity('Lyon', @total);
SELECT @total AS total_customers;


-- =========================================================
-- 3. THAM SO INOUT
-- =========================================================
DROP PROCEDURE IF EXISTS SetCounter;

DELIMITER //

CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter = counter + inc;
END //

DELIMITER ;

SET @counter = 1;

CALL SetCounter(@counter, 1); -- 2
CALL SetCounter(@counter, 1); -- 3
CALL SetCounter(@counter, 5); -- 8

SELECT @counter AS counter_result;


-- =========================================================
-- 4. KIEM TRA CAC PROCEDURE DA TAO
-- =========================================================
SHOW PROCEDURE STATUS
WHERE Db = 'classicmodels'
  AND Name IN ('getCusById', 'GetCustomersCountByCity', 'SetCounter');

-- Neu can xoa sau khi thuc hanh:
-- DROP PROCEDURE IF EXISTS getCusById;
-- DROP PROCEDURE IF EXISTS GetCustomersCountByCity;
-- DROP PROCEDURE IF EXISTS SetCounter;
