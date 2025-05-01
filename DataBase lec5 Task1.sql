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