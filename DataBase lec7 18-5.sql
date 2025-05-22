/* Formatted on 5/22/2025 2:52:57 PM (QP5 v5.388) */
--Task 1
--Oracle SQL – LEFT OUTER JOIN Coding Questions
-------------------------------------------------
--Retrieve all employees and their department names.
--Write an Oracle SQL query using LEFT OUTER JOIN to show all employees, including those who are not assigned to any department.

SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME || ' ' || E.LAST_NAME     EMPLOYEE_NAME,
       D.DEPARTMENT_ID
  FROM EMPLOYEES  E
       LEFT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
/

--List all products and their associated categories.
--Some products may not belong to any category. Write a query using LEFT JOIN to include all products regardless of category association.

SELECT P.PRODUCT_ID, P.PRODUCT_NAME, C.CATEGORY_NAME
  FROM PRODUCTS  P
       LEFT OUTER JOIN CATEGORIES C ON P.CATEGORY_ID = C.CATEGORY_ID;
/

--Find all students and the courses they are enrolled in.
--Use a LEFT OUTER JOIN to include students who are not enrolled in any course.

SELECT S.STUDENT_ID, S.STUDENT_NAME, C.COURSE_NAME
  FROM STUDENTS  S
       LEFT OUTER JOIN ENROLLMENTS E ON S.STUDENT_ID = E.STUDENT_ID
       LEFT OUTER JOIN COURSES C ON E.COURSE_ID = C.COURSE_ID;
/

--Display all orders with customer names, including orders without a matched customer.
--Assume the orders table has a foreign key customer_id. Use LEFT JOIN to include all orders.

SELECT O.ORDER_ID, O.ORDER_DATE, C.CUSTOMER_NAME
  FROM ORDERS O LEFT OUTER JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID;
/

--Show all departments and their managers.
--Write a query to return all departments using a LEFT OUTER JOIN to show their assigned managers, including departments with no manager.

SELECT D.DEPARTMENT_ID, E.FIRST_NAME || ' ' || E.LAST_NAME MANAGER_NAME
  FROM DEPARTMENTS  D
       LEFT OUTER JOIN EMPLOYEES E ON D.MANAGER_ID = E.MANAGER_ID;
/

--List all books and their authors from the books and authors tables.
--Include books that don’t have an assigned author using a LEFT JOIN.

SELECT B.BOOK_ID, B.BOOK_TITLE, A.AUTHOR_NAME
  FROM BOOKS B LEFT OUTER JOIN AUTHORS A ON B.AUTHOR_ID = A.AUTHOR_ID;
/

--Write a query that retrieves all invoices along with their corresponding payment status.
--Use LEFT JOIN to include invoices with no payment.

SELECT I.INVOICE_ID,
       I.INVOICE_DATE,
       I.AMOUNT,
       P.PAYMENT_DATE,
       P.PAYMENT_AMOUNT
  FROM INVOICES I LEFT OUTER JOIN PAYMENTS P ON I.INVOICE_ID = P.INVOICE_ID;
/

--Get all employees and their projects from employees and projects_assigned tables.
--Include employees who are not assigned to any project.

SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME || ' ' || E.LAST_NAME     EMPLOYEE_NAME,
       P.PROJECT_NAME
  FROM EMPLOYEES  E
       LEFT OUTER JOIN PROJECTS_ASSIGNED PA ON E.EMPLOYEE_ID = PA.EMPLOYEE_ID
       LEFT OUTER JOIN PROJECTS P ON PA.PROJECT_ID = P.PROJECT_ID;

-------------------------------------------------------------------------------------------------------------------------------
 --Task 2
--Oracle SQL – RIGHT OUTER JOIN Coding Questions
-------------------------------------------------
--List all departments and the employees working in them.
--Use a RIGHT OUTER JOIN to ensure all departments are shown, even if they have no employees.

SELECT D.DEPARTMENT_ID, E.FIRST_NAME || ' ' || E.LAST_NAME EMPLOYEE_NAME
  FROM EMPLOYEES  E
       RIGHT OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
/

--Retrieve all orders and their corresponding customers.
--Use a RIGHT JOIN to include all customers, even if they haven't placed any orders.

