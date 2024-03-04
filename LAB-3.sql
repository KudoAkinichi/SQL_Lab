create database lab3_ClgStudent;
use lab3_ClgStudent;

CREATE TABLE STUDENT (
    StudentId INT PRIMARY KEY,
    Last VARCHAR(50) NOT NULL,
    First VARCHAR(50) NOT NULL,
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(2),
    Zip VARCHAR(10),
    StartTerm VARCHAR(10) DEFAULT 'Fall',
    BirthDate DATE,
    FacultyId INT,
    MajorId INT,
    Phone VARCHAR(15) UNIQUE
);

CREATE TABLE FACULTY (
	FacultyId INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    RoomId INT,
    Phone VARCHAR(15) UNIQUE,
    DeptId INT
);

CREATE TABLE COURSE (
    CourseId INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Credits INT,
    PreReq INT
);

CREATE TABLE TERM (
	TermId INT PRIMARY KEY,
    TermDesc VARCHAR(50),
    StartDate DATE,
    EndDate DATE
);

CREATE TABLE LOCATION (
    RoomId INT PRIMARY KEY,
    Building VARCHAR(50),
    RoomNo VARCHAR(20),
    Capacity INT,
    RoomType VARCHAR(50)
);

CREATE TABLE CRSSECTION(
	CsId INT,
    CourseId INT, 
    Section INT, 
    TermId INT,
    FacultyId INT,
	Day VARCHAR(3) CHECK (Day IN('Mon', 'Tue', 'Wed', 'Thu', 'Fri')),
    StartTime TIME,
    EndTime TIME,
    RoomId INT,
    MaxCount INT,
    PRIMARY KEY (CsId, TermId)
);
    -- FOREIGN KEY (CourseId) REFERENCES COURSE(CourseId),
--     FOREIGN KEY (FacultyId) REFERENCES FACULTY(FacultyId),
--     FOREIGN KEY (TermId) REFERENCES TERM(TermId),
--     FOREIGN KEY (RoomId) REFERENCES LOCATION(RoomId)

CREATE TABLE REGISTRATION(
	StudentId INT,
    CsId INT,
    Midterm INT,
    Final INT,
    RegStatus VARCHAR(20) DEFAULT 'Pending',
    PRIMARY KEY (StudentId, CsId)
);
-- foreign key (StudentId) references STUDENT(StudentId),
--     foreign key (CsId) references CRSSECTION(CsId)

CREATE TABLE ROOM (
    RoomId INT PRIMARY KEY,
    RoomType VARCHAR(50),
    RoomDesc VARCHAR(100),
    UNIQUE(RoomId, RoomType)
);

CREATE TABLE DEPARTMENT (
    DeptId INT PRIMARY KEY,
    DeptName VARCHAR(50) UNIQUE,
    FacultyId INT,
    FOREIGN KEY (FacultyId) REFERENCES FACULTY(FacultyId)
);

CREATE TABLE MAJOR (
    MajorId INT PRIMARY KEY,
    MajorDesc VARCHAR(100) UNIQUE
);

INSERT INTO STUDENT VALUES (1, 'Doe', 'John', '123 Main St', 'Cityville', 'CA', '12345', 'Fall', '1995-01-15', 101, 201, '555-1234');
INSERT INTO STUDENT VALUES (2, 'Smith', 'Alice', '456 Oak St', 'Townsville', 'NY', '67890', 'Spring', '1998-05-20', 102, 202, '555-5678');
INSERT INTO STUDENT VALUES (3, 'Johnson', 'Bob', '789 Pine St', 'Villagetown', 'TX', '54321', 'Fall', '1997-09-10', 103, 203, '555-9876');
INSERT INTO STUDENT VALUES (4, 'Williams', 'Emily', '987 Elm St', 'Hamletville', 'IL', '45678', 'Spring', '1996-03-25', 104, 204, '555-4321');
INSERT INTO STUDENT VALUES (5, 'Brown', 'Michael', '654 Birch St', 'Suburbia', 'FL', '87654', 'Fall', '1999-11-05', 105, 205, '555-8765');

insert into FACULTY VALUES (103, 'Max', 101, 9969594728, 1150);
insert into FACULTY VALUES (104, 'verstappen', 203, 92329594728, 1150);
insert into FACULTY VALUES (105, 'Jay', 201, 9969591228, 1100);
insert into FACULTY VALUES (101, 'Mahesh', 402, 1589594728, 1000);
insert into FACULTY VALUES (102, 'Priyanshu', 501, 9969204728, 1100);


