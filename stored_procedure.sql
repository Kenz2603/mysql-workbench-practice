-- BAI THUC HANH: STORED PROCEDURE TRONG MYSQL
-- CSDL: classicmodels

USE classicmodels;

-- Xoa procedure cu neu da ton tai de co the chay lai file nhieu lan
DROP PROCEDURE IF EXISTS findAllCustomers;

-- 1. Tao Stored Procedure hien thi tat ca khach hang
DELIMITER //

CREATE PROCEDURE findAllCustomers()
BEGIN
    SELECT * FROM customers;
END //

DELIMITER ;

-- 2. Goi Stored Procedure
CALL findAllCustomers();

-- 3. MySQL khong sua truc tiep noi dung procedure.
--    Xoa procedure cu va tao lai.
DROP PROCEDURE IF EXISTS findAllCustomers;

DELIMITER //

CREATE PROCEDURE findAllCustomers()
BEGIN
    SELECT *
    FROM customers
    WHERE customerNumber = 175;
END //

DELIMITER ;

-- 4. Goi lai procedure sau khi tao lai
CALL findAllCustomers();

-- 5. Kiem tra procedure da ton tai trong CSDL
SHOW PROCEDURE STATUS
WHERE Db = 'classicmodels'
  AND Name = 'findAllCustomers';

-- Neu can xoa procedure sau khi thuc hanh:
-- DROP PROCEDURE IF EXISTS findAllCustomers;
