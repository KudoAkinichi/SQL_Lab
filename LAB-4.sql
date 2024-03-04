create database lab4;
use lab4;

CREATE TABLE EMPLOYEE(EmployeeID INT PRIMARY KEY,Fname VARCHAR(10),Lname VARCHAR(10),PostionId INT,Supervisor VARCHAR(10),
HireDate DATE,Salary INT,Commission INT,DeptID INT,QualID INT);

ALTER TABLE EMPLOYEE
MODIFY COLUMN Supervisor VARCHAR(20);


INSERT INTO EMPLOYEE (EmployeeID, Fname, Lname, PostionId, Supervisor, HireDate, Salary, Commission, DeptID, QualID)
VALUES 
  (1, 'John', 'Doe', 101, 'SupervisorA', '2024-01-01', 50000, 2000, 1, 101),
  (2, 'Jane', 'Smith', 102, 'SupervisorB', '2024-02-01', 55000, 2500, 2, 102),
  (3, 'Bob', 'Johnson', 103, 'SupervisorC', '2024-03-01', 60000, 3000, 1, 103),
  (4, 'Alice', 'Williams', 104, 'SupervisorD', '2024-04-01', 65000, 3500, 2, 104),
  (5, 'Charlie', 'Brown', 105, 'SupervisorE', '2024-05-01', 70000, 4000, 1, 105);

-- Question-1
SELECT CONCAT(Lname, ', ', Fname) AS employee_name, Salary AS employee_salary
FROM EMPLOYEE;

-- Q2
SELECT * 
FROM EMPLOYEE
WHERE Commission IS NULL OR Commission = 0;

CREATE TABLE LOCATION (
    LocationID INT PRIMARY KEY,
    BuildingName VARCHAR(50) NOT NULL,
    FloorNumber INT,
    RoomNumber VARCHAR(20),
    City VARCHAR(50),
    Country VARCHAR(50)
);

INSERT INTO LOCATION (LocationID, BuildingName, FloorNumber, RoomNumber, City, Country)
VALUES
  (1, 'Main Office', 2, '205', 'New York', 'USA'),
  (2, 'Tech Park', 1, '101', 'San Francisco', 'USA'),
  (3, 'Downtown Tower', 10, '1001', 'London', 'UK'),
  (4, 'Corporate Plaza', 5, '502', 'Tokyo', 'Japan'),
  (5, 'City Center', 3, '305', 'Sydney', 'Australia');

-- Q3
SELECT DISTINCT BuildingName
FROM LOCATION;

CREATE TABLE COURSE_SECTION (
    SectionID INT PRIMARY KEY,
    CourseCode VARCHAR(20) NOT NULL,
    Instructor VARCHAR(50),
    Term VARCHAR(20),
    Year INT,
    RoomNumber VARCHAR(20)
);

INSERT INTO COURSE_SECTION (SectionID, CourseCode, Instructor, Term, Year, RoomNumber)
VALUES
  (1, 'CS101', 'Prof. Smith', 'Winter', 2003, 'Room 101'),
  (2, 'ENG201', 'Dr. Johnson', 'Winter', 2003, 'Room 202'),
  (3, 'MATH301', 'Dr. White', 'Winter', 2003, 'Room 303'),
  (4, 'PHYS101', 'Prof. Brown', 'Winter', 2003, 'Room 404'),
  (5, 'CHEM201', 'Prof. Davis', 'Winter', 2003, 'Room 505');
  
-- Q4  
SELECT *
FROM COURSE_SECTION
WHERE Term = 'Winter' AND Year = 2003;

-- Q5
SELECT Fname, Lname
FROM EMPLOYEE
WHERE DeptID IN (1, 2);

CREATE TABLE STUDENT (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    State VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO STUDENT (StudentID, FirstName, LastName, State, City)
VALUES
  (1, 'John', 'Doe', 'New York', 'New York City'),
  (2, 'Jane', 'Smith', 'New Jersey', 'Jersey City'),
  (3, 'Bob', 'Johnson', 'New York', 'Albany'),
  (4, 'Alice', 'Williams', 'New Jersey', 'Newark'),
  (5, 'Charlie', 'Brown', 'New York', 'Syracuse');
 
-- Q6
SELECT *
FROM STUDENT
WHERE State IN ('New York', 'New Jersey');


INSERT INTO EMPLOYEE (EmployeeID, Fname, Lname, PostionId, Supervisor, HireDate, Salary, Commission, DeptID, QualID)
VALUES (111, 'John', 'Doe', 1, 'SupervisorA', '2022-01-01', 50000, 2000, 1, 101);

-- Q7
UPDATE employee
SET Salary = Salary * 1.1
WHERE EmployeeID = 111;

CREATE TABLE DEPARTMENT (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL,
    Location VARCHAR(50),
    Manager VARCHAR(50)
);

INSERT INTO DEPARTMENT (DeptID, DeptName, Location, Manager)
VALUES
  (10, 'HR Department', 'New York', 'John Manager'),
  (20, 'IT Department', 'San Francisco', 'Jane Manager'),
  (30, 'Finance Department', 'London', 'Bob Manager'),
  (40, 'Marketing Department', 'Tokyo', 'Alice Manager'),
  (50, 'Operations Department', 'Sydney', 'Charlie Manager');
  
-- Q8
DELETE FROM DEPARTMENT
WHERE DeptID = 30;


CREATE TABLE ENROLLMENT (
    EnrollmentID INT PRIMARY KEY,
    CourseID INT,
    StudentID INT
);

INSERT INTO ENROLLMENT (EnrollmentID, CourseID, StudentID)
VALUES
  (1, 101, 1),
  (2, 101, 2),
  (3, 102, 3),
  (4, 103, 4),
  (5, 104, 5);

-- Q9
SELECT CourseID, COUNT(StudentID) AS EnrollmentCount
FROM ENROLLMENT
GROUP BY CourseID
ORDER BY EnrollmentCount DESC;


CREATE TABLE TERM (
    TermID INT PRIMARY KEY,
    TermName VARCHAR(50) NOT NULL
);


INSERT INTO TERM (TermID, TermName)
VALUES
  (1, 'Spring 2023'),
  (2, 'Summer 2023'),
  (3, 'Fall 2023'),
  (4, 'Winter 2023'),
  (5, 'Spring 2024');

-- Q10
INSERT INTO TERM (TermID, TermName)
VALUES (6, 'Fall 2024');














