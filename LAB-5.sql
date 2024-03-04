use lab4;

-- Lab-5
-- Q1:
SELECT 
    CONCAT(
        UPPER(LEFT(Lname, 1)), LOWER(SUBSTRING(Lname, 2, LENGTH(Lname))), ', ',
        UPPER(LEFT(Fname, 1)), LOWER(SUBSTRING(Fname, 2, LENGTH(Fname)))
    ) AS EmployeeName,
    FORMAT(Salary, 2) AS FormattedSalary
FROM EMPLOYEE;

-- Q2:
SELECT 
    EmployeeID,
    Fname,
    Lname,
    COALESCE(Commission, 0) AS CommissionValue
FROM EMPLOYEE;

-- Q3:
SELECT COUNT(*) AS TotalRooms
FROM LOCATION;

-- Q4:
SELECT COUNT(DISTINCT BuildingName) AS DistinctBuildingCount
FROM LOCATION;

ALTER TABLE STUDENT
ADD BirthDate DATE;

UPDATE STUDENT
SET BirthDate = DATE_ADD('1970-01-01', INTERVAL FLOOR(RAND() * 365*25) DAY)
WHERE StudentID IN (1, 2, 3, 4, 5);

-- Q5:
SELECT 
    CONCAT(FirstName, ' ', LastName) AS StudentName,
    DATE_FORMAT(BirthDate, '%d %M, %Y') AS FormattedBirthDate
FROM STUDENT;

-- Q6:
SELECT 
    AVG(YEAR(CURDATE()) - YEAR(BirthDate)) AS AverageAge,
    MAX(YEAR(CURDATE()) - YEAR(BirthDate)) AS HighestAge,
    MIN(YEAR(CURDATE()) - YEAR(BirthDate)) AS LowestAge
FROM STUDENT;

-- Q7:








