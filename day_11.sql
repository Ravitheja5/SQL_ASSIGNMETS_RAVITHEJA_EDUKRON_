-- =========================================================
-- DAY 11 ASSIGNMENT
-- TOPIC: SUBQUERIES (SCALAR AND TABLE)
-- DATABASE: HR SCHEMA
-- TABLES USED:
--      hr.employees
--      hr.departments
-- =========================================================



-- =========================================================
-- PART 1 : PRACTICE QUESTIONS
-- =========================================================



-- ---------------------------------------------------------
-- QUESTION 1
-- List employees who earn more than the company average salary.
-- Hint:
-- Use scalar subquery with AVG(salary)
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       last_name,
       salary
FROM hr.employees
WHERE salary >
      (
          SELECT AVG(salary)
          FROM hr.employees
      );



-- ---------------------------------------------------------
-- QUESTION 2
-- List employees whose department_id exists in hr.departments.
-- Hint:
-- Use IN with subquery
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       last_name,
       department_id
FROM hr.employees
WHERE department_id IN
      (
          SELECT department_id
          FROM hr.departments
      );



-- ---------------------------------------------------------
-- QUESTION 3
-- Show department names with employee count.
-- Hint:
-- Use correlated scalar subquery
-- ---------------------------------------------------------

SELECT d.department_id,
       d.department_name,
       (
           SELECT COUNT(*)
           FROM hr.employees e
           WHERE e.department_id = d.department_id
       ) AS employee_count
FROM hr.departments d;



-- =========================================================
-- PART 2 : SELF PRACTICE QUESTIONS
-- =========================================================



-- ---------------------------------------------------------
-- QUESTION 1
-- List employees whose salary is greater than
-- the average salary of their own department.
-- Hint:
-- Use correlated subquery
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       last_name,
       salary,
       department_id
FROM hr.employees e
WHERE salary >
      (
          SELECT AVG(salary)
          FROM hr.employees
          WHERE department_id = e.department_id
      );



-- ---------------------------------------------------------
-- QUESTION 2
-- List departments that have at least one employee.
-- Hint:
-- Use EXISTS with correlated subquery
-- ---------------------------------------------------------

SELECT department_id,
       department_name
FROM hr.departments d
WHERE EXISTS
      (
          SELECT 1
          FROM hr.employees e
          WHERE e.department_id = d.department_id
      );



-- ---------------------------------------------------------
-- QUESTION 3
-- Show each department_id and maximum salary
-- using derived table.
-- Hint:
-- Use subquery in FROM clause
-- ---------------------------------------------------------

SELECT *
FROM
(
    SELECT department_id,
           MAX(salary) AS max_salary
    FROM hr.employees
    GROUP BY department_id
) sub;



-- =========================================================
-- PART 3 : 20 MEDIUM QUESTIONS
-- =========================================================



-- ---------------------------------------------------------
-- M1
-- Employees with salary greater than company average
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       salary
FROM hr.employees
WHERE salary >
      (
          SELECT AVG(salary)
          FROM hr.employees
      );



-- ---------------------------------------------------------
-- M2
-- Employees where department exists
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       department_id
FROM hr.employees
WHERE department_id IN
      (
          SELECT department_id
          FROM hr.departments
      );



-- ---------------------------------------------------------
-- M3
-- Show employee salary with company average salary
-- ---------------------------------------------------------

SELECT employee_id,
       salary,
       (
           SELECT AVG(salary)
           FROM hr.employees
       ) AS avg_sal
FROM hr.employees;



-- ---------------------------------------------------------
-- M4
-- Departments having more than 3 employees
-- ---------------------------------------------------------

SELECT department_id,
       department_name
FROM hr.departments d
WHERE
(
    SELECT COUNT(*)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
) > 3;



-- ---------------------------------------------------------
-- M5
-- Employees from departments 10,20,30
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       department_id
FROM hr.employees
WHERE department_id IN
(
    SELECT department_id
    FROM hr.departments
    WHERE department_id IN (10,20,30)
);



-- ---------------------------------------------------------
-- M6
-- Department with employee count
-- ---------------------------------------------------------

