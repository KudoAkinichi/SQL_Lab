create database lab3_CorpEmpDb;
use lab3_CorpEmpDb;

CREATE TABLE POSITION (
    PositionId INT PRIMARY KEY,
    PosDesc VARCHAR(50) UNIQUE
);

CREATE TABLE QUALIFICATION (
    QualId INT PRIMARY KEY,
    QualDesc VARCHAR(50) UNIQUE
);

CREATE TABLE EMPLEVEL (
    LevelNo INT PRIMARY KEY,
    LowSalary DECIMAL(10, 2) NOT NULL,
    HighSalary DECIMAL(10, 2) NOT NULL
);

CREATE TABLE DEPT (
    DeptId INT PRIMARY KEY,
    DeptName VARCHAR(50) UNIQUE,
    Location VARCHAR(100),
    EmployeeId INT
);
-- FOREIGN KEY (EmployeeId) REFERENCES EMPLOYEE(EmployeeId) 


CREATE TABLE EMPLOYEE (
    EmployeeId INT PRIMARY KEY,
    Lname VARCHAR(50) NOT NULL,
    Fname VARCHAR(50) NOT NULL,
    PositionId INT,
    Supervisor INT,
    HireDate DATE,
    Salary DECIMAL(10, 2) DEFAULT 0.0,
    Commission DECIMAL(5, 2) DEFAULT 0.0,
    DeptId INT,
    QualId INT,
    UNIQUE(EmployeeId)
    -- FOREIGN KEY (PositionId) REFERENCES POSITION (PositionId),
--     FOREIGN KEY (Supervisor) REFERENCES EMPLOYEE(EmployeeId),
--     FOREIGN KEY (DeptId) REFERENCES DEPT(DeptId),
--     FOREIGN KEY (QualId) REFERENCES QUALIFICATION(QualId)
);

CREATE TABLE DEPENDENT (
    EmployeeId INT,
    DependentId INT,
    DepDOB DATE,
    Relation VARCHAR(50),
    PRIMARY KEY (EmployeeId, DependentId)
    -- FOREIGN KEY (EmployeeId) REFERENCES EMPLOYEE(EmployeeId) 
);