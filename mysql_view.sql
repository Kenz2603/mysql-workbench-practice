-- BAI THUC HANH: VIEW TRONG MYSQL
-- CSDL: classicmodels

USE classicmodels;

-- Xoa view cu neu da ton tai de script co the chay lai
DROP VIEW IF EXISTS customer_views;

-- 1. Tao view customer_views
CREATE VIEW customer_views AS
SELECT
    customerNumber,
    customerName,
    phone
FROM customers;

-- 2. Truy van du lieu tu view
SELECT *
FROM customer_views;

-- 3. Cap nhat view bang CREATE OR REPLACE VIEW
CREATE OR REPLACE VIEW customer_views AS
SELECT
    customerNumber,
    customerName,
    contactFirstName,
    contactLastName,
    phone
FROM customers
WHERE city = 'Nantes';

-- 4. Kiem tra view sau khi cap nhat
SELECT *
FROM customer_views;

-- 5. Xem dinh nghia cua view
SHOW CREATE VIEW customer_views;

-- 6. Xoa view
DROP VIEW customer_views;
