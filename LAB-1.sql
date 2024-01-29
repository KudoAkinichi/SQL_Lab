-- LAB 1
create database lab1;
use lab1;

CREATE TABLE STUDENT(student_ID int,name VARCHAR(20),age int,gender VARCHAR(1));
CREATE TABLE EMPLOYEE(employee_ID int,name VARCHAR(20),designation VARCHAR(20),salary int);
CREATE TABLE PRODUCT(product_ID int,model VARCHAR(20),company VARCHAR(20),price int);
CREATE TABLE CUSTOMER(customer_ID int,name VARCHAR(20),age int,gender VARCHAR(1));
CREATE TABLE ACCOUNT(account_ID int,acc_holder_name VARCHAR(20),balance int,branch VARCHAR(20));

describe student;
describe employee;
describe product;
describe customer;
describe account;

INSERT INTO STUDENT(STUDENT_ID,NAME,AGE,GENDER)
    WITH names AS(
    SELECT 001,'ADITYA',19,'M' FROM dual UNION ALL
    SELECT 002,'SAMBHAV',19,'M' FROM dual UNION ALL
    SELECT 003,'RAM',18,'M' FROM dual UNION ALL
    SELECT 004,'SITA',18,'F' FROM dual UNION ALL
    SELECT 005,'LAKSHMAN',17,'M' FROM dual)
    SELECT * FROM names ;
    
    INSERT INTO EMPLOYEE(EMPLOYEE_ID,NAME,DESIGNATION,SALARY)
    WITH names AS(
    SELECT 001,'ADITYA','SOFTWARE ENGINEER',1000000 FROM dual UNION ALL
    SELECT 002,'SAMBHAV','SOFTWARE DEVELOPER',1100000 FROM dual UNION ALL
    SELECT 003,'RAM','WEB DEVELOPER',900000 FROM dual UNION ALL
    SELECT 004,'SITA','WEB DEVELOPER',1000000 FROM dual UNION ALL
    SELECT 005,'LAKSHMAN','SYSTEM ENGINEER',1200000 FROM dual)
    SELECT * FROM names;
    
   INSERT INTO PRODUCT(PRODUCT_ID,MODEL,COMPANY,PRICE)
    WITH names AS(
    SELECT 001,'PEANUT OIL','SAFFOLA',200 FROM dual UNION ALL
    SELECT 002,'OREO BISCUIT','MONDELEZ',20 FROM dual UNION ALL
    SELECT 003,'LAYS CHIPS','FRITO-LAY',10 FROM dual UNION ALL
    SELECT 004,'PEPSI','PEPSICO',35 FROM dual UNION ALL
    SELECT 005,'MAGGI','NESTLE',15 FROM dual)
    SELECT * FROM names;
    
    INSERT INTO CUSTOMER(CUSTOMER_ID,NAME,AGE,GENDER)
    WITH names AS(
    SELECT 001,'ADITYA',19,'M' FROM dual UNION ALL
    SELECT 002,'SAMBHAV',19,'M' FROM dual UNION ALL
    SELECT 003,'RAM',18,'M' FROM dual UNION ALL
    SELECT 004,'SITA',18,'F' FROM dual UNION ALL
    SELECT 005,'LAKSHMAN',17,'M' FROM dual)
    SELECT * FROM names;
    
    
INSERT INTO ACCOUNT(ACCOUNT_ID,ACC_HOLDER_NAME,BALANCE,BRANCH)
    WITH names AS(
    SELECT 001,'ADITYA',1029842,'BHUBANESWAR' FROM dual UNION ALL
    SELECT 002,'SAMBHAV',1813142,'DELHI' FROM dual UNION ALL
    SELECT 003,'RAM',983142,'MUMBAI' FROM dual UNION ALL
    SELECT 004,'SITA',1223142,'MUMBAI' FROM dual UNION ALL
    SELECT 005,'LAKSHMAN',823142,'LANKA' FROM dual)
    SELECT * FROM names;
    
    select * from student;
    select * from employee;
    select * from product;
    select * from customer;
    select * from account;
    
--     drop table student;
--     drop table employee;
--     drop table product;
--     drop table customer;
--     drop table account;
    
    
    

 












