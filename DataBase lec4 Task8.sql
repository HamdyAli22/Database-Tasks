--1. AVG Function
--Write an SQL query to calculate the average salary of all employees from the EMPLOYEES table.
SELECT AVG(SALARY) AS AVERAGE_SALARY
FROM EMPLOYEES;
/
--2. COUNT Function
--Write an SQL query to count the total number of employees in the EMPLOYEES table.
SELECT COUNT(*) AS TOTAL_EMPLOYEES
FROM EMPLOYEES;
/
--3. MAX Function
--Write an SQL query to find the maximum salary offered in the EMPLOYEES table.
SELECT MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEES;
/
--4. MIN Function
--Write an SQL query to find the minimum salary offered in the EMPLOYEES table.
SELECT MIN(SALARY) AS MIN_SALARY
FROM EMPLOYEES;
/
--5. SUM Function
--Write an SQL query to calculate the total salary that the company pays to all employees.
SELECT SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES;
/
--6. GROUP BY Clause (Part 1)
--Write an SQL query to display the department ID and the average salary of employees grouped by department from the EMPLOYEES table.
SELECT DEPARTMENT_ID, AVG(SALARY) AS AVERAGE_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;
/
--7. GROUP BY Clause (Part 2)
--Write an SQL query to show job ID and the total number of employees for each job title in the EMPLOYEES table.
SELECT JOB_ID, COUNT(*) AS TOTAL_EMPLOYEES
FROM EMPLOYEES
GROUP BY JOB_ID;
/
--8. HAVING Clause
--Write an SQL query to display the department ID and the total salary of employees only for departments where the total salary exceeds 50,000.
--(Hint: Use GROUP BY and HAVING together.)
SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING SUM(SALARY) > 50000;
/
--9. AVG Function (Advanced)
--Write a query to find the average commission (COMMISSION_PCT) given to employees who have a non-null commission in the EMPLOYEES table.
SELECT AVG(COMMISSION_PCT) AS AVERAGE_COMMISSION
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;
/
--10. COUNT Function (Advanced)
--Write a query to count how many employees have a salary greater than 10,000.
SELECT COUNT(*) AS HIGH_EARNING_EMPLOYEES
FROM EMPLOYEES
WHERE SALARY > 10000;
/
--11. MAX and MIN Together
--Write a query to find the maximum and minimum salary within each job ID using GROUP BY.
SELECT JOB_ID, MAX(SALARY) AS MAX_SALARY, MIN(SALARY) AS MIN_SALARY
FROM EMPLOYEES
GROUP BY JOB_ID;
/
--12. SUM Function (Advanced)
--Write a query to sum the salaries for each manager (MANAGER_ID) in the EMPLOYEES table.
SELECT MANAGER_ID, SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID;
/
--13. GROUP BY with Multiple Columns
--Write a query to display department ID and job ID, and show the total salary for each group (department + job combination).
SELECT DEPARTMENT_ID, JOB_ID, SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID, JOB_ID;
/
--14. HAVING with COUNT
--Write a query to display job ID and count of employees for each job, only show jobs that have more than 5 employees.
SELECT JOB_ID,COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID 
HAVING COUNT(*) > 5;
/
--15. Using Aggregate Functions Together
--Write a query to show each department ID with:
--Total employees,
--Average salary,
--Maximum salary,
--Minimum salary,
--and group them by department ID.
SELECT DEPARTMENT_ID,
       COUNT(*) AS TOTAL_EMPLOYEES,
       AVG(SALARY) AS AVERAGE_SALARY,
       MAX(SALARY) AS MAX_SALARY,
       MIN(SALARY) AS MIN_SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;
/
--16. Complex HAVING
--Write a query to find all departments where:
--The average salary is more than 8000,
--And the number of employees is less than 10.
SELECT DEPARTMENT_ID,
       COUNT(*) AS EMPLOYEE_COUNT,
       AVG(SALARY) AS AVERAGE_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) > 8000
AND COUNT(*) < 10;
/
--17. Nested Aggregation
--Write a query to find the department that has the highest total salary among all departments.
--(Hint: You can use GROUP BY + ORDER BY DESC + FETCH FIRST 1 ROW ONLY.)
SELECT DEPARTMENT_ID,SUM(SALARY) AS TOTAL_SALARY
FROM  EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY TOTAL_SALARY DESC
FETCH FIRST 1 ROW ONLY; 
/
--18. Using Aliases with Aggregates
--Write a query to show department ID, sum of salaries as Total_Salary, and average salary as Average_Salary, grouped by department ID.
SELECT DEPARTMENT_ID,
       SUM(SALARY) AS TOTAL_SALARY,
       AVG(SALARY) AS AVERAGE_SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;

