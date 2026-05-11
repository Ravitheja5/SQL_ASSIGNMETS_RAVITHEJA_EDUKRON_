-- =========================================================
-- DAY 12 ASSIGNMENT: CORRELATED SUBQUERIES
-- =========================================================



-- =========================================================
-- Part 1: Practice Questions (With Answers and Explanations)
-- =========================================================



-- =========================================================
-- Question 1
-- List employees whose salary is above their department average.
-- Use a correlated subquery that computes AVG(salary)
-- for the same department_id.
-- =========================================================

SELECT e.employee_id,
       e.first_name,
       e.salary,
       e.department_id
FROM hr.employees e
WHERE e.salary >
(
    SELECT AVG(salary)
    FROM hr.employees
    WHERE department_id = e.department_id
);



-- =========================================================
-- Question 2
-- List departments that have no employees.
-- Use NOT EXISTS with a correlated subquery.
-- =========================================================

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE NOT EXISTS
(
    SELECT 1
    FROM hr.employees e
    WHERE e.department_id = d.department_id
);



-- =========================================================
-- Question 3
-- List employees whose salary is in the top 3
-- within their department.
-- =========================================================

SELECT e.employee_id,
       e.first_name,
       e.salary,
       e.department_id
FROM hr.employees e
WHERE
(
    SELECT COUNT(DISTINCT salary)
    FROM hr.employees e2
    WHERE e2.department_id = e.department_id
    AND e2.salary > e.salary
) < 3;



-- =========================================================
-- Part 2: Self-Practice (No Answers)
-- =========================================================



-- =========================================================
-- 1. List employees who were hired after their manager
-- =========================================================

SELECT e.employee_id,
       e.first_name,
       e.hire_date,
       e.manager_id
FROM hr.employees e
WHERE e.hire_date >
(
    SELECT m.hire_date
    FROM hr.employees m
    WHERE m.employee_id = e.manager_id
);



-- =========================================================
-- 2. List departments where every employee has
-- non-NULL commission_pct
-- =========================================================

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE NOT EXISTS
(
    SELECT 1
    FROM hr.employees e
    WHERE e.department_id = d.department_id
    AND e.commission_pct IS NULL
);



-- =========================================================
-- Part 3: Additional Practice — 20 Medium Questions
-- =========================================================



-- M1
-- Employees whose salary > department average

SELECT e.employee_id,
       e.first_name,
       e.salary
FROM hr.employees e
WHERE e.salary >
(
    SELECT AVG(salary)
    FROM hr.employees
    WHERE department_id = e.department_id
);



-- M2
-- Departments with at least one employee

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE EXISTS
(
    SELECT 1
    FROM hr.employees e
    WHERE e.department_id = d.department_id
);



-- M3
-- Departments with no employees

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE NOT EXISTS
(
    SELECT 1
    FROM hr.employees e
    WHERE e.department_id = d.department_id
);



-- M4
-- Employees who earn more than their manager

SELECT e.employee_id,
       e.first_name,
       e.salary
FROM hr.employees e
WHERE e.salary >
(
    SELECT salary
    FROM hr.employees m
    WHERE m.employee_id = e.manager_id
);



-- M5
-- Departments having zero employees

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE
(
    SELECT COUNT(*)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
) = 0;



-- M6
-- Employees hired after manager

SELECT e.employee_id,
       e.first_name,
       e.hire_date
FROM hr.employees e
WHERE e.hire_date >
(
    SELECT hire_date
    FROM hr.employees m
    WHERE m.employee_id = e.manager_id
);



-- M7
-- Departments average salary between 5000 and 10000

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE
(
    SELECT AVG(salary)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
)
BETWEEN 5000 AND 10000;



-- M8
-- Employees in departments having more than 5 employees

SELECT e.employee_id,
       e.first_name,
       e.department_id
FROM hr.employees e
WHERE
(
    SELECT COUNT(*)
    FROM hr.employees e2
    WHERE e2.department_id = e.department_id
) > 5;



-- M9
-- Departments having employee salary > 10000

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE EXISTS
(
    SELECT 1
    FROM hr.employees e
    WHERE e.department_id = d.department_id
    AND e.salary > 10000
);



-- M10
-- Employees with lowest salary in department

SELECT e.employee_id,
       e.first_name,
       e.salary
FROM hr.employees e
WHERE
(
    SELECT MIN(salary)
    FROM hr.employees e2
    WHERE e2.department_id = e.department_id
) = e.salary;



-- M11
-- Departments where maximum salary < 15000

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE
(
    SELECT MAX(salary)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
) < 15000;



-- M12
-- Employees whose manager does not exist

SELECT e.employee_id,
       e.first_name,
       e.manager_id
FROM hr.employees e
WHERE NOT EXISTS
(
    SELECT 1
    FROM hr.employees m
    WHERE m.employee_id = e.manager_id
)
AND e.manager_id IS NOT NULL;



-- M13
-- Employees having same job as manager

SELECT e.employee_id,
       e.first_name,
       e.job_id
FROM hr.employees e
WHERE
(
    SELECT job_id
    FROM hr.employees m
    WHERE m.employee_id = e.manager_id
) = e.job_id;



-- M14
-- Departments having employees with commission

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE
(
    SELECT COUNT(*)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
    AND e.commission_pct IS NOT NULL
) > 0;



-- M15
-- Employees within 80% of department max salary

SELECT e.employee_id,
       e.first_name,
       e.salary
FROM hr.employees e
WHERE salary >=
(
    SELECT MAX(salary) * 0.8
    FROM hr.employees e2
    WHERE e2.department_id = e.department_id
);



