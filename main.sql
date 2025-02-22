CREATE DATABASE Hospital;
go
use Hospital;
go


CREATE TABLE Departments (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Building INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    Financing MONEY NOT NULL DEFAULT 0 CHECK (Financing >= 0),
    Floor INT NOT NULL CHECK (Floor >= 1),
    Name NVARCHAR(100) NOT NULL UNIQUE CHECK (Name <> '')
);
go


CREATE TABLE Doctors (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    PhoneNumber NVARCHAR(15) NOT NULL,
    Salary MONEY NOT NULL DEFAULT 0 CHECK (Salary >= 0),
    Premium MONEY NOT NULL DEFAULT 0 CHECK (Premium >= 0)
);
go


CREATE TABLE Diseases (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Severity NVARCHAR(50) NOT NULL
);
go


CREATE TABLE Wards (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Building INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    Floor INT NOT NULL CHECK (Floor >= 1),
    Name NVARCHAR(100) NOT NULL
)
go


CREATE TABLE Examination (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    DayOfWeek NVARCHAR(10) NOT NULL,
    EndTime TIME NOT NULL,
    Name NVARCHAR(100) NOT NULL,
    StartTime TIME NOT NULL
)
go


INSERT INTO Departments (Building, Financing, Floor, Name) VALUES (1, 5000, 1, 'Cardiology');
INSERT INTO Departments (Building, Financing, Floor, Name) VALUES (2, 15000, 2, 'Neurology');
INSERT INTO Departments (Building, Financing, Floor, Name) VALUES (3, 20000, 3, 'Oncology');
INSERT INTO Departments (Building, Financing, Floor, Name) VALUES (4, 10000, 1, 'Pediatrics');
INSERT INTO Departments (Building, Financing, Floor, Name) VALUES (5, 25000, 2, 'Orthopedics');


INSERT INTO Doctors (Name, LastName, PhoneNumber, Salary, Premium) VALUES ('John', 'Doe', '1234567890', 2000, 500);
INSERT INTO Doctors (Name, LastName, PhoneNumber, Salary, Premium) VALUES ('Jane', 'Smith', '0987654321', 2500, 600);
INSERT INTO Doctors (Name, LastName, PhoneNumber, Salary, Premium) VALUES ('Emily', 'Jones', '1122334455', 3000, 700);
INSERT INTO Doctors (Name, LastName, PhoneNumber, Salary, Premium) VALUES ('Michael', 'Brown', '2233445566', 3500, 800);
INSERT INTO Doctors (Name, LastName, PhoneNumber, Salary, Premium) VALUES ('Sarah', 'Davis', '3344556677', 4000, 900);


INSERT INTO Diseases (Name, Severity) VALUES ('Flu', 'Mild');
INSERT INTO Diseases (Name, Severity) VALUES ('Cancer', 'Severe');
INSERT INTO Diseases (Name, Severity) VALUES ('Diabetes', 'Moderate');
INSERT INTO Diseases (Name, Severity) VALUES ('Asthma', 'Moderate');
INSERT INTO Diseases (Name, Severity) VALUES ('COVID-19', 'Severe');


INSERT INTO Wards (Building, Floor, Name) VALUES (1, 1, 'Ward A');
INSERT INTO Wards (Building, Floor, Name) VALUES (2, 2, 'Ward B');
INSERT INTO Wards (Building, Floor, Name) VALUES (3, 3, 'Ward C');
INSERT INTO Wards (Building, Floor, Name) VALUES (4, 1, 'Ward D');
INSERT INTO Wards (Building, Floor, Name) VALUES (5, 2, 'Ward E');


INSERT INTO Examination (DayOfWeek, EndTime, Name, StartTime) VALUES ('Monday', '14:00', 'Blood Test', '12:00');
INSERT INTO Examination (DayOfWeek, EndTime, Name, StartTime) VALUES ('Tuesday', '15:00', 'X-Ray', '13:00');
INSERT INTO Examination (DayOfWeek, EndTime, Name, StartTime) VALUES ('Wednesday', '16:00', 'MRI', '14:00');
INSERT INTO Examination (DayOfWeek, EndTime, Name, StartTime) VALUES ('Thursday', '17:00', 'CT Scan', '15:00');
INSERT INTO Examination (DayOfWeek, EndTime, Name, StartTime) VALUES ('Friday', '18:00', 'Ultrasound', '16:00');


SELECT Name AS [Ward Name]
FROM Wards
WHERE (Building = 4 OR Building = 5) AND Floor = 1;
go


SELECT Name AS [Department Name], Building, Financing
FROM Departments
WHERE (Building = 3 OR Building = 6) AND (Financing < 11000 OR Financing > 25000);
go


SELECT LastName AS [Doctor Last Name]
FROM Doctors
WHERE (Salary + Premium) > 1500;
go


SELECT LastName AS [Doctor Last Name]
FROM Doctors
WHERE (Salary / 2) > (Premium * 3);
go


SELECT DISTINCT Name AS [Examination Name]
FROM Examination
WHERE DayOfWeek IN ('Monday', 'Tuesday', 'Wednesday') AND StartTime >= '12:00' AND EndTime <= '15:00';
go


SELECT Name AS [Department Name], Building
FROM Departments
WHERE Building IN (1, 3, 8, 10);
go


SELECT Name AS [Name of Disease], Severity AS [Severity of Disease]
FROM Diseases
WHERE Severity NOT IN ('1', '2');
go


SELECT Name AS [Department Name], Building
FROM Departments
WHERE Building NOT IN (1, 3);
go


SELECT Name AS [Department Name]
FROM Departments
WHERE Building IN (1, 3);
go


SELECT LastName AS [Doctor Last Name]
FROM Doctors
WHERE LastName LIKE 'N%';
go


SELECT LastName AS [Doctor Last Name]
FROM Doctors
WHERE (Salary + Premium) > 1500;
go


SELECT Name AS [Department Name], Building, Financing
FROM Departments
WHERE (Building = 3 OR Building = 6) AND (Financing < 11000 OR Financing > 25000);
go


SELECT Name AS [Department Name]
FROM Departments
WHERE (Building = 4 OR Building = 5) AND Floor = 1;
go


SELECT Name AS [Department Name]
FROM Departments
WHERE Building = 3 AND Financing BETWEEN 12000 AND 15000;
go


SELECT Name AS [Department Name]
FROM Departments
WHERE Building = 5 AND Financing < 30000;
go


SELECT d.Name AS [Department Name], doc.LastName AS [Doctor Last Name], dis.Name AS [Disease Name]
FROM Departments d, Doctors doc, Diseases dis;
go


SELECT Name AS [Name of Disease], Severity AS [Severity of Disease] FROM Diseases;

go


SELECT DISTINCT Floor FROM Departments;
go


SELECT * FROM Departments;
go