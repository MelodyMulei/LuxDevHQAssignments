create schema if not exists nairobi_academy;

--TABLE STUDENTS

CREATE TABLE nairobi_academy.students (
stident_id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) not null,
gender VARCHAR (1),
date_of_birth DATE,
class VARCHAR (10),
city VARCHAR (50)
);

alter table nairobi_academy.students
rename column stident_id to student_id;
--TABLE SUBJECTS

create table nairobi_academy.subjects (
subject_id INT primary key,
subject_name varchar(100) not null UNIQUE,
department varchar(20),
teacher_name varchar(100),
credits INT
);

--TABLE 3 EXAM RESULTS

create table nairobi_academy.exam_results (
result_id INT primary key,
student_id int not null,
subject_id int not null,
marks int not null,
exam_date date,
grade varchar(2)
);

--ADD NEW COLUMN PHONE NUMBER
alter table nairobi_academy.students
ADD COLUMN phone_number VARCHAR(20);

-- RENAME COLUMN CREDITS
ALTER TABLE nairobi_academy.subjects
RENAME COLUMN credits TO credit_hours;

--DROP COLUMN PHONE NUMBER
ALTER TABLE nairobi_academy.students
DROP COLUMN phone_number;

--FILLING THE DATABASE (DML:insert,update,delete)
insert into nairobi_academy.students 
(student_id,first_name,last_name,gender,date_of_birth,class,city)
values
(1,'Amina','Wanjiku','F','2008-03-12','Form 3','Nairobi'),
(2,'Brian','Ochieng','M','2007-07-25','Form 4', 'Mombasa'),
(3,'Cynthia','Mutua','F','2008-11-05','Form 3','Kisumu'),
(4,'David','Kamau','M','2007-02-18','Form 4','Nairobi'),
(5,'Esther','Akinyi','F','2009-06-30','Form 2','Nakuru'),
(6,'Felix','Otieno','M','2009-09-14','Form 2','Eldoret'),
(7,'Grace','Mwangi','F','2008-01-22','Form 3','Nairobi'),
(8,'Hassan','Abdi','M','2007-04-09','Form 4','Mombasa'),
(9,'Ivy','Chebet','F','2009-12-01','Form 2','Nakuru'),
(10,'James','Kariuki','M','2008-08-17','Form 3','Nairobi');

select *from nairobi_academy.students

insert into nairobi_academy.subjects
(subject_id,subject_name,department,teacher_name,credit_hours)
values 
(1,'Mathematics','Sciences','Mr. Njoroge',4),
(2,'English','Languages','Ms. Adhiambo',3),
(3,'Biology','Sciences','Ms. Otieno',4),
(4,'History','Humanities','Mr. Waweru',3),
(5,'Kiswahili','Languages','Ms. Nduta',3),
(6,'Physics','Sciences','Mr. Kamande',4),
(7,'Geography','Humanities','Ms. Chebet',3),
(8,'Chemistry','Sciences','Ms. Muthoni',4),
(9,'Computer Stuides','Sciences','Mr. Oduya',3),
(10,'Business Studies','Humanities','Ms. Wangari',3);

select *from nairobi_academy.subjects

insert into nairobi_academy.exam_results
(result_id,student_id,subject_id,marks,exam_date,grade)
values
(1,1,1,78,'2024-03-15','B'),
(2,1,2,85,'2024-03-16','A'),
(3,2,1,92,'2024-03-15','A'),
(4,2,3,55,'2024-03-17','C'),
(5,3,2,49,'2024-03-16','D'),
(6,3,4,71,'2024-03-18','B'),
(7,4,1,88,'2024-03-15','A'),
(8,4,6,63,'2024-03-19','C'),
(9,5,5,39,'2024-03-20','F'),
(10,6,9,95,'2024-03-21','A');

select *from nairobi_academy.exam_results

update nairobi_academy.students
set city='Nairobi'
where student_id='5';