SELECT d.department_id,
       d.department_name,
       (
           SELECT COUNT(*)
           FROM hr.employees e
           WHERE e.department_id = d.department_id
       ) AS emp_count
FROM hr.departments d;



-- ---------------------------------------------------------
-- M7
-- Employees salary less than minimum salary in dept 50
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       salary
FROM hr.employees
WHERE salary <
(
    SELECT MIN(salary)
    FROM hr.employees
    WHERE department_id = 50
);



-- ---------------------------------------------------------
-- M8
-- Show employee with department name
-- ---------------------------------------------------------

SELECT e.employee_id,
       e.first_name,
       (
           SELECT d.department_name
           FROM hr.departments d
           WHERE d.department_id = e.department_id
       ) AS department_name
FROM hr.employees e;



-- ---------------------------------------------------------
-- M9
-- Departments having employees using EXISTS
-- ---------------------------------------------------------

SELECT department_id,
       department_name
FROM hr.departments d
WHERE EXISTS
(
    SELECT 1
    FROM hr.employees e
    WHERE e.department_id = d.department_id
);



-- ---------------------------------------------------------
-- M10
-- Employees having same job as dept 80 employees
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       job_id
FROM hr.employees
WHERE job_id IN
(
    SELECT DISTINCT job_id
    FROM hr.employees
    WHERE department_id = 80
);



-- ---------------------------------------------------------
-- M11
-- Department salary total
-- ---------------------------------------------------------

SELECT d.department_id,
       (
           SELECT SUM(salary)
           FROM hr.employees e
           WHERE e.department_id = d.department_id
       ) AS total_salary
FROM hr.departments d;



-- ---------------------------------------------------------
-- M12
-- Employees salary between min and max salary
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       salary
FROM hr.employees
WHERE salary BETWEEN
(
    SELECT MIN(salary)
    FROM hr.employees
)
AND
(
    SELECT MAX(salary)
    FROM hr.employees
);



-- ---------------------------------------------------------
-- M13
-- Employees with invalid department
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       department_id
FROM hr.employees
WHERE department_id NOT IN
(
    SELECT department_id
    FROM hr.departments
    WHERE department_id IS NOT NULL
);



-- ---------------------------------------------------------
-- M14
-- Difference from max salary
-- ---------------------------------------------------------

SELECT employee_id,
       salary,
       (
           SELECT MAX(salary)
           FROM hr.employees
       ) - salary AS diff_from_max
FROM hr.employees;



-- ---------------------------------------------------------
-- M15
-- Departments with avg salary > 7000
-- ---------------------------------------------------------

SELECT department_id,
       department_name
FROM hr.departments d
WHERE
(
    SELECT AVG(salary)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
) > 7000;



-- ---------------------------------------------------------
-- M16
-- Departments having employee count > 5
-- ---------------------------------------------------------

SELECT *
FROM
(
    SELECT department_id,
           COUNT(*) AS c
    FROM hr.employees
    GROUP BY department_id
) sub
WHERE c > 5;



-- ---------------------------------------------------------
-- M17
-- Employees earning above job average
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       salary,
       job_id
FROM hr.employees e
WHERE salary >=
(
    SELECT AVG(salary)
    FROM hr.employees
    WHERE job_id = e.job_id
);



-- ---------------------------------------------------------
-- M18
-- Department names with employee count
-- ---------------------------------------------------------

SELECT d.department_name,
       (
           SELECT COUNT(*)
           FROM hr.employees e
           WHERE e.department_id = d.department_id
       ) AS emp_count
FROM hr.departments d;



-- ---------------------------------------------------------
-- M19
-- Employees whose department exists
-- ---------------------------------------------------------

SELECT employee_id,
       first_name
FROM hr.employees e
WHERE EXISTS
(
    SELECT 1
    FROM hr.departments d
    WHERE d.department_id = e.department_id
);



-- ---------------------------------------------------------
-- M20
-- Job average salary > 8000
-- ---------------------------------------------------------

SELECT *
FROM
(
    SELECT job_id,
           AVG(salary) AS avg_sal
    FROM hr.employees
    GROUP BY job_id
) sub
WHERE avg_sal > 8000;



