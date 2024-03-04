create database lab2;
use lab2;

-- Restruant booking system 
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(15),
    Email VARCHAR(255)
);

CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    Date DATE,
    Time TIME,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE ord (
    OrderID INT PRIMARY KEY,
    BookingID INT,
    Date DATE,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

CREATE TABLE Ingredients (
    IngredientID INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(255),
    Role VARCHAR(50)
);

CREATE TABLE Billing (
    BillingID INT PRIMARY KEY,
    OrderID INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES ord(OrderID)
);

-- Hospitality Management System 
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')) NOT NULL,
    DateOfBirth DATE NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE Diseases (
    DiseaseID INT PRIMARY KEY,
    DiseaseName VARCHAR(100) NOT NULL,
    Description VARCHAR(255) NOT NULL
);

CREATE TABLE Hospitals (
    HospitalID INT PRIMARY KEY,
    HospitalName VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL
);

CREATE TABLE Billing (
    BillingID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    DiseaseID INT,
    HospitalID INT,
    BillAmount DECIMAL(10, 2) NOT NULL,
    BillDate DATE NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (DiseaseID) REFERENCES Diseases(DiseaseID),
    FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID)
);

-- Car service centre
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE Cars (
    CarID INT PRIMARY KEY,
    CustomerID INT,
    Make VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    LicensePlate VARCHAR(20) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Mechanics (
    MechanicID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialization VARCHAR(100) NOT NULL
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CarID INT,
    MechanicID INT,
    ServiceDate DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (MechanicID) REFERENCES Mechanics(MechanicID)
);

CREATE TABLE Billing_Car (
    BillingID INT PRIMARY KEY,
    BookingID INT,
    BillAmount DECIMAL(10, 2) NOT NULL,
    BillDate DATE NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- Banking system
CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL
);

CREATE TABLE Bank_Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    BranchID INT,
    AccountType VARCHAR(50) NOT NULL,
    Balance DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Bank_Customers(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Position VARCHAR(100) NOT NULL,
    BranchID INT,
    ContactNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

ALTER TABLE Employees
ADD COLUMN Salary DECIMAL(10, 2);

UPDATE Employees
SET Salary = 504000.00
WHERE EmployeeID = 5;

INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, BranchID, ContactNumber, Email)
VALUES (1, 'John', 'Doe', 'Manager', 101, '555-1234', 'john.doe@example.com');

INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, BranchID, ContactNumber, Email)
VALUES (2, 'Jane', 'Smith', 'Sales Representative', 102, '555-5678', 'jane.smith@example.com');

INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, BranchID, ContactNumber, Email)
VALUES (3, 'Bob', 'Johnson', 'Accountant', 103, '555-9876', 'bob.johnson@example.com');

INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, BranchID, ContactNumber, Email)
VALUES (4, 'Alice', 'Williams', 'Customer Service', 101, '555-4321', 'alice.williams@example.com');

INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, BranchID, ContactNumber, Email)
VALUES (5, 'Charlie', 'Brown', 'Technician', 104, '555-8765', 'charlie.brown@example.com');

SELECT CONCAT(LastName, ', ', FirstName) AS employee_name, Salary AS employee_salary
FROM Employees;




CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionType VARCHAR(50) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    TransactionDate DATE NOT NULL,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

ALTER TABLE Accounts
ADD CONSTRAINT CHK_NonNegativeBalance CHECK (Balance >= 0);