SELECT C.CUSTOMER_ID,
       C.CUSTOMER_NAME,
       O.ORDER_ID,
       O.ORDER_DATE
  FROM ORDERS O RIGHT OUTER JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID;
/

--Show all courses and enrolled students.
--Use RIGHT JOIN to return all courses, including those without any enrolled students.

SELECT C.COURSE_ID, C.COURSE_NAME, S.STUDENT_NAME
  FROM ENROLLMENTS  E
       RIGHT OUTER JOIN COURSES C ON E.COURSE_ID = C.COURSE_ID
       LEFT OUTER JOIN STUDENTS S ON E.STUDENT_ID = S.STUDENT_ID;
/

--Display all projects and the employees assigned to them.
--Use a RIGHT OUTER JOIN to include all projects even if no employee is assigned.


SELECT P.PROJECT_ID, P.PROJECT_NAME, E.EMPLOYEE_NAME
  FROM PROJECTS_ASSIGNED  PA
       RIGHT OUTER JOIN PROJECTS P ON PA.PROJECT_ID = P.PROJECT_ID
       LEFT OUTER JOIN EMPLOYEES E ON PA.EMPLOYEE_ID = E.EMPLOYEE_ID;
/

--Write a query to show all payment methods and their related transactions.
--Include payment methods with no transactions using RIGHT JOIN.
/

-- RIGHT OUTER JOIN TO SHOW ALL PAYMENT METHODS AND THEIR RELATED TRANSACTIONS (INCLUDING PAYMENT METHODS WITH NO TRANSACTIONS)

SELECT PM.PAYMENT_METHOD_ID,
       PM.PAYMENT_METHOD_NAME,
       T.TRANSACTION_ID,
       T.TRANSACTION_DATE
  FROM TRANSACTIONS  T
       RIGHT OUTER JOIN PAYMENT_METHODS PM
           ON T.PAYMENT_METHOD_ID = PM.PAYMENT_METHOD_ID;


--Find all authors and their books.
--Use a RIGHT OUTER JOIN to list all authors, even those who haven't written any books.