update nairobi_academy.exam_results
set marks=49
where result_id=5;

DELETE FROM nairobi_academy.exam_results
WHERE result_id = 9;

/*SECTION C  Querying the Data (Filtering with WHERE)
Q15. Write a query to find all students who are in Form 4.
**/
select *from nairobi_academy.students
where class='Form 4';

--Q16. Write a query to find all subjects in the Sciences department.
select *from nairobi_academy.subjects
where department='Sciences';

--Q17. Write a query to find all exam results where the marks are greater than or equal to 70.
select *from nairobi_academy.exam_results
where marks>=70;

--Q18. Write a query to find all female students only. (Hint: gender = 'F')
select *from nairobi_academy.students
where gender='F';

--Q19. Write a query to find all students who are in Form 3 AND from Nairobi.
select *from nairobi_academy.students
where class='Form 3' and city='Nairobi';

--Q20. Write a query to find all students who are in Form 2 OR Form 4
select *from nairobi_academy.students
where class='Form 2' or class='Form 4';

/*PART2 - BETWEEN, IN/NOT IN, LIKE, COUNT, and CASE WHEN
SECTION A - Range, Membership & Search Operators
**/
 
 --Q1. Write a query to find all exam results where marks are between 50 and 80 (inclusive)
 select * from nairobi_academy.exam_results
 where marks between 50 and 80;
 
 --Q2. Write a query to find all exams that took place between 15th March 2024 and 18th March 2024.
select * from nairobi_academy.exam_results
 where exam_date between '2024-03-15' and '2024-03-18';
 
 --Q3. Write a query to find all students who live in Nairobi, Mombasa, or Kisumu - use IN.
 select * from nairobi_academy.students
 where city in ('Nairobi','Mombasa','Kisumu');
 
 --Q4. Write a query to find all students who are NOT in Form 2 or Form 3 - use NOT IN.
  select * from nairobi_academy.students
  where class not in ('Form 2', 'Form 3');
 
 --Q5. Write a query to find all students whose first name starts with the letter 'A' or 'E' - use LIKE.
SELECT *
FROM nairobi_academy.students
WHERE first_name LIKE 'A%'
   OR first_name LIKE 'E%';
 
 --Q6. Write a query to find all subjects whose subject name contains the word 'Studies'.
 SELECT *
FROM nairobi_academy.subjects
WHERE subject_name LIKE '%Studies%'

/*SECTION B - COUNT
Q7. How many students are currently in Form 3? Write the query.
**/
SELECT COUNT(*) AS total_form_3_students
FROM nairobi_academy.students
WHERE class = 'Form 3';

--Q8. How many exam results have a mark of 70 or above? Write the query.
select count (*) as marks_greater_or_equal_to_70
from nairobi_academy.exam_results
where marks>=70;

/*SECTION C - CASE WHEN
Q9. Write a query using CASE WHEN to label each exam result with a grade description:
•	'Distinction' if marks >= 80
•	'Merit' if marks >= 60
•	'Pass' if marks >= 40
•	'Fail' if marks below 40
Call the new column performance.
**/
SELECT *,
    CASE 
        WHEN marks >= 80 THEN 'Distinction'
        WHEN marks >= 60 THEN 'Merit'
        WHEN marks >= 40 THEN 'Pass'
        ELSE 'Fail'
    END AS performance
FROM nairobi_academy.exam_results;

/*Q10. Write a query using CASE WHEN to label each student as:
•	'Senior' if they are in Form 3 or Form 4
•	'Junior' if they are in Form 2 or Form 1
Call the new column student_level. Show the student's first name, last name, class, and student_level in your result.
**/
SELECT 
    first_name,
    last_name,
    class,
    CASE 
        WHEN class = 'Form 3' OR class = 'Form 4' THEN 'Senior'
        ELSE 'Junior'
    END AS student_level
FROM nairobi_academy.students;
	
	e
end







