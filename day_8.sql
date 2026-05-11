-- =========================================================
-- DAY 13 ASSIGNMENT: SET OPERATIONS
-- =========================================================



-- =========================================================
-- Part 1: Practice Questions (With Answers and Explanations)
-- =========================================================



-- =========================================================
-- Question 1
-- List job_id values that appear in employees
-- in department 50 UNION job_id values that
-- appear in employees in department 60.
-- =========================================================

SELECT job_id
FROM hr.employees
WHERE department_id = 50

UNION

SELECT job_id
FROM hr.employees
WHERE department_id = 60;



-- =========================================================
-- Question 2
-- List department_id values that appear in both
-- hr.employees and hr.departments.
-- =========================================================

SELECT department_id
FROM hr.employees

INTERSECT

SELECT department_id
FROM hr.departments;



-- =========================================================
-- Question 3
-- List department_id values that are in
-- hr.departments but have no employees.
-- =========================================================

SELECT department_id
FROM hr.departments

MINUS

SELECT department_id
FROM hr.employees;



-- =========================================================
-- Part 2: Self-Practice
-- =========================================================



-- =========================================================
-- 1. Use UNION to combine employees with salary
-- between 3000–6000 and 5000–8000
-- =========================================================

SELECT employee_id,
       salary
FROM hr.employees
WHERE salary BETWEEN 3000 AND 6000

UNION

SELECT employee_id,
       salary
FROM hr.employees
WHERE salary BETWEEN 5000 AND 8000;



-- =========================================================
-- 2. Use INTERSECT to find manager_id values
-- that appear as employee_id
-- =========================================================

SELECT manager_id
FROM hr.employees
WHERE manager_id IS NOT NULL

INTERSECT

SELECT employee_id
FROM hr.employees;



-- =========================================================
-- Part 3: Additional Practice — 20 Medium Questions
-- =========================================================



-- M1
-- UNION job_id from department 50 and department 60

SELECT job_id
FROM hr.employees
WHERE department_id = 50

UNION

SELECT job_id
FROM hr.employees
WHERE department_id = 60;



-- M2
-- UNION ALL employee_id and first_name
-- from department 50 and department 80

SELECT employee_id,
       first_name
FROM hr.employees
WHERE department_id = 50

UNION ALL

SELECT employee_id,
       first_name
FROM hr.employees
WHERE department_id = 80;



-- M3
-- INTERSECT department_id from employees
-- and departments

SELECT department_id
FROM hr.employees

INTERSECT

SELECT department_id
FROM hr.departments;



-- M4
-- Departments with no employees

SELECT department_id
FROM hr.departments

MINUS

SELECT department_id
FROM hr.employees;



-- M5
-- UNION ALL employees salary > 10000
-- and department_id = 90

SELECT first_name,
       last_name
FROM hr.employees
WHERE salary > 10000

UNION ALL

SELECT first_name,
       last_name
FROM hr.employees
WHERE department_id = 90;



-- M6
-- INTERSECT job_id from department 50 and 80

SELECT job_id
FROM hr.employees
WHERE department_id = 50

INTERSECT

SELECT job_id
FROM hr.employees
WHERE department_id = 80;



-- M7
-- Employees who are not managers

SELECT employee_id
FROM hr.employees

MINUS

SELECT manager_id
FROM hr.employees
WHERE manager_id IS NOT NULL;



-- M8
-- UNION department_id from employees and departments

SELECT department_id
FROM hr.employees

UNION

SELECT department_id
FROM hr.departments

ORDER BY 1;



-- M9
-- UNION ALL literals using dual

SELECT 10,
       'Dept10'
FROM dual

UNION ALL

SELECT 20,
       'Dept20'
FROM dual;



-- M10
-- Managers who are employees

SELECT manager_id
FROM hr.employees
WHERE manager_id IS NOT NULL

INTERSECT

SELECT employee_id
FROM hr.employees;



-- M11
-- Jobs in department 80 but not in 50

SELECT job_id
FROM hr.employees
WHERE department_id = 80

MINUS

SELECT job_id
FROM hr.employees
WHERE department_id = 50;



-- M12
-- Distinct salaries from department 50 and 60

SELECT salary
FROM hr.employees
WHERE department_id = 50

UNION

SELECT salary
FROM hr.employees
WHERE department_id = 60;



-- M13
-- Departments that have employees

SELECT department_id
FROM hr.departments

INTERSECT

SELECT department_id
FROM hr.employees;



-- M14
-- UNION ALL salaries less than 5000 and greater than 15000

SELECT employee_id,
       salary
FROM hr.employees
WHERE salary < 5000

UNION ALL

SELECT employee_id,
       salary
FROM hr.employees
WHERE salary > 15000;



-- M15
-- Employee department_ids not in departments table

SELECT department_id
FROM hr.employees

MINUS

SELECT department_id
FROM hr.departments;



-- M16
-- UNION first_name from SA_REP and SA_MAN

SELECT first_name
FROM hr.employees
WHERE job_id = 'SA_REP'

UNION

SELECT first_name
FROM hr.employees
WHERE job_id = 'SA_MAN';



-- M17
-- INTERSECT all jobs and department 90 jobs

SELECT job_id
FROM hr.employees

INTERSECT

SELECT job_id
FROM hr.employees
WHERE department_id = 90;



-- M18
-- UNION ALL departments 10 and 20

SELECT department_id,
       department_name
FROM hr.departments
WHERE department_id = 10

UNION ALL

