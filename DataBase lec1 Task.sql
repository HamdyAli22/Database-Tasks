/* Formatted on 4/13/2025 12:49:48 PM (QP5 v5.388) */
--create table Manger contain id, name , age , birth_date , address
CREATE TABLE MANAGER
(
    ID            NUMBER PRIMARY KEY,
    NAME          VARCHAR2 (100),
    AGE           NUMBER(3),
    BIRTH_DATE    DATE,
    ADDRESS       VARCHAR2 (255)
);
/
SELECT * FROM MANAGER;
/
--alter table manger drop address column
ALTER TABLE MANAGER 
DROP COLUMN ADDRESS;
/
--alter table manger add column (city_address, street) 
ALTER TABLE MANAGER 
ADD(CITY_ADDRESS VARCHAR2(100),STREET VARCHAR2(255));
/
--modify column name to full_name
ALTER TABLE MANAGER 
RENAME COLUMN NAME TO FULL_NAME;
/
--make this table just for read
ALTER TABLE MANAGER READ ONLY;
/
--create table same as  Manger with name Owner just has colum id, name, birth_date
CREATE TABLE OWNER 
AS SELECT ID,NAME,BIRTH_DATE FROM MANAGER;
/
--rename manger table name to Master
ALTER TABLE MANAGER RENAME TO MASTER;
/
SELECT * FROM MASTER;
/
--drop all tables
DROP TABLE MASTER;
DROP TABLE OWNER;