-- RIGHT OUTER JOIN TO SHOW ALL AUTHORS AND THEIR BOOKS (INCLUDING AUTHORS WHO HAVEN'T WRITTEN ANY BOOKS)

SELECT A.AUTHOR_ID,
       A.AUTHOR_NAME,
       B.BOOK_ID,
       B.BOOK_TITLE
  FROM BOOKS B RIGHT OUTER JOIN AUTHORS A ON B.AUTHOR_ID = A.AUTHOR_ID;
/

--List all categories and the products under them.
--Use a RIGHT JOIN to ensure all categories are shown, even those with no products.
-- RIGHT OUTER JOIN TO SHOW ALL CATEGORIES AND THE PRODUCTS UNDER THEM (INCLUDING CATEGORIES WITH NO PRODUCTS)

SELECT C.CATEGORY_ID,
       C.CATEGORY_NAME,
       P.PRODUCT_ID,
       P.PRODUCT_NAME
  FROM PRODUCTS  P
       RIGHT OUTER JOIN CATEGORIES C ON P.CATEGORY_ID = C.CATEGORY_ID;
/

--Retrieve all students and their assigned dorm rooms.
--Use a RIGHT OUTER JOIN to include dorm rooms even if they are unassigned.

SELECT S.STUDENT_ID,
       S.STUDENT_NAME,
       D.DORM_ROOM_ID,
       D.ROOM_NUMBER
  FROM DORM_ROOMS  D
       RIGHT OUTER JOIN STUDENTS S ON S.DORM_ROOM_ID = D.DORM_ROOM_ID;
/
-------------------------------------------------------------------------------------------------------------------------------
 --Task 3
--Oracle SQL – FULL OUTER JOIN Coding Questions
-------------------------------------------------       
--Write a query to list all customers and all orders.
--Use a FULL OUTER JOIN to include customers with no orders and orders with no matching customer.

SELECT C.CUSTOMER_ID,
       C.CUSTOMER_NAME,
       O.ORDER_ID,
       O.ORDER_DATE
  FROM CUSTOMERS C FULL OUTER JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;
/

--Display all employees and all projects.
--Some employees may not be assigned to any project, and some projects may not have any employee. Use a FULL OUTER JOIN.
-- FULL OUTER JOIN TO DISPLAY ALL EMPLOYEES AND ALL PROJECTS (INCLUDING EMPLOYEES WITHOUT PROJECTS AND PROJECTS WITHOUT EMPLOYEES)

-- FULL OUTER JOIN TO DISPLAY ALL EMPLOYEES AND ALL PROJECTS (INCLUDING EMPLOYEES WITHOUT PROJECTS AND PROJECTS WITHOUT EMPLOYEES)

SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME || ' ' || E.LAST_NAME     AS EMPLOYEE_NAME,
       P.PROJECT_ID,
       P.PROJECT_NAME
  FROM EMPLOYEES  E
       FULL OUTER JOIN PROJECTS_ASSIGNED PA ON E.EMPLOYEE_ID = PA.EMPLOYEE_ID
       FULL OUTER JOIN PROJECTS P ON PA.PROJECT_ID = P.PROJECT_ID;
/

--Show all products and all suppliers.
--Include products without suppliers and suppliers without products using FULL OUTER JOIN.

SELECT P.PRODUCT_ID,
       P.PRODUCT_NAME,
       S.SUPPLIER_ID,
       S.SUPPLIER_NAME
  FROM PRODUCTS  P
       FULL OUTER JOIN SUPPLIERS S ON P.SUPPLIER_ID = S.SUPPLIER_ID;
/

--List all students and all courses.
--Write a FULL OUTER JOIN query to include students not enrolled in any course and courses with no students.

SELECT S.STUDENT_ID,
       S.STUDENT_NAME,
       C.COURSE_ID,
       C.COURSE_NAME
  FROM STUDENTS  S
       FULL OUTER JOIN ENROLLMENTS E ON S.STUDENT_ID = E.STUDENT_ID
       FULL OUTER JOIN COURSES C ON E.COURSE_ID = C.COURSE_ID;
/

--Retrieve all authors and all books.
--Include authors with no books and books without an assigned author using FULL OUTER JOIN.
-- FULL OUTER JOIN TO SHOW ALL AUTHORS AND ALL BOOKS (INCLUDING AUTHORS WITHOUT BOOKS AND BOOKS WITHOUT AUTHORS)

SELECT A.AUTHOR_ID,
       A.AUTHOR_NAME,
       B.BOOK_ID,
       B.BOOK_TITLE
  FROM AUTHORS A FULL OUTER JOIN BOOKS B ON A.AUTHOR_ID = B.AUTHOR_ID;
/

--Write a query to find all employees and all departments.
--Include employees not assigned to any department and departments with no employees.

SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME || ' ' || E.LAST_NAME     AS EMPLOYEE_NAME,
       D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
  FROM EMPLOYEES  E
       FULL OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
/

--Show all transactions and all payment methods.
--Include unmatched records from both sides using a FULL OUTER JOIN.

SELECT T.TRANSACTION_ID,
       T.TRANSACTION_DATE,
       PM.PAYMENT_METHOD_ID,
       PM.PAYMENT_METHOD_NAME
  FROM TRANSACTIONS  T
       FULL OUTER JOIN PAYMENT_METHODS PM
           ON T.PAYMENT_METHOD_ID = PM.PAYMENT_METHOD_ID;
/

--Combine two customer lists from two different regions.
--Use FULL OUTER JOIN to include all customers from both regions, even if they don’t exist in both lists.

SELECT CR1.CUSTOMER_ID       AS CUSTOMER_ID_REGION1,
       CR1.CUSTOMER_NAME     AS CUSTOMER_NAME_REGION1,
       CR2.CUSTOMER_ID       AS CUSTOMER_ID_REGION2,
       CR2.CUSTOMER_NAME     AS CUSTOMER_NAME_REGION2
  FROM CUSTOMERS_REGION1  CR1
       FULL OUTER JOIN CUSTOMERS_REGION2 CR2
           ON CR1.CUSTOMER_ID = CR2.CUSTOMER_ID;
/
-------------------------------------------------------------------------------------------------------------------------------
 --Task 4
--Oracle SQL – Subqueries Coding Questions
-------------------------------------------------       
--Find the names of employees who earn more than the average salary.
--Use a subquery to calculate the average salary.

SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLOYEE_NAME, E.SALARY
  FROM EMPLOYEES E
 WHERE E.SALARY > (SELECT AVG (SALARY) FROM EMPLOYEES);
/

--List the customers who placed the highest number of orders.
--Use a subquery to count orders per customer and compare with the max count.
-- Query to list customers who placed the highest number of orders

SELECT C.CUSTOMER_ID, C.CUSTOMER_NAME
  FROM CUSTOMERS C
 WHERE C.CUSTOMER_ID IN
           (  SELECT O.CUSTOMER_ID
               FROM ORDERS O
           GROUP BY O.CUSTOMER_ID
             HAVING COUNT (O.ORDER_ID) =
                    (SELECT MAX (ORDER_COUNT)
                       FROM (  SELECT COUNT (O.ORDER_ID)     AS ORDER_COUNT
                                 FROM ORDERS O
                             GROUP BY O.CUSTOMER_ID)));
/
--Retrieve all products whose price is higher than any product in the ‘Accessories’ category.
--Use a subquery inside a WHERE clause with ANY.
SELECT P.PRODUCT_ID,
       P.PRODUCT_NAME,
       P.PRICE
  FROM PRODUCTS P
WHERE P.PRICE > ANY (
    SELECT PRICE
      FROM PRODUCTS
      WHERE CATEGORY_ID = (SELECT CATEGORY_ID FROM CATEGORIES WHERE CATEGORY_NAME = 'Accessories')
);
/
--Display employees who work in the same department as 'John Smith'.
--Use a subquery to get John Smith’s department ID.
SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLOYEE_NAME,
       E.DEPARTMENT_ID
  FROM EMPLOYEES E
WHERE E.DEPARTMENT_ID = (SELECT E2.DEPARTMENT_ID 
                         FROM EMPLOYEES E2
                         WHERE UPPER(E2.FIRST_NAME) = 'JOHN' AND UPPER(E2.LAST_NAME) = 'SMITH')
/
--Get all orders that were placed by customers from 'New York'.
--Use a subquery to filter customers based on city.
SELECT O.ORDER_ID, O.ORDER_DATE, O.CUSTOMER_ID
  FROM ORDERS O
WHERE O.CUSTOMER_ID IN (
    SELECT C.CUSTOMER_ID
      FROM CUSTOMERS C
     WHERE C.CITY = 'New York'
);
/

--Find the departments that have no employees.
--Use a NOT EXISTS subquery to check for departments without employees.
-- Find departments that have no employees
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM DEPARTMENTS D
WHERE NOT EXISTS (
    SELECT 1
      FROM EMPLOYEES E
     WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
);

/

--List the students who are not enrolled in any course.
--Use a subquery with NOT IN or NOT EXISTS.
SELECT S.STUDENT_ID, S.STUDENT_NAME
  FROM STUDENTS S
WHERE NOT EXISTS (
    SELECT 1
      FROM ENROLLMENTS E
     WHERE E.STUDENT_ID = S.STUDENT_ID
);
/
--Retrieve the second highest salary from the employees table.
--Use a subquery with MAX and WHERE.
SELECT SALARY
FROM EMPLOYEES 
WHERE SALARY <(SELECT MAX(SALARY) FROM EMPLOYEES)
ORDER BY SALARY DESC;
/

--Display products that have a price greater than the average price of all products.
--Use a scalar subquery to get the average price.
/
SELECT PRODUCT_ID, PRODUCT_NAME, PRICE
  FROM PRODUCTS
 WHERE PRICE > (SELECT AVG(PRICE) FROM PRODUCTS);
--Find customers who have ordered all products in category 'A'.
--Use a correlated subquery with NOT EXISTS.
SELECT C.CUSTOMER_ID,C.CUSTOMER_NAME,PROD.PRODUCT_NAME,PROD.CATEGORY 
FROM CUSTOMERS C,PRODUCTS PROD
WHERE C.CUSTOMER_ID = PROD.CUSTOMER_ID 
AND  NOT EXISTS (SELECT 1
               FROM PRODUCTS P 
               WHERE P.CUSTOMER_ID = C.CUSTOMER_ID
               AND P.PRODUCT_ID = PROD.PRODUCT_ID
               AND P.CATEGORY != 'A');
-------------------------------------------------------------------------------------------------------------------------------
 --Task 5
--Oracle SQL – Single Row Subqueries Coding Questions
-------------------------------------------------    
--Find the employee(s) with the highest salary.
--Use a single-row subquery to get the maximum salary.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);
 /
