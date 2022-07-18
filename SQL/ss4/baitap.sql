use quanlysinhvien;

SELECT 
    `subject`.SubId,
    `subject`.SubName,
    MAX(Credit) AS max_credit
FROM
    `subject`;
  
SELECT 
    `subject`.SubId, `subject`.SubName, MAX(Mark) AS max_mark
FROM
    mark
        JOIN
    `subject` ON `subject`.SubId = mark.SubId; 


SELECT 
    student.StudentId, student.StudentName, AVG(Mark)
FROM
    student
        JOIN
    mark ON student.StudentId = mark.StudentId
GROUP BY StudentId
ORDER BY AVG(mark) DESC; 
  