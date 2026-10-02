USE QuanLySinhVien;

SELECT *
FROM Student
WHERE StudentName LIKE 'h%';

SELECT *
FROM Class
WHERE MONTH(StartDate) = 12;

SELECT *
FROM Subject
WHERE Credit BETWEEN 3 AND 5;

UPDATE Student
SET ClassID = 2
WHERE StudentName = 'Hung';

SELECT
    S.StudentName,
    Sub.SubName,
    M.Mark
FROM Student AS S
JOIN Mark AS M
    ON S.StudentID = M.StudentID
JOIN Subject AS Sub
    ON M.SubID = Sub.SubID
ORDER BY M.Mark DESC, S.StudentName ASC;
