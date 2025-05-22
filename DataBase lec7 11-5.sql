--task1
---------------
--Write a query to display the names of employees and their department names using a natural join.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_NAME
FROM EMPLOYEES
NATURAL JOIN DEPARTMENTS;
/
--Write a query to list all orders with their corresponding customer names using a natural join.
SELECT ORDER_ID, ORDER_DATE, CUSTOMER_ID, CUSTOMER_NAME
FROM ORDERS
NATURAL JOIN CUSTOMERS;
/
--Write a query to show student names and the courses they are enrolled in using a natural join.
SELECT STUDENT_NAME, COURSE_NAME
FROM STUDENTS
NATURAL JOIN COURSES;
/
--Write a query to display project names and the employees working on them using a natural join.
SELECT EMPLOYEE_NAME, PROJECT_NAME
FROM EMPLOYEES
NATURAL JOIN PROJECTS;
/
--Write a query to retrieve invoice details along with product names using a natural join.
SELECT INVOICE_ID,INVOICE_NUMBER,PRODUCT_ID, PRODUCT_NAME, QUANTITY, PRICE
FROM INVOICE_DETAILS
NATURAL JOIN PRODUCTS;
/
--Write a query to find all books with their respective author names using a natural join.
SELECT BOOK_TITLE, AUTHOR_NAME
FROM BOOKS
NATURAL JOIN AUTHORS;
/
--Write a query to list all class schedules along with their instructors’ names using a natural join.
SELECT COURSE_NAME, SCHEDULE_TIME, INSTRUCTOR_NAME
FROM COURSE_SCHEDULES
NATURAL JOIN INSTRUCTORS;
/
--Write a query to show supplier names and the products they supply using a natural join.
SELECT SUPPLIER_NAME, PRODUCT_NAME
FROM SUPPLIERS
NATURAL JOIN PRODUCTS;
/
--Write a query to display customer orders along with shipping details using a natural join.
SELECT ORDER_ID, CUSTOMER_ID, ORDER_DATE, SHIPPING_ADDRESS, SHIPPING_DATE
FROM ORDERS
NATURAL JOIN SHIPPING;

