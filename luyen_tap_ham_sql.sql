-- BAI TAP: LUYEN TAP CAC HAM THONG DUNG TRONG SQL
-- CSDL: QuanLySinhVien

USE QuanLySinhVien;

-- 1. Hien thi tat ca thong tin mon hoc co Credit lon nhat
SELECT *
FROM Subject
WHERE Credit = (
    SELECT MAX(Credit)
    FROM Subject
);

-- 2. Hien thi thong tin mon hoc co diem thi lon nhat
SELECT
    Sub.SubId,
    Sub.SubName,
    Sub.Credit,
    Sub.Status,
    M.Mark
FROM Subject AS Sub
JOIN Mark AS M ON Sub.SubId = M.SubId
WHERE M.Mark = (
    SELECT MAX(Mark)
    FROM Mark
);

-- 3. Hien thi thong tin sinh vien va diem trung binh,
--    sap xep theo diem trung binh giam dan
SELECT
    S.StudentId,
    S.StudentName,
    S.Address,
    S.Phone,
    S.Status,
    S.ClassId,
    AVG(M.Mark) AS `Diem trung binh`
FROM Student AS S
JOIN Mark AS M ON S.StudentId = M.StudentId
GROUP BY
    S.StudentId,
    S.StudentName,
    S.Address,
    S.Phone,
    S.Status,
    S.ClassId
ORDER BY AVG(M.Mark) DESC;
