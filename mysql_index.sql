-- BAI THUC HANH: CHI MUC TRONG MYSQL
-- CSDL mau: classicmodels

USE classicmodels;

-- 1. Truy van truoc khi tao index
SELECT *
FROM customers
WHERE customerName = 'Land of Toys Inc.';

-- 2. Kiem tra ke hoach thuc thi truoc khi tao index
EXPLAIN
SELECT *
FROM customers
WHERE customerName = 'Land of Toys Inc.';

-- 3. Tao index cho customerName
ALTER TABLE customers
ADD INDEX idx_customerName (customerName);

-- 4. Kiem tra lai sau khi tao index
EXPLAIN
SELECT *
FROM customers
WHERE customerName = 'Land of Toys Inc.';

-- 5. Tao composite index cho ho va ten
ALTER TABLE customers
ADD INDEX idx_full_name (contactFirstName, contactLastName);

-- 6. Kiem tra truy van su dung contactFirstName
EXPLAIN
SELECT *
FROM customers
WHERE contactFirstName = 'Jean'
   OR contactFirstName = 'King';

-- 7. Xem danh sach index cua bang customers
SHOW INDEX FROM customers;

-- 8. Xoa composite index
ALTER TABLE customers
DROP INDEX idx_full_name;

-- Neu can xoa index customerName sau khi thuc hanh:
-- ALTER TABLE customers DROP INDEX idx_customerName;
