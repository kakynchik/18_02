use master;
go
Create Database workii;
go
use workii;
go
Create Table kafedraa
(
    pole1 INT,
    pole2 VARCHAR(255),
    pole3 DATE
);
go

Create Table groups
(
    group_name   VARCHAR(255),
    group_rating INT
);
go

Create Table teachers
(
    teacher_name    VARCHAR(255),
    teacher_surname VARCHAR(255),
    teacher_rating  INT,
    base_salary     DECIMAL(10, 2),
    bonus           DECIMAL(10, 2),
    hire_date       DATE
);
go

INSERT INTO kafedraa (pole1, pole2, pole3)
VALUES (1, 'Department A', '2023-01-01');
INSERT INTO kafedraa (pole1, pole2, pole3)
VALUES (2, 'Department B', '2023-02-01');
INSERT INTO kafedraa (pole1, pole2, pole3)
VALUES (3, 'Department C', '2023-03-01');
INSERT INTO kafedraa (pole1, pole2, pole3)
VALUES (4, 'Department D', '2023-04-01');
INSERT INTO kafedraa (pole1, pole2, pole3)
VALUES (5, 'Department E', '2023-05-01');
INSERT INTO kafedraa (pole1, pole2, pole3)
VALUES (6, 'Department F', '2023-06-01');
INSERT INTO kafedraa (pole1, pole2, pole3)
VALUES (7, 'Department G', '2023-07-01');
INSERT INTO kafedraa (pole1, pole2, pole3)
VALUES (8, 'Department H', '2023-08-01');
INSERT INTO kafedraa (pole1, pole2, pole3)
VALUES (9, 'Department I', '2023-09-01');
INSERT INTO kafedraa (pole1, pole2, pole3)
VALUES (10, 'Department J', '2023-10-01');
go

INSERT INTO groups (group_name, group_rating)
VALUES ('Group A', 1);
INSERT INTO groups (group_name, group_rating)
VALUES ('Group B', 2);
INSERT INTO groups (group_name, group_rating)
VALUES ('Group C', 3);
INSERT INTO groups (group_name, group_rating)
VALUES ('Group D', 4);
INSERT INTO groups (group_name, group_rating)
VALUES ('Group E', 5);
INSERT INTO groups (group_name, group_rating)
VALUES ('Group F', 6);
INSERT INTO groups (group_name, group_rating)
VALUES ('Group G', 7);
INSERT INTO groups (group_name, group_rating)
VALUES ('Group H', 8);
INSERT INTO groups (group_name, group_rating)
VALUES ('Group I', 9);
INSERT INTO groups (group_name, group_rating)
VALUES ('Group J', 10);
go

INSERT INTO teachers (teacher_name, teacher_surname, teacher_rating, base_salary, bonus)
VALUES ('John', 'Doe', 1, 50000, 5000);
INSERT INTO teachers (teacher_name, teacher_surname, teacher_rating, base_salary, bonus)
VALUES ('Jane', 'Smith', 2, 55000, 5500);
INSERT INTO teachers (teacher_name, teacher_surname, teacher_rating, base_salary, bonus)
VALUES ('Jim', 'Brown', 3, 60000, 6000);
INSERT INTO teachers (teacher_name, teacher_surname, teacher_rating, base_salary, bonus)
VALUES ('Jack', 'Davis', 4, 65000, 6500);
INSERT INTO teachers (teacher_name, teacher_surname, teacher_rating, base_salary, bonus)
VALUES ('Jill', 'Wilson', 5, 70000, 7000);
INSERT INTO teachers (teacher_name, teacher_surname, teacher_rating, base_salary, bonus)
VALUES ('Jerry', 'Moore', 6, 75000, 7500);
INSERT INTO teachers (teacher_name, teacher_surname, teacher_rating, base_salary, bonus)
VALUES ('Jenny', 'Taylor', 7, 80000, 8000);
INSERT INTO teachers (teacher_name, teacher_surname, teacher_rating, base_salary, bonus)
VALUES ('Joe', 'Anderson', 8, 85000, 8500);
INSERT INTO teachers (teacher_name, teacher_surname, teacher_rating, base_salary, bonus)
VALUES ('Jessica', 'Thomas', 9, 90000, 9000);
INSERT INTO teachers (teacher_name, teacher_surname, teacher_rating, base_salary, bonus)
VALUES ('Jordan', 'Jackson', 10, 95000, 9500);
go

SELECT group_name AS "Group Name", group_rating AS "Group Rating"
FROM groups;
go

SELECT teacher_surname                             AS "Teacher Surname",
       (bonus / base_salary) * 100                 AS "Bonus Percentage",
       (base_salary / (base_salary + bonus)) * 100 AS "Base Salary Percentage"
FROM teachers;
go

SELECT 'The dean of faculty ' + pole2 + ' is ' + CAST(pole1 AS VARCHAR) + '.' AS "Faculty Info"
FROM kafedraa;
go

SELECT teacher_surname AS "Teacher Surname"
FROM teachers
WHERE teacher_rating = 1
  AND base_salary > 1050;
go
SELECT pole2 AS "Department Name"
FROM kafedraa
WHERE pole1 < 11000
   OR pole1 > 25000;
go
SELECT pole2 AS "Department Name"
FROM kafedraa
WHERE pole1 < 11000
   OR pole1 > 25000
    AND pole2 != 'Computer Science';
go
SELECT teacher_surname AS "Teacher Surname",
       teacher_rating  AS "Teacher Rating"
FROM teachers
WHERE teacher_rating != 0;
go
SELECT teacher_surname AS "Teacher Surname",
       teacher_rating  AS "Teacher Rating",
       base_salary     AS "Base Salary",
       bonus           AS "Bonus"
FROM teachers
WHERE teacher_rating = 0
  AND bonus BETWEEN 160 AND 550;
go
SELECT teacher_surname AS "Teacher Surname",
       base_salary     AS "Base Salary"
FROM teachers
WHERE teacher_rating = 0;
go

SELECT teacher_surname AS "Teacher Surname",
       teacher_rating  AS "Teacher Rating"
FROM teachers
WHERE hire_date < '2000-01-01';
go
SELECT pole2 AS "Name of Department"
FROM kafedraa
WHERE pole2 < 'Software Development'
ORDER BY pole2;
go
SELECT teacher_surname AS "Teacher Surname"
FROM teachers
WHERE CAST(teacher_rating AS INT) = 1
  AND (base_salary + bonus) <= 1200;
go
SELECT group_name AS "Group Name"
FROM groups
WHERE group_rating BETWEEN 2 AND 4;
go
SELECT teacher_surname AS "Teacher Surname"
FROM teachers
WHERE CAST(teacher_rating AS INT) = 1
  AND (base_salary < 550 OR bonus < 200);
go