--List the names of employees who work in the same department as employee 'Alice'.
--Use a subquery to get the department ID of 'Alice'.
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME
  FROM EMPLOYEES E
 WHERE E.DEPARTMENT_ID = (
       SELECT D.DEPARTMENT_ID
         FROM EMPLOYEES D
        WHERE D.FIRST_NAME = 'Alice'
          AND ROWNUM = 1
     );
/
--Display the details of the product with the lowest price.
--Use a single-row subquery to get the minimum price.
SELECT PRODUCT_ID, PRODUCT_NAME, PRICE
  FROM PRODUCTS
 WHERE PRICE = (SELECT MIN(PRICE) FROM PRODUCTS);
/
--Retrieve the department name of the employee with the highest salary.
--Use nested subqueries: one to find the employee, and one to find the department.
SELECT D.DEPARTMENT_NAME
  FROM DEPARTMENTS D
 WHERE D.DEPARTMENT_ID = (
       SELECT E.DEPARTMENT_ID
         FROM EMPLOYEES E
        WHERE E.SALARY = (
              SELECT MAX(SALARY) FROM EMPLOYEES
            )
     );
 /
 --Another solution
SELECT D.DEPARTMENT_NAME
FROM EMPLOYEES E ,DEPARTMENTS D 
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
AND E.SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES)
/
--Find the manager of the employee who was hired most recently.
--Use a subquery to get the employee with the latest hire date.
-- Find the manager of the employee who was hired most recently
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS MANAGER_NAME
  FROM EMPLOYEES E
 WHERE E.EMPLOYEE_ID = (
       SELECT M.MANAGER_ID
         FROM EMPLOYEES M
        WHERE M.HIRE_DATE = (
              SELECT MAX(HIRE_DATE) FROM EMPLOYEES
            )
     );
