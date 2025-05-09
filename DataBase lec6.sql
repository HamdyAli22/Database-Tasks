--1. CHECK Constraint (Code Samples)
--Create a table Employees with a CHECK constraint that ensures age is greater than or equal to 18.
CREATE TABLE EMPLOYEES3 (
    EMPLOYEE_ID NUMBER PRIMARY KEY,
    FIRST_NAME VARCHAR2(50),
    LAST_NAME VARCHAR2(50),
    AGE NUMBER,
    CONSTRAINT AGE_CHK CHECK (AGE >= 18)
);
/
--Write a SQL query to enforce that salary in a Staff table must be between 3000 and 10000.
ALTER TABLE STAFF
ADD CONSTRAINT CHK_SALARY_RANGE
CHECK (SALARY BETWEEN 3000 AND 10000);
/
--Add a CHECK constraint to an existing table Products that ensures price is greater than 0.
ALTER TABLE PRODUCTS
ADD CONSTRAINT CHK_PRICE
CHECK (PRICE > 0);
/
--Create a table Students where the grade column only allows values from A to F using a CHECK constraint.
CREATE TABLE STUDENTS (
    STUDENT_ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    GRADE CHAR(1) CHECK (GRADE IN ('A', 'B', 'C', 'D', 'E', 'F'))
);
-----------------------------------------------------------------------------------------------------------------------------------------
--2. Adding Constraints via ALTER TABLE (Code Samples)
--Add a NOT NULL constraint to the email column in the Customers table.
ALTER TABLE CUSTOMERS
MODIFY EMAIL VARCHAR2(255) NOT NULL;
/
--Add a UNIQUE constraint to the username column in the Users table.
ALTER TABLE USERS
ADD CONSTRAINT USERNAME_UNQ UNIQUE (USERNAME);
/
--Add a FOREIGN KEY constraint on Orders.customer_id referencing Customers(id).
ALTER TABLE ORDERS
ADD CONSTRAINT FK_CUSTOMER_ID
FOREIGN KEY (CUSTOMER_ID)
REFERENCES CUSTOMERS(ID);
/
--Use ALTER TABLE to add a CHECK constraint to the Accounts table to ensure balance >= 0.
ALTER TABLE ACCOUNTS
ADD CONSTRAINT CHK_BALANCE
CHECK (BALANCE >= 0);
/
--Add a PRIMARY KEY constraint to the Departments table on the dept_id column.
ALTER TABLE DEPARTMENTS
ADD CONSTRAINT PK_DEPT_ID PRIMARY KEY (DEPT_ID);
-----------------------------------------------------------------------------------------------------------------------------------------
--3. Dropping (Removing) Constraints (Code Samples)
--Drop a CHECK constraint named chk_salary from the Employees table.
ALTER TABLE EMPLOYEES
DROP CONSTRAINT CHK_SALARY;
/
--Remove the UNIQUE constraint on email from the Users table.
ALTER TABLE USERS
DROP CONSTRAINT UQ_EMAIL;
/
--Drop the PRIMARY KEY from the Products table.
ALTER TABLE Products
DROP PRIMARY KEY;
/
--Drop a FOREIGN KEY constraint named fk_order_customer from the Orders table.
ALTER TABLE ORDERS
DROP CONSTRAINT FK_ORDER_CUSTOMER;
/
--Write SQL to remove a NOT NULL constraint from the phone column in the Contacts table.
ALTER TABLE CONTACTS
MODIFY PHONE NULL;
-----------------------------------------------------------------------------------------------------------------------------------------
--4. Renaming Constraints (Code Samples)
--Rename a CHECK constraint named chk_age to check_min_age on the Students table.
ALTER TABLE STUDENTS
RENAME CONSTRAINT CHK_AGE TO CHECK_MIN_AGE;
/
--Rename a FOREIGN KEY constraint fk_emp_dept to fk_employee_department on the Employees table.
ALTER TABLE EMPLOYEES
RENAME CONSTRAINT FK_EMP_DEPT TO FK_EMPLOYEE_DEPARTMENT;
/
--Rename the PRIMARY KEY constraint on the Users table to pk_users_id.
ALTER TABLE USERS
RENAME CONSTRAINT SYS_C007686 TO PK_USERS_ID;
/
--Write SQL to rename the UNIQUE constraint on the username column to uk_user_name.
ALTER TABLE USERS
RENAME CONSTRAINT USERNAME_UNQ TO UK_USER_NAME;
/
--Provide the syntax to rename a constraint in SQL Server vs PostgreSQL.
--SQL SERVER
EXEC sp_rename 'schema.old_constraint_name', 'new_constraint_name', 'OBJECT';
--PostgreSQL
ALTER TABLE TABLE_NAME RENAME CONSTRAINT OLD_CONSTRAINT_NAME TO NEW_CONSTRAINT_NAME;
-----------------------------------------------------------------------------------------------------------------------------------------
--5. Disabling Constraints (Code Samples)
--Disable a FOREIGN KEY constraint named fk_customer_order on the Orders table.
ALTER TABLE ORDERS
DISABLE CONSTRAINT FK_CUSTOMER_ORDER;
/
--Temporarily disable all constraints on the Products table.
/*
In Oracle SQL, there isn't a single command to disable all constraints on a table. 
However, you can achieve this by dynamically generating and executing 
ALTER TABLE statements to disable each constraint individually.
*/
BEGIN
  FOR C IN (
    SELECT CONSTRAINT_NAME--,CONSTRAINT_TYPE
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME = 'PRODUCTS'
      AND STATUS = 'ENABLED'
  ) LOOP
    EXECUTE IMMEDIATE 'ALTER TABLE PRODUCTS DISABLE CONSTRAINT ' || C.CONSTRAINT_NAME;
  END LOOP;
