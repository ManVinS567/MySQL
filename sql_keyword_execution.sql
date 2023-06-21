create table exams_1
(
student_id int,
subject varchar(20),
marks int
);

select * from exams_1;

INSERT INTO exams_1 VALUES
(1,'Chemistry', 91),
(1,'Physics', 91),
(2, 'Chemistry', 80),
(2, 'Physics', 80),
(3, 'Chemisry', 71),
(3, 'Physics', 54);

--- find students with same marks in physics and chemistry

SELECT student_id FROM exams_1
WHERE subject in ('Physics', 'Chemistry')
GROUP BY student_id
HAVING count(distinct subject)=2 AND count(distinct marks)=1;

--- order by 

SELECT student_id FROM exams_1
WHERE subject in ('Physics', 'Chemistry')
GROUP BY student_id
HAVING count(DISTINCT subject)=2 AND count(DISTINCT marks)=1
ORDER BY student_id DESC; -- by default sorting is in ascending order