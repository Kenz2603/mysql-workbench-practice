-- BAI THUC HANH: VIEW, INDEX, STORED PROCEDURE
-- MySQL

-- =========================================================
-- BUOC 1: TAO CO SO DU LIEU
-- =========================================================
CREATE DATABASE IF NOT EXISTS product_management;
USE product_management;

-- =========================================================
-- BUOC 2: TAO BANG PRODUCTS VA DU LIEU MAU
-- =========================================================
DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50) NOT NULL,
    productName VARCHAR(100) NOT NULL,
    productPrice DECIMAL(12,2) NOT NULL,
    productAmount INT NOT NULL,
    productDescription TEXT,
    productStatus VARCHAR(20) NOT NULL
);

INSERT INTO Products
    (productCode, productName, productPrice, productAmount,
     productDescription, productStatus)
VALUES
    ('P001', 'Laptop Dell', 1500.00, 10, 'Laptop Dell van phong', 'Available'),
    ('P002', 'iPhone', 1000.00, 15, 'Dien thoai Apple', 'Available'),
    ('P003', 'Keyboard', 50.00, 30, 'Ban phim co', 'Available'),
    ('P004', 'Mouse', 25.00, 50, 'Chuot may tinh', 'Available'),
    ('P005', 'Monitor', 300.00, 20, 'Man hinh may tinh', 'Unavailable');

-- =========================================================
-- BUOC 3: INDEX VA EXPLAIN
-- =========================================================

-- EXPLAIN truoc khi tao index
EXPLAIN
SELECT *
FROM Products
WHERE productCode = 'P003';

EXPLAIN
SELECT *
FROM Products
WHERE productName = 'Keyboard'
  AND productPrice = 50.00;

-- Unique Index tren productCode
CREATE UNIQUE INDEX idx_product_code
ON Products(productCode);

-- Composite Index tren productName + productPrice
CREATE INDEX idx_product_name_price
ON Products(productName, productPrice);

-- EXPLAIN sau khi tao index
EXPLAIN
SELECT *
FROM Products
WHERE productCode = 'P003';

EXPLAIN
SELECT *
FROM Products
WHERE productName = 'Keyboard'
  AND productPrice = 50.00;

SHOW INDEX FROM Products;

-- =========================================================
-- BUOC 4: VIEW
-- =========================================================

DROP VIEW IF EXISTS product_view;

CREATE VIEW product_view AS
SELECT
    productCode,
    productName,
    productPrice,
    productStatus
FROM Products;

SELECT * FROM product_view;

-- Sua doi view: bo sung productAmount va chi lay san pham Available
CREATE OR REPLACE VIEW product_view AS
SELECT
    productCode,
    productName,
    productPrice,
    productAmount,
    productStatus
FROM Products
WHERE productStatus = 'Available';

SELECT * FROM product_view;

-- Xoa view theo yeu cau bai
DROP VIEW product_view;

-- =========================================================
-- BUOC 5: STORED PROCEDURE
-- =========================================================

DROP PROCEDURE IF EXISTS getAllProducts;
DROP PROCEDURE IF EXISTS addProduct;
DROP PROCEDURE IF EXISTS updateProduct;
DROP PROCEDURE IF EXISTS deleteProduct;

DELIMITER //

-- Lay tat ca san pham
CREATE PROCEDURE getAllProducts()
BEGIN
    SELECT * FROM Products;
END //

-- Them san pham moi
CREATE PROCEDURE addProduct(
    IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(100),
    IN p_productPrice DECIMAL(12,2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus VARCHAR(20)
)
BEGIN
    INSERT INTO Products (
        productCode,
        productName,
        productPrice,
        productAmount,
        productDescription,
        productStatus
    )
    VALUES (
        p_productCode,
        p_productName,
        p_productPrice,
        p_productAmount,
        p_productDescription,
        p_productStatus
    );
END //

-- Sua thong tin san pham theo Id
CREATE PROCEDURE updateProduct(
    IN p_Id INT,
    IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(100),
    IN p_productPrice DECIMAL(12,2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus VARCHAR(20)
)
BEGIN
    UPDATE Products
    SET
        productCode = p_productCode,
        productName = p_productName,
        productPrice = p_productPrice,
        productAmount = p_productAmount,
        productDescription = p_productDescription,
        productStatus = p_productStatus
    WHERE Id = p_Id;
END //

-- Xoa san pham theo Id
CREATE PROCEDURE deleteProduct(IN p_Id INT)
BEGIN
    DELETE FROM Products
    WHERE Id = p_Id;
END //

DELIMITER ;

-- =========================================================
-- KIEM THU STORED PROCEDURE
-- =========================================================

CALL getAllProducts();

CALL addProduct(
    'P006',
    'Webcam',
    80.00,
    12,
    'Webcam Full HD',
    'Available'
);

CALL updateProduct(
    6,
    'P006',
    'Webcam Pro',
    95.00,
    15,
    'Webcam Full HD Pro',
    'Available'
);

CALL getAllProducts();

CALL deleteProduct(6);

CALL getAllProducts();
