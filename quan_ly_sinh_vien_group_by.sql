-- BAI THUC HANH: SU DUNG CAC HAM THONG DUNG VA GROUP BY TRONG MYSQL
-- CSDL: QuanLySinhVien

USE QuanLySinhVien;

-- 1. Hien thi so luong sinh vien o tung noi
SELECT Address, COUNT(StudentId) AS `So luong hoc vien`
FROM Student
GROUP BY Address;

-- 2. Tinh diem trung binh cac mon hoc cua moi hoc vien
SELECT
    S.StudentId,
    S.StudentName,
    AVG(M.Mark) AS `Diem trung binh`
FROM Student AS S
JOIN Mark AS M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName;

-- 3. Hien thi hoc vien co diem trung binh cac mon hoc lon hon 15
SELECT
    S.StudentId,
    S.StudentName,
    AVG(M.Mark) AS `Diem trung binh`
FROM Student AS S
JOIN Mark AS M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(M.Mark) > 15;

-- 4. Hien thi hoc vien co diem trung binh lon nhat
SELECT
    S.StudentId,
    S.StudentName,
    AVG(M.Mark) AS `Diem trung binh`
FROM Student AS S
JOIN Mark AS M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(M.Mark) >= ALL (
    SELECT AVG(M2.Mark)
    FROM Mark AS M2
    GROUP BY M2.StudentId
);
