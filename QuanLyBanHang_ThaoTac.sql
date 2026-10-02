USE QuanLyBanHang;

-- =========================
-- 1. THÊM DỮ LIỆU MẪU
-- =========================

INSERT INTO Customer (cID, cName, cAge)
VALUES
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

INSERT INTO `Order` (oID, cID, oDate, oTotalPrice)
VALUES
(1, 1, '2006-03-21', NULL),
(2, 2, '2006-03-23', NULL),
(3, 1, '2006-03-16', NULL);

INSERT INTO Product (pID, pName, pPrice)
VALUES
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

INSERT INTO OrderDetail (oID, pID, odQTY)
VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

-- =========================
-- 2. HIỂN THỊ oID, oDate, oPrice
-- =========================
-- CSDL trước dùng cột oTotalPrice, nên đặt bí danh oPrice theo yêu cầu đề bài.

SELECT
    oID,
    oDate,
    oTotalPrice AS oPrice
FROM `Order`;

-- =========================
-- 3. DANH SÁCH KHÁCH HÀNG ĐÃ MUA HÀNG
--    VÀ SẢN PHẨM ĐƯỢC MUA
-- =========================

SELECT
    c.cID,
    c.cName,
    p.pID,
    p.pName
FROM Customer AS c
JOIN `Order` AS o
    ON c.cID = o.cID
JOIN OrderDetail AS od
    ON o.oID = od.oID
JOIN Product AS p
    ON od.pID = p.pID
ORDER BY c.cID, p.pID;

-- =========================
-- 4. KHÁCH HÀNG KHÔNG MUA BẤT KỲ SẢN PHẨM NÀO
-- =========================

SELECT
    c.cID,
    c.cName
FROM Customer AS c
LEFT JOIN `Order` AS o
    ON c.cID = o.cID
WHERE o.oID IS NULL;

-- =========================
-- 5. MÃ HÓA ĐƠN, NGÀY BÁN VÀ GIÁ TIỀN TỪNG HÓA ĐƠN
--    Tổng tiền = SUM(odQTY * pPrice)
-- =========================

SELECT
    o.oID,
    o.oDate,
    SUM(od.odQTY * p.pPrice) AS oPrice
FROM `Order` AS o
JOIN OrderDetail AS od
    ON o.oID = od.oID
JOIN Product AS p
    ON od.pID = p.pID
GROUP BY o.oID, o.oDate
ORDER BY o.oID;
