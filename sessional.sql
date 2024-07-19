create database q1;
use q1;

CREATE TABLE EMPLOYEES (
    ENO INT PRIMARY KEY,
    ENAME VARCHAR(50),
    ZIP VARCHAR(10),
    HDATE DATE
);


INSERT INTO EMPLOYEES (ENO, ENAME, ZIP, HDATE) VALUES
(1, 'John Doe', '110001', '2022-01-01'),
(2, 'Jane Smith', '110002', '2022-02-15'),
(3, 'Alice Johnson', '110003', '2022-03-20');


CREATE TABLE PARTS (
    PNO INT PRIMARY KEY,
    PNAME VARCHAR(50),
    QOH INT,
    PRICE DECIMAL(10,2),
    LEVEL INT
);


INSERT INTO PARTS (PNO, PNAME, QOH, PRICE, LEVEL) VALUES
(101, 'Widget', 100, 75.00, 1),
(102, 'Gadget', 50, 100.00, 2),
(103, 'Doohickey', 75, 50.00, 1);

-- Create Customers table
CREATE TABLE CUSTOMERS (
    CNO INT PRIMARY KEY,
    CNAME VARCHAR(50),
    STREET VARCHAR(100),
    ZIP VARCHAR(10),
    PHONE VARCHAR(15)
);


INSERT INTO CUSTOMERS (CNO, CNAME, STREET, ZIP, PHONE) VALUES
(1, 'Acme Inc.', '123 Main St', '110001', '555-1234'),
(2, 'ABC Corp', '456 Elm St', '110002', '555-5678'),
(3, 'XYZ Company', '789 Oak St', '110003', '555-9012');


CREATE TABLE ORDERS (
    ONO INT PRIMARY KEY,
    CNO INT,
    ENO INT,
    RECEIVED_DATE DATE,
    SHIPPED_DATE DATE
);


INSERT INTO ORDERS (ONO, CNO, ENO, RECEIVED_DATE, SHIPPED_DATE) VALUES
(1, 1, 1, '2024-04-01', '2024-04-03'),
(2, 2, 2, '2024-04-02', '2024-04-04'),
(3, 3, 3, '2024-04-03', '2024-04-05');


CREATE TABLE ORDER_DETAILS (
    ONO INT,
    PNO INT,
    QTY INT,
    PRIMARY KEY (ONO, PNO),
    FOREIGN KEY (ONO) REFERENCES ORDERS(ONO),
    FOREIGN KEY (PNO) REFERENCES PARTS(PNO)
);


INSERT INTO ORDER_DETAILS (ONO, PNO, QTY) VALUES
(1, 101, 5),
(2, 102, 10),
(3, 103, 8);


CREATE TABLE ZIPCODES (
    ZIP VARCHAR(10) PRIMARY KEY,
    CITY VARCHAR(50),
    STATE VARCHAR(50)
);

-- Insert sample data into Zipcodes table
INSERT INTO ZIPCODES (ZIP, CITY, STATE) VALUES
('110001', 'New Delhi', 'Delhi'),
('110002', 'New Delhi', 'Delhi'),
('110003', 'New Delhi', 'Delhi');


SELECT DISTINCT e.ENAME, z.CITY
FROM EMPLOYEES e
JOIN ORDERS o ON e.ENO = o.ENO
JOIN ORDER_DETAILS od ON o.ONO = od.ONO
JOIN PARTS p ON od.PNO = p.PNO
JOIN ZIPCODES z ON e.ZIP = z.ZIP
WHERE p.PRICE > 50;


SELECT DISTINCT c.CNAME
FROM CUSTOMERS c
JOIN ORDERS o ON c.CNO = o.CNO
JOIN EMPLOYEES e ON o.ENO = e.ENO
JOIN ZIPCODES z ON e.ZIP = z.ZIP
WHERE z.CITY = 'New Delhi';

-- Q2
-- Create Employee table
CREATE TABLE Employee (
    Eid INT PRIMARY KEY,
    Department_no INT,
    Salary DECIMAL(10, 2)
);

-- Insert sample data into Employee table
INSERT INTO Employee (Eid, Department_no, Salary) VALUES
(1, 1, 50000.00),
(2, 1, 55000.00),
(3, 1, 60000.00),
(4, 2, 45000.00),
(5, 2, 48000.00),
(6, 2, 52000.00),
(7, 3, 60000.00),
(8, 3, 62000.00),
(9, 3, 65000.00);


SELECT Eid
FROM Employee
WHERE Salary = (SELECT MAX(Salary) FROM Employee);


SELECT Eid, Department_no
FROM Employee E1
WHERE Salary = (SELECT MAX(Salary) FROM Employee E2 WHERE E2.Department_no = E1.Department_no);


SELECT Department_no
FROM (
    SELECT Department_no, AVG(Salary) AS DeptAvgSalary
    FROM Employee
    GROUP BY Department_no
) AS DeptAvg
WHERE DeptAvg.DeptAvgSalary > (SELECT AVG(Salary) FROM Employee);


SELECT Eid, Department_no
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Department_no ORDER BY Salary DESC) AS salary_rank
    FROM Employee
) AS RankedEmployees
WHERE salary_rank = 2;


-- Q3

CREATE TABLE Student (
    Sid VARCHAR(10) PRIMARY KEY,
    Age INT,
    Sex CHAR(1)
);


INSERT INTO Student (Sid, Age, Sex) VALUES
('S1', 20, 'M'),
('S2', 22, 'F'),
('S3', 21, 'M'),
('S4', 19, 'F');


CREATE TABLE Course (
    Cid VARCHAR(10) PRIMARY KEY,
    Faculty CHAR(1)
);


INSERT INTO Course (Cid, Faculty) VALUES
('C1', 'A'),
('C2', 'A'),
('C3', 'A'),
('C4', 'B'),
('C5', 'B'),
('C6', 'B'),
('C7', 'C');


CREATE TABLE Enroll (
    Sid VARCHAR(10),
    Cid VARCHAR(10),
    PRIMARY KEY (Sid, Cid),
    FOREIGN KEY (Sid) REFERENCES Student(Sid),
    FOREIGN KEY (Cid) REFERENCES Course(Cid)
);


INSERT INTO Enroll (Sid, Cid) VALUES
('S1', 'C1'),
('S1', 'C2'),
('S1', 'C3'),
('S2', 'C1'),
('S2', 'C2'),
('S2', 'C4'),
('S3', 'C1'),
('S3', 'C5'),
('S4', 'C2');


SELECT Sid
FROM (
    SELECT Sid, COUNT(CASE WHEN c.Faculty = 'A' THEN 1 END) AS A_Count,
                 COUNT(CASE WHEN c.Faculty = 'B' THEN 1 END) AS B_Count
    FROM Enroll e
    JOIN Course c ON e.Cid = c.Cid
    GROUP BY Sid
) AS FacultyCounts
WHERE A_Count > B_Count;


SELECT EnrollCounts.Sid
FROM (
    SELECT s.Sid, COUNT(DISTINCT c.Cid) AS TotalCourses
    FROM Student s
    CROSS JOIN Course c
    LEFT JOIN Enroll e ON s.Sid = e.Sid AND c.Cid = e.Cid
    WHERE c.Faculty IN ('A', 'B')
    GROUP BY s.Sid
) AS EnrollCounts
WHERE TotalCourses = (SELECT COUNT(*) FROM Course WHERE Faculty IN ('A', 'B'));