--Show the employee whose salary is equal to the average salary of the company.
--Use a single-row subquery with AVG().
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY = (SELECT ROUND(AVG(SALARY), 2) FROM EMPLOYEES);
 /
--List the order(s) with the earliest order date.
--Use a subquery to get the minimum order date.
SELECT ORDER_ID, ORDER_DATE, CUSTOMER_ID
  FROM ORDERS
 WHERE ORDER_DATE = (SELECT MIN(ORDER_DATE) FROM ORDERS);
 /
--Get the name and salary of the employee who earns more than the employee with ID = 101.
--Use a single-row subquery to get the salary of employee 101.
SELECT FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = 101);
/
--Find the student who has the same GPA as student 'John Doe'.
--Use a subquery to get 'John Doe’s GPA'.
-- Find the student who has the same GPA as student 'John Doe'
SELECT STUDENT_NAME, GRADE
  FROM STUDENTS
 WHERE GRADE = (SELECT GRADE FROM STUDENTS WHERE STUDENT_NAME = 'John Doe');
/
--Display all books that have the same price as the most expensive book in the ‘Science’ category.
--Use a subquery to find the max price from the 'Science' category.
SELECT BOOK_TITLE, PRICE
  FROM BOOKS
 WHERE PRICE = (SELECT MAX(PRICE) 
                 FROM BOOKS 
                WHERE CATEGORY = 'Science');
 /
-------------------------------------------------------------------------------------------------------------------------------
 --Task 6 
--Oracle SQL – Multiple Row Subqueries Coding Questions
-------------------------------------------------   
--Find all employees who earn more than at least one employee in department 10.
--Use a subquery with ANY or SOME.
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY > ANY (SELECT SALARY
                      FROM EMPLOYEES
                     WHERE DEPARTMENT_ID = 10);