/
--Write a query to list employees along with their job titles using a natural join.
SELECT FIRST_NAME || ''  || LAST_NAME EMPLOYEE_NAME, JOB_TITLE
FROM EMPLOYEES
NATURAL JOIN JOBS;
-------------------------------------------------------------------------------------------------------------------------------
--task2
---------------
--Write a query to display employee names and department names by joining the employees and departments tables using the USING clause on department_id.
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME EMPLOYEE_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D
USING (DEPARTMENT_ID);
/
--Write a query to list all orders and their corresponding customer names using the USING clause on customer_id.
SELECT O.ORDER_ID, O.ORDER_DATE, C.CUSTOMER_NAME
FROM ORDERS O
JOIN CUSTOMERS C
USING (CUSTOMER_ID);
/
--Write a query to retrieve product names and supplier names from the products and suppliers tables using the USING clause on supplier_id.
SELECT P.PRODUCT_NAME, S.SUPPLIER_NAME
FROM PRODUCTS P
JOIN SUPPLIERS S
USING (SUPPLIER_ID);
/
--Write a query to show student names and course titles by joining students and enrollments using the USING clause on student_id.
SELECT S.STUDENT_NAME, C.COURSE_TITLE
FROM STUDENTS S
JOIN COURSES C
USING (STUDENT_ID);
/
--Write a query to display invoice numbers and product names by joining invoices and products using the USING clause on product_id.
SELECT I.INVOICE_NUMBER, P.PRODUCT_NAME
FROM INVOICE_DETAILS I
JOIN PRODUCTS P
USING (PRODUCT_ID);
/
--Write a query to list project names and employee names using the USING clause on project_id.
SELECT P.PROJECT_NAME, E.EMPLOYEE_NAME
FROM PROJECTS P
JOIN EMPLOYEES E
USING (PROJECT_ID);
/
--Write a query to retrieve author names and book titles using the USING clause on author_id.
SELECT AUTHOR_NAME, TITLE
FROM AUTHORS
JOIN BOOKS
USING (AUTHOR_ID);
/
--Write a query to show sales order details with employee names using the USING clause on employee_id.
SELECT SO.ORDER_ID, SO.ORDER_DATE, E.EMPLOYEE_NAME
FROM SALES_ORDERS SO
JOIN EMPLOYEES E
USING (EMPLOYEE_ID);
/
--Write a query to display course schedules and instructor names using the USING clause on instructor_id.
SELECT CS.COURSE_NAME, CS.SCHEDULE_TIME, I.INSTRUCTOR_NAME
FROM COURSE_SCHEDULES CS
JOIN INSTRUCTORS I
USING (INSTRUCTOR_ID);
/
--Write a query to list transactions along with account holder names using the USING clause on account_id.
SELECT T.TRANSACTION_ID, T.TRANSACTION_DATE, A.ACCOUNT_NAME
FROM TRANSACTIONS T
JOIN ACCOUNTS A
USING (ACCOUNT_ID);
-------------------------------------------------------------------------------------------------------------------------------
--task3
--Write a query to retrieve employee names and their manager names from the employees table, handling ambiguous column names for employee_id and manager_id.
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME  AS EMPLOYEE, M.FIRST_NAME || ' ' || M.LAST_NAME AS MANAGER
FROM EMPLOYEES E
LEFT JOIN EMPLOYEES M
ON E.MANAGER_ID = M.EMPLOYEE_ID;
/
--Write a query to list customer names and salesperson names from the customers and employees tables, where both tables have a column named name.
SELECT C.NAME AS CUSTOMER_NAME, E.NAME AS SALES_PERSON_NAME
FROM CUSTOMERS C
JOIN EMPLOYEES E
ON C.EMPLOYEE_ID = E.EMPLOYEE_ID;
/
--Write a query to display order IDs and product IDs from orders and order_details, both of which have an order_id column.
SELECT O.ORDER_ID, OD.PRODUCT_ID
FROM ORDERS O
JOIN ORDER_DETAILS OD
ON O.ORDER_ID = OD.ORDER_ID;
/
--Write a query to retrieve student names and instructor names from students and instructors tables using an alias to handle the name column.
SELECT S.NAME AS STUDENT_NAME, I.NAME AS INSTRUCTOR_NAME
FROM STUDENTS S
JOIN INSTRUCTORS I
ON S.INSTRUCTOR_ID = I.INSTRUCTOR_ID;
/
--Write a query to show employee salaries and department budgets, both of which have a budget or salary column that could conflict.
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME EMPLOYEE_NAME, E.SALARY AS EMPLOYEE_SALARY, D.SALARY AS DEPARTMENT_BUDGET
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
/
--Write a query to display project names and task names where both projects and tasks tables contain a name column.
SELECT P.NAME AS PROJECT_NAME, T.NAME AS TASK_NAME
FROM PROJECTS P
JOIN TASKS T
ON P.PROJECT_ID = T.PROJECT_ID;
/
--Write a query to join courses and exams tables and retrieve their date fields, resolving ambiguity between the columns.
SELECT C.COURSE_NAME, C.DATE AS COURSE_DATE, E.EXAM_NAME, E.DATE AS EXAM_DATE
FROM COURSES C
JOIN EXAMS E
ON C.COURSE_ID = E.COURSE_ID;
/
--Write a query to show the product name and category name from the products and categories tables, where both have a name column.
SELECT P.NAME AS PRODUCT_NAME, C.NAME AS CATEGORY_NAME
FROM PRODUCTS P
JOIN CATEGORIES C
ON P.CATEGORY_ID = C.CATEGORY_ID;
/
--Write a query to display the book title and publisher name from books and publishers, avoiding column name conflicts.
SELECT B.NAME AS BOOK_TITLE, P.NAME AS PUBLISHER_NAME
FROM BOOKS B
JOIN PUBLISHERS P
ON B.PUBLISHER_ID = P.PUBLISHER_ID;
/
--Write a query to list employee names and their department's location, resolving ambiguity in the location column from both tables.
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME EMPLOYEE_NAME,C.COUNTRY_NAME DEPARTMENT_LOCATION
FROM EMPLOYEES E JOIN DEPARTMENTS D 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID  
JOIN LOCATIONS L
ON L.LOCATION_ID = D.LOCATION_ID 
JOIN COUNTRIES C
ON C.COUNTRY_ID = L.COUNTRY_ID;