END;
/
--Write SQL to disable the CHECK constraint on the Accounts.balance column.
ALTER TABLE ACCOUNTS
DISABLE CONSTRAINT CHK_BALANCE;
/
--Disable the PRIMARY KEY constraint on Departments(dept_id).
ALTER TABLE DEPARTMENTS2 
DISABLE CONSTRAINT PK_DEPT_ID;
/
--How would you disable all constraints on a table before bulk inserting data?
/*
In Oracle SQL, there isn't a single command to disable all constraints on a table. 
However, you can achieve this by dynamically generating and executing 
ALTER TABLE statements to disable each constraint individually.
*/
-----------------------------------------------------------------------------------------------------------------------------------------
--6. Enabling Constraints (Code Samples)
--Enable the FOREIGN KEY constraint fk_customer_order on the Orders table.
ALTER TABLE ORDERS 
ENABLE CONSTRAINT FK_CUSTOMER_ORDER;
/
--Re-enable all constraints on the Products table after a data load.
BEGIN
  FOR C IN (
    SELECT CONSTRAINT_NAME--,CONSTRAINT_TYPE
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME = 'PRODUCTS'
      AND STATUS = 'DISABLED'
  ) LOOP
    EXECUTE IMMEDIATE 'ALTER TABLE PRODUCTS ENABLE CONSTRAINT ' || C.CONSTRAINT_NAME;
  END LOOP;
END;
/
--Write SQL to enable a CHECK constraint on salary in the Staff table.
ALTER TABLE STAFF 
ENABLE CONSTRAINT CHK_SALARY_RANGE;
/
--Enable the PRIMARY KEY constraint on Departments(dept_id) after it was disabled.
ALTER TABLE DEPARTMENTS2 
ENABLE CONSTRAINT PK_DEPT_ID;
/
--How do you enable a constraint only if it's currently disabled?
ALTER TABLE TABLE_NAME 
ENABLE CONSTRAINT CONSTRAINT_NAME;