-- M16
-- Departments with no employee hired before 2000

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE NOT EXISTS
(
    SELECT 1
    FROM hr.employees e
    WHERE e.department_id = d.department_id
    AND e.hire_date < DATE '2000-01-01'
);



-- M17
-- Employees working in Sales department

SELECT e.employee_id,
       e.first_name
FROM hr.employees e
WHERE
(
    SELECT department_name
    FROM hr.departments d
    WHERE d.department_id = e.department_id
) = 'Sales';



-- M18
-- Departments where total salary > 100000

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE
(
    SELECT SUM(salary)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
) > 100000;



-- M19
-- Employees who are only employee in department

SELECT e.employee_id,
       e.first_name
FROM hr.employees e
WHERE
(
    SELECT COUNT(*)
    FROM hr.employees e2
    WHERE e2.department_id = e.department_id
) = 1;



-- M20
-- Departments having employee without manager

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE EXISTS
(
    SELECT 1
    FROM hr.employees e
    WHERE e.department_id = d.department_id
    AND e.manager_id IS NULL
);



-- =========================================================
-- HARD QUESTIONS
-- =========================================================



-- H1
-- Employees hired after manager

SELECT e.employee_id,
       e.first_name,
       e.hire_date
FROM hr.employees e
WHERE e.hire_date >
(
    SELECT hire_date
    FROM hr.employees m
    WHERE m.employee_id = e.manager_id
);



-- H2
-- Departments where every employee has commission_pct

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE NOT EXISTS
(
    SELECT 1
    FROM hr.employees e
    WHERE e.department_id = d.department_id
    AND e.commission_pct IS NULL
);



-- H3
-- Employees with second highest salary in department

SELECT e.employee_id,
       e.first_name,
       e.salary
FROM hr.employees e
WHERE
(
    SELECT COUNT(DISTINCT e2.salary)
    FROM hr.employees e2
    WHERE e2.department_id = e.department_id
    AND e2.salary > e.salary
) = 1;



-- H4
-- Departments where department average salary
-- is greater than company average salary

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE
(
    SELECT AVG(salary)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
)
>
(
    SELECT AVG(salary)
    FROM hr.employees
);



-- H5
-- Employees having same salary as manager

SELECT e.employee_id,
       e.first_name,
       e.salary
FROM hr.employees e
WHERE e.salary =
(
    SELECT salary
    FROM hr.employees m
    WHERE m.employee_id = e.manager_id
);



-- H6
-- Departments having at least 2 employees
-- with salary > 8000

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE
(
    SELECT COUNT(*)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
    AND e.salary > 8000
) >= 2;



-- H7
-- Employees whose department has highest total salary

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



-- H8
-- Departments having at least 3 distinct jobs

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE
(
    SELECT COUNT(DISTINCT job_id)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
) >= 3;



-- H9
-- Employees in top 3 salary of department

SELECT e.employee_id,
       e.first_name,
       e.salary
FROM hr.employees e
WHERE
(
    SELECT COUNT(*)
    FROM hr.employees e2
    WHERE e2.department_id = e.department_id
    AND e2.salary > e.salary
) <= 2;



-- H10
-- Departments with no employees

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE NOT EXISTS
(
    SELECT 1
    FROM hr.employees e
    WHERE e.department_id = d.department_id
);



-- H11
-- Employees whose manager is in different department

SELECT e.employee_id,
       e.first_name
FROM hr.employees e
WHERE
(
    SELECT department_id
    FROM hr.employees m
    WHERE m.employee_id = e.manager_id
) <> e.department_id
AND e.manager_id IS NOT NULL;



-- H12
-- Departments where minimum salary > 4000

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE
(
    SELECT MIN(salary)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
) > 4000;



-- H13
-- Earliest hired employee in department

SELECT e.employee_id,
       e.first_name,
       e.hire_date
FROM hr.employees e
WHERE
(
    SELECT COUNT(*)
    FROM hr.employees e2
    WHERE e2.department_id = e.department_id
    AND e2.hire_date < e.hire_date
) = 0;



-- H14
-- Departments having exactly 5 employees

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE
(
    SELECT COUNT(*)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
) = 5;



-- H15
-- Employees salary greater than job average

SELECT e.employee_id,
       e.first_name,
       e.salary
FROM hr.employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM hr.employees e2
    WHERE e2.job_id = e.job_id
);



-- H16
-- Departments having hires from 2005 onward

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE
(
    SELECT MAX(hire_date)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
) >= DATE '2005-01-01';



-- H17
-- Managers having more than 2 direct reports

SELECT e.employee_id,
       e.first_name
FROM hr.employees e
WHERE e.employee_id IN
(
    SELECT manager_id
    FROM hr.employees
    WHERE manager_id IS NOT NULL
    GROUP BY manager_id
    HAVING COUNT(*) > 2
);



-- H18
-- Departments having highest total salary

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE
(
    SELECT SUM(salary)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
)
=
(
    SELECT MAX(s)
    FROM
    (
        SELECT SUM(salary) AS s
        FROM hr.employees
        GROUP BY department_id
    )
);



-- H19
-- Employees working in Sales or IT department

SELECT e.employee_id,
       e.first_name
FROM hr.employees e
WHERE
(
    SELECT department_name
    FROM hr.departments d
    WHERE d.department_id = e.department_id
)
IN ('Sales','IT');



-- H20
-- Departments where all employees have commission

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE
(
    SELECT COUNT(*)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
    AND e.commission_pct IS NOT NULL
)
=
(
    SELECT COUNT(*)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
)
AND
(
    SELECT COUNT(*)
    FROM hr.employees e
    WHERE e.department_id = d.department_id
) > 0;
