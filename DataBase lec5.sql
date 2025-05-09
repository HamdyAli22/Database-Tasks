--Task 1
--PLS create Player table with
--id name age
-- make id not null
-- make id unique
-- make name unique
CREATE TABLE PLAYER (
    ID   NUMBER       CONSTRAINT ID_NOT_NULL NOT NULL CONSTRAINT ID_UNQ UNIQUE,
    NAME VARCHAR2(100) CONSTRAINT NAME_UNQ UNIQUE,
    AGE  NUMBER
);
/
----------------------------------------------------
--pls create Manger with
--id name salary
--id must be not null
--id and name must be unique together
CREATE TABLE MANAGER (
    ID     NUMBER CONSTRAINT MANAGER_ID_NOT_NULL NOT NULL,
    NAME   VARCHAR2(100),
    SALARY NUMBER,
    CONSTRAINT UQ_MANAGER_ID_NAME UNIQUE (ID, NAME)
);
/
-------------------------------------------------
--pls create Manger with
--id name age
--make id not null and unique (Primary Key)
CREATE TABLE MANAGER (
    ID   NUMBER CONSTRAINT PK_MANAGER_ID PRIMARY KEY,
    NAME VARCHAR2(100),
    AGE  NUMBER
);
--------------------------------------------------------------------------------------------------
--Task 2
/*create Doctor with 
id name salary

create Patient with
id name age

doctor has many patient
patient has many doctor

- please create classes with relation*/
CREATE TABLE DOCTOR (
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100) NOT NULL,
    SALARY NUMBER
);
/
CREATE TABLE PATIENT (
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100) NOT NULL,
    AGE NUMBER
);
/
CREATE TABLE DOCTOR_PATIENT (
    DOCTOR_ID NUMBER,
    PATIENT_ID NUMBER,
    PRIMARY KEY (DOCTOR_ID, PATIENT_ID),
    FOREIGN KEY (DOCTOR_ID) REFERENCES DOCTOR(ID) ON DELETE CASCADE,
    FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT(ID) ON DELETE CASCADE
);
--------------------------------------------------------------------------------------------------
--Task 3
/*create Teacher with 
id name salary

create Language with
id name 

Teacher has only Language
Language has many Teacher

- please create classes with relation*/
CREATE TABLE LANGUAGE (
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100) NOT NULL
);
/
CREATE TABLE TEACHER (
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100) NOT NULL,
    SALARY NUMBER,
    LANGUAGE_ID NUMBER NOT NULL,
    FOREIGN KEY (LANGUAGE_ID) REFERENCES LANGUAGE(ID)
);
--------------------------------------------------------------------------------------------------
--Task 4
/*create Employee with 
id name age

create Phone with
id phoneNumber 

Employee has only Phone
Phone has only Employee
*/
CREATE TABLE EMPLOYEE (
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100) NOT NULL,
    AGE NUMBER
);
/
CREATE TABLE PHONE (
    ID NUMBER PRIMARY KEY,
    PHONENUMBER VARCHAR2(20) NOT NULL,
    EMPLOYEE_ID NUMBER UNIQUE,
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(ID)
);