/
--List the employees who earn less than all employees in department 20.
--Use a subquery with ALL.
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < ALL (SELECT SALARY
                       FROM EMPLOYEES
                      WHERE DEPARTMENT_ID = 20);
/
--Display products that have a price equal to any product in the 'Electronics' category.
--Use a subquery inside an IN clause.
SELECT PRODUCT_ID, PRODUCT_NAME, PRICE
  FROM PRODUCTS
 WHERE PRICE IN (SELECT PRICE
                   FROM PRODUCTS
                  WHERE CATEGORY = 'Electronics');
/
--Retrieve names of customers who have placed an order for a product with price greater than $1000.
--Use a subquery with IN or EXISTS.
SELECT C.CUSTOMER_NAME
  FROM CUSTOMERS C
WHERE EXISTS (SELECT 1
                FROM PRODUCTS P
               WHERE P.CUSTOMER_ID = C.CUSTOMER_ID
                 AND P.PRICE > 1000);
/
--List the employees who work in the same job titles as at least one other employee.
--Use a subquery with IN on job titles.
SELECT FIRST_NAME || ' ' || LAST_NAME EMPLOYEE_NAME,JOB_TITLE 
FROM EMPLOYEES EMP,JOBS JOB
WHERE EMP.JOB_ID = JOB.JOB_ID 
AND EMP.JOB_ID IN ( SELECT JOB_ID
                    FROM EMPLOYEES 
                    GROUP BY JOB_ID
                    HAVING COUNT(*) > 1
                );

/
--Find the departments that have more than one employee.
--Use a subquery with GROUP BY and HAVING, or join with a subquery returning multiple department IDs.
SELECT DEPARTMENT_ID ,DEPARTMENT_NAME
FROM DEPARTMENTS 
WHERE DEPARTMENT_ID IN (
                       SELECT DEPARTMENT_ID 
                       FROM EMPLOYEES
                       GROUP BY DEPARTMENT_ID
                       HAVING COUNT(EMPLOYEE_ID) >1
                       )
/
--Show all orders placed by customers who are from cities where other customers have placed orders too.
--Use a correlated subquery or a multiple-row subquery with IN.
SELECT O.ORDER_ID, O.ORDER_DATE, O.CUSTOMER_ID
  FROM ORDERS O,CUSTOMERS C
 WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
        AND C.CITY IN (
              SELECT C1.CITY
                FROM CUSTOMERS C1
                     JOIN ORDERS O1 ON C1.CUSTOMER_ID = O1.CUSTOMER_ID
               GROUP BY C1.CITY
              HAVING COUNT(DISTINCT O1.ORDER_ID) > 1
            )
 ORDER BY ORDER_DATE;
 /
--List all books that were written by authors who have published more than one book.
--Use a subquery with GROUP BY and HAVING.
SELECT B.BOOK_ID, B.BOOK_TITLE, A.AUTHOR_NAME
  FROM BOOKS B
       JOIN AUTHORS A ON B.AUTHOR_ID = A.AUTHOR_ID
 WHERE A.AUTHOR_ID IN (
       SELECT AUTHOR_ID
         FROM BOOKS
      GROUP BY AUTHOR_ID
       HAVING COUNT(BOOK_ID) > 1
    );

/
--Display the names of students who are enrolled in any of the courses taught by professor 'Dr. Smith'.
--Use a subquery to get course IDs.
SELECT S.STUDENT_NAME
  FROM STUDENTS S
 WHERE S.COURSE_ID IN (
       SELECT C.COURSE_ID
         FROM COURSES C
        WHERE C.PROFESSOR_NAME = 'Dr. Smith'
    );
/
--Retrieve all employees whose salary matches any of the salaries in department 30.
--Use a subquery with IN.
SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLOYEE_NAME,
       E.SALARY
  FROM EMPLOYEES E
 WHERE E.SALARY IN (
       SELECT E2.SALARY
         FROM EMPLOYEES E2
        WHERE E2.DEPARTMENT_ID = 30
    );