-- =========================================================
-- HARD QUESTIONS (H1 - H20)
-- =========================================================



-- ---------------------------------------------------------
-- H1
-- Employees whose salary is in top 5 salaries
-- Hint:
-- Nested subquery with ORDER BY and FETCH FIRST
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       salary
FROM hr.employees
WHERE salary >=
(
    SELECT MIN(salary)
    FROM
    (
        SELECT salary
        FROM hr.employees
        ORDER BY salary DESC
        FETCH FIRST 5 ROWS ONLY
    )
);



-- ---------------------------------------------------------
-- H2
-- Departments where total salary is greater than
-- average department total salary
-- Hint:
-- HAVING with scalar subquery from derived table
-- ---------------------------------------------------------

SELECT department_id,
       SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
HAVING SUM(salary) >
(
    SELECT AVG(total)
    FROM
    (
        SELECT SUM(salary) AS total
        FROM hr.employees
        GROUP BY department_id
    )
);



-- ---------------------------------------------------------
-- H3
-- Employees having same job_id as manager
-- Hint:
-- Correlated scalar subquery
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       job_id,
       manager_id
FROM hr.employees e
WHERE job_id =
(
    SELECT m.job_id
    FROM hr.employees m
    WHERE m.employee_id = e.manager_id
);



-- ---------------------------------------------------------
-- H4
-- Show employee details with department name
-- and employee count in department
-- Hint:
-- Two correlated scalar subqueries
-- ---------------------------------------------------------

SELECT e.employee_id,
       e.salary,

       (
           SELECT d.department_name
           FROM hr.departments d
           WHERE d.department_id = e.department_id
       ) AS department_name,

       (
           SELECT COUNT(*)
           FROM hr.employees e2
           WHERE e2.department_id = e.department_id
       ) AS dept_emp_count

FROM hr.employees e;



-- ---------------------------------------------------------
-- H5
-- Departments having employee count greater than
-- average employee count of departments
-- Hint:
-- HAVING with scalar subquery
-- ---------------------------------------------------------

SELECT department_id,
       COUNT(*) AS emp_count
FROM hr.employees
GROUP BY department_id
HAVING COUNT(*) >
(
    SELECT AVG(cnt)
    FROM
    (
        SELECT COUNT(*) AS cnt
        FROM hr.employees
        GROUP BY department_id
    )
);



-- ---------------------------------------------------------
-- H6
-- Employees earning greater than all salaries
-- in department 50
-- Hint:
-- Use MAX salary from department 50
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       salary
FROM hr.employees
WHERE salary >
(
    SELECT MAX(salary)
    FROM hr.employees
    WHERE department_id = 50
);



-- ---------------------------------------------------------
-- H7
-- Show department name with employee count
-- and salary sum using derived table
-- Hint:
-- Derived table join
-- ---------------------------------------------------------

SELECT d.department_name,
       sub.c,
       sub.s
FROM
(
    SELECT department_id,
           COUNT(*) AS c,
           SUM(salary) AS s
    FROM hr.employees
    GROUP BY department_id
) sub
JOIN hr.departments d
ON sub.department_id = d.department_id;



-- ---------------------------------------------------------
-- H8
-- Employees whose department has exactly 3 employees
-- Hint:
-- Correlated count subquery
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       department_id
FROM hr.employees e
WHERE
(
    SELECT COUNT(*)
    FROM hr.employees e2
    WHERE e2.department_id = e.department_id
) = 3;



-- ---------------------------------------------------------
-- H9
-- Departments whose manager exists in employees
-- Hint:
-- IN with subquery
-- ---------------------------------------------------------

SELECT department_id,
       department_name,
       manager_id
FROM hr.departments d
WHERE d.manager_id IN
(
    SELECT employee_id
    FROM hr.employees
);



-- ---------------------------------------------------------
-- H10
-- Show employee with manager full name
-- Hint:
-- Correlated scalar subquery
-- ---------------------------------------------------------

SELECT e.employee_id,

       (
           SELECT m.first_name || ' ' || m.last_name
           FROM hr.employees m
           WHERE m.employee_id = e.manager_id
       ) AS manager_name

FROM hr.employees e;



-- ---------------------------------------------------------
-- H11
-- Employees belonging to department with
-- highest total salary
-- Hint:
-- Nested subquery with FETCH FIRST
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       department_id
FROM hr.employees
WHERE department_id IN
(
    SELECT department_id
    FROM
    (
        SELECT department_id,
               SUM(salary) AS s
        FROM hr.employees
        GROUP BY department_id
        ORDER BY s DESC
        FETCH FIRST 1 ROW ONLY
    )
);



-- ---------------------------------------------------------
-- H12
-- Employees earning 10% above department average
-- Hint:
-- Correlated AVG * 1.1
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       salary,
       department_id
FROM hr.employees e
WHERE salary >
(
    SELECT AVG(salary) * 1.1
    FROM hr.employees e2
    WHERE e2.department_id = e.department_id
);



-- ---------------------------------------------------------
-- H13
-- Departments with no employees
-- Hint:
-- NOT EXISTS
-- ---------------------------------------------------------

SELECT department_id,
       department_name
FROM hr.departments d
WHERE NOT EXISTS
(
    SELECT 1
    FROM hr.employees e
    WHERE e.department_id = d.department_id
);



-- ---------------------------------------------------------
-- H14
-- Show department average salary and employee count
-- Hint:
-- Two correlated scalar subqueries
-- ---------------------------------------------------------

SELECT d.department_id,
       d.department_name,

       (
           SELECT AVG(salary)
           FROM hr.employees e
           WHERE e.department_id = d.department_id
       ) AS avg_salary,

       (
           SELECT COUNT(*)
           FROM hr.employees e
           WHERE e.department_id = d.department_id
       ) AS emp_count

FROM hr.departments d;



-- ---------------------------------------------------------
-- H15
-- Job IDs having employee count greater than
-- average job employee count
-- Hint:
-- HAVING with scalar subquery
-- ---------------------------------------------------------

SELECT job_id,
       COUNT(*) AS cnt
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) >
(
    SELECT AVG(cnt)
    FROM
    (
        SELECT COUNT(*) AS cnt
        FROM hr.employees
        GROUP BY job_id
    )
);



-- ---------------------------------------------------------
-- H16
-- Employees hired earliest in their department
-- Hint:
-- Correlated MIN(hire_date)
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       hire_date,
       department_id
FROM hr.employees e
WHERE hire_date =
(
    SELECT MIN(hire_date)
    FROM hr.employees
    WHERE department_id = e.department_id
);



-- ---------------------------------------------------------
-- H17
-- Department average salary with department name
-- Hint:
-- Derived table join
-- ---------------------------------------------------------

SELECT d.department_name,
       sub.a
FROM
(
    SELECT department_id,
           ROUND(AVG(salary),2) AS a
    FROM hr.employees
    GROUP BY department_id
) sub
JOIN hr.departments d
ON sub.department_id = d.department_id;



-- ---------------------------------------------------------
-- H18
-- Employees within 10% of department maximum salary
-- Hint:
-- Correlated MAX * 0.9
-- ---------------------------------------------------------

SELECT employee_id,
       first_name,
       salary,
       department_id
FROM hr.employees e
WHERE salary >=
(
    SELECT MAX(salary) * 0.9
    FROM hr.employees e2
    WHERE e2.department_id = e.department_id
);



-- ---------------------------------------------------------
-- H19
-- Departments having at least 2 distinct jobs
-- Hint:
-- Correlated COUNT DISTINCT
-- ---------------------------------------------------------

SELECT department_id,
       department_name
FROM hr.departments d
WHERE
(
    SELECT COUNT(DISTINCT job_id)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
) >= 2;



-- ---------------------------------------------------------
-- H20
-- Show salary difference from company average
-- Hint:
-- Scalar subquery used multiple times
-- ---------------------------------------------------------

SELECT employee_id,
       salary,

       (
           SELECT AVG(salary)
           FROM hr.employees
       ) AS avg_salary,

       salary -
       (
           SELECT AVG(salary)
           FROM hr.employees
       ) AS diff

FROM hr.employees;



