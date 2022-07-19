use quanlysinhvien;

--  Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.--

SELECT 
    *
FROM
    `subject` s
WHERE
    credit = (SELECT 
            MAX(credit)
        FROM
            `subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất. --

SELECT 
    sub.*, mark AS 'điểm cao nhất'
FROM
    mark m
        RIGHT JOIN
    subject sub ON m.subid = sub.subid
WHERE
    m.mark = (SELECT 
            MAX(mark.mark)
        FROM
            mark);
            
--  Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần--

SELECT 
    student.StudentId, student.StudentName, AVG(Mark)
FROM
    student
        JOIN
    mark ON student.StudentId = mark.StudentId
GROUP BY StudentId
ORDER BY AVG(mark) DESC; 
  