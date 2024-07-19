use lab3_CorpEmpDb;

-- Insert Data
INSERT INTO POSITION (PositionId, PosDesc) VALUES
(1, 'Manager'),
(2, 'Developer'),
(3, 'Analyst'),
(4, 'Designer'),
(5, 'Tester');

INSERT INTO QUALIFICATION (QualId, QualDesc) VALUES
(1, 'Bachelor\'s Degree'),
(2, 'Master\'s Degree'),
(3, 'Certification'),
(4, 'Diploma'),
(5, 'Ph.D.');

INSERT INTO EMPLEVEL (LevelNo, LowSalary, HighSalary) VALUES
(1, 50000.00, 70000.00),
(2, 70000.00, 90000.00),
(3, 90000.00, 120000.00),
(4, 120000.00, 150000.00),
(5, 150000.00, 200000.00);

INSERT INTO DEPT (DeptId, DeptName, Location, EmployeeId) VALUES
(1, 'IT Department', 'Headquarters', 101),
(2, 'HR Department', 'Branch Office', 201),
(3, 'Finance Department', 'Remote Office', 301),
(4, 'Marketing Department', 'Central Office', 401),
(5, 'Operations Department', 'Main Office', 501);

INSERT INTO EMPLOYEE (EmployeeId, Lname, Fname, PositionId, Supervisor, HireDate, Salary, Commission, DeptId, QualId) VALUES
(101, 'Smith', 'John', 2, NULL, '2022-01-15', 80000.00, 0.05, 1, 1),
(201, 'Johnson', 'Emily', 1, 101, '2022-02-20', 95000.00, 0.02, 2, 2),
(301, 'Williams', 'David', 3, 101, '2022-03-10', 110000.00, 0.03, 3, 3),
(401, 'Jones', 'Maria', 4, 201, '2022-04-05', 130000.00, 0.01, 4, 4),
(501, 'Brown', 'Robert', 2, NULL, '2022-05-15', 85000.00, 0.04, 5, 5);

INSERT INTO DEPENDENT (EmployeeId, DependentId, DepDOB, Relation) VALUES
(101, 1, '2000-03-12', 'Child'),
(201, 2, '1995-08-22', 'Spouse'),
(301, 3, '2010-01-05', 'Child'),
(401, 4, '1980-11-18', 'Parent'),
(501, 5, '2018-07-30', 'Child');

-- Q1
SELECT E.Fname AS FirstName, E.Lname AS LastName, D.DeptName AS DepartmentName
FROM EMPLOYEE E
JOIN DEPT D ON E.DeptId = D.DeptId;

-- Insert statement for EMPLOYEE table
INSERT INTO EMPLOYEE (EmployeeId, Lname, Fname, PositionId, Supervisor, HireDate, Salary, Commission, DeptId, QualId) VALUES
(433, 'Doe', 'Jane', 2, 332, '2022-06-01', 90000.00, 0.02, 3, 2);

-- Q2
SELECT 
    E1.Fname AS EmployeeFirstName, 
    E1.Lname AS EmployeeLastName,
    E2.Fname AS SupervisorFirstName,
    E2.Lname AS SupervisorLastName
FROM 
    EMPLOYEE E1
LEFT JOIN 
    EMPLOYEE E2 ON E1.Supervisor = E2.EmployeeId
WHERE 
    E1.EmployeeId = 433;
    
    
-- Q3
SELECT 
    CONCAT(E1.Lname, ', ', E1.Fname) AS EmployeeFullName,
    E1.Salary AS EmployeeSalary,
    CONCAT(E2.Lname, ', ', E2.Fname) AS SupervisorFullName,
    E2.Salary AS SupervisorSalary
FROM 
    EMPLOYEE E1
LEFT JOIN 
    EMPLOYEE E2 ON E1.Supervisor = E2.EmployeeId;
    



    