SELECT department_id,
       department_name
FROM hr.departments
WHERE department_id = 20;



-- M19
-- Employees in department 50 but salary <= 7000

SELECT employee_id
FROM hr.employees
WHERE department_id = 50

MINUS

SELECT employee_id
FROM hr.employees
WHERE salary > 7000;



-- M20
-- UNION department_id from employees and departments

SELECT department_id
FROM hr.employees

UNION

SELECT department_id
FROM hr.departments;



-- =========================================================
-- HARD QUESTIONS
-- =========================================================



-- H1
-- UNION of salary ranges

SELECT department_id
FROM hr.employees
WHERE salary < 3000

UNION

SELECT department_id
FROM hr.employees
WHERE salary BETWEEN 3000 AND 8000

UNION

SELECT department_id
FROM hr.employees
WHERE salary > 8000;



-- H2
-- Managers who are employees

SELECT manager_id
FROM hr.employees
WHERE manager_id IS NOT NULL

INTERSECT

SELECT employee_id
FROM hr.employees;



-- H3
-- Departments with no employees showing names

SELECT d.department_id,
       d.department_name
FROM hr.departments d
WHERE d.department_id IN
(
    SELECT department_id
    FROM hr.departments

    MINUS

    SELECT department_id
    FROM hr.employees
);



-- H4
-- UNION ALL employees with flag column

SELECT employee_id,
       first_name,
       last_name,
       'A' AS flag
FROM hr.employees
WHERE salary > 10000

UNION ALL

SELECT employee_id,
       first_name,
       last_name,
       'B' AS flag
FROM hr.employees
WHERE salary <= 10000;



-- H5
-- Jobs appearing in both department groups

SELECT job_id
FROM hr.employees
WHERE department_id IN (10,20)

INTERSECT

SELECT job_id
FROM hr.employees
WHERE department_id IN (50,60);



-- H6
-- Employees who are not managers

SELECT employee_id
FROM hr.employees

MINUS

SELECT manager_id
FROM hr.employees
WHERE manager_id IS NOT NULL;



-- H7
-- Department employee count and default zero rows

SELECT department_id,
       COUNT(*)
FROM hr.employees
GROUP BY department_id

UNION

SELECT department_id,
       0
FROM hr.departments;



-- H8
-- INTERSECT department_id and job_id pairs

SELECT department_id,
       job_id
FROM hr.employees
WHERE salary > 5000

INTERSECT

SELECT department_id,
       job_id
FROM hr.employees
WHERE commission_pct IS NOT NULL;



-- H9
-- Employee and manager pairs not in department 50

SELECT employee_id,
       manager_id
FROM hr.employees
WHERE manager_id IS NOT NULL

MINUS

SELECT employee_id,
       manager_id
FROM hr.employees
WHERE department_id = 50;



-- H10
-- Count occurrences of department_id using UNION ALL

SELECT department_id,
       COUNT(*)
FROM
(
    SELECT department_id
    FROM hr.employees

    UNION ALL

    SELECT department_id
    FROM hr.departments
)
GROUP BY department_id;



-- H11
-- Same employee names in department 50 and 80

SELECT first_name,
       last_name
FROM hr.employees
WHERE department_id = 50

INTERSECT

SELECT first_name,
       last_name
FROM hr.employees
WHERE department_id = 80;



-- H12
-- Jobs with no hires in or after 2005

SELECT job_id
FROM hr.employees

MINUS

SELECT job_id
FROM hr.employees
WHERE hire_date >= DATE '2005-01-01';



-- H13
-- Department salary totals and grand total

SELECT department_id,
       SUM(salary)
FROM hr.employees
GROUP BY department_id

UNION

SELECT NULL,
       SUM(salary)
FROM hr.employees;



-- H14
-- Departments having both SA_REP and SA_MAN

SELECT department_id
FROM hr.employees
WHERE job_id = 'SA_REP'

INTERSECT

SELECT department_id
FROM hr.employees
WHERE job_id = 'SA_MAN';



-- H15
-- Managers not in department 90

SELECT manager_id
FROM hr.employees
WHERE manager_id IS NOT NULL

MINUS

SELECT employee_id
FROM hr.employees
WHERE department_id = 90;



-- H16
-- Employees above and below company average salary

SELECT employee_id,
       first_name,
       last_name,
       department_id
FROM hr.employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM hr.employees
)

UNION

SELECT employee_id,
       first_name,
       last_name,
       department_id
FROM hr.employees
WHERE salary <
(
    SELECT AVG(salary)
    FROM hr.employees
);



-- H17
-- INTERSECT department_id and job_id pairs

SELECT department_id,
       job_id
FROM hr.employees

INTERSECT

SELECT department_id,
       job_id
FROM hr.employees
GROUP BY department_id,
         job_id;



-- H18
-- Employees in department 80 but salary <= 10000

SELECT employee_id
FROM hr.employees
WHERE department_id = 80

MINUS

SELECT employee_id
FROM hr.employees
WHERE salary > 10000;



-- H19
-- UNION ALL with level column

SELECT 1,
       department_id,
       COUNT(*)
FROM hr.employees
GROUP BY department_id

UNION ALL

SELECT 2,
       NULL,
       COUNT(*)
FROM hr.employees;



-- H20
-- Jobs in valid departments

SELECT job_id
FROM hr.employees
WHERE department_id IN
(
    SELECT department_id
    FROM hr.departments
)

INTERSECT

SELECT job_id
FROM hr.employees;
