-- =========================================================
-- DAY 19 ASSIGNMENT: VIEWS
-- =========================================================



-- =========================================================
-- Part 1: Practice Questions
-- =========================================================



-- =========================================================
-- Question 1
-- Create a view that shows employee_id,
-- first_name, last_name and department_name.
-- =========================================================

CREATE OR REPLACE VIEW emp_dept_view AS
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id;



-- =========================================================
-- Question 2
-- Create view with department totals
-- and employee count.
-- =========================================================

CREATE OR REPLACE VIEW dept_totals_view AS
SELECT d.department_id,
       d.department_name,
       COUNT(e.employee_id) AS employee_count,
       SUM(e.salary) AS total_salary
FROM hr.departments d
LEFT JOIN hr.employees e
ON e.department_id = d.department_id
GROUP BY d.department_id,
         d.department_name;



-- =========================================================
-- Question 3
-- Create view for department_id = 50
-- with WITH CHECK OPTION.
-- =========================================================

CREATE OR REPLACE VIEW emp_dept50_view AS
SELECT employee_id,
       first_name,
       last_name,
       department_id
FROM hr.employees
WHERE department_id = 50
WITH CHECK OPTION;



-- =========================================================
-- Part 2: Self-Practice
-- =========================================================



-- =========================================================
-- 1. Create view where salary > 10000
-- =========================================================

CREATE OR REPLACE VIEW emp_high_salary_view AS
SELECT employee_id,
       first_name,
       last_name,
       salary
FROM hr.employees
WHERE salary > 10000;



-- =========================================================
-- 2. Create join view for location_id = 1700
-- =========================================================

CREATE OR REPLACE VIEW emp_loc1700_view AS
SELECT e.employee_id,
       e.first_name,
       d.department_name
FROM hr.employees e
JOIN hr.departments d
ON e.department_id = d.department_id
WHERE d.location_id = 1700;



-- =========================================================
-- 20 MEDIUM QUESTIONS
-- =========================================================



-- =========================================================
-- M1
-- Create employee + department view
-- =========================================================

CREATE OR REPLACE VIEW v_emp_dept AS
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name
FROM hr.employees e
JOIN hr.departments d
ON e.department_id = d.department_id;



-- =========================================================
-- M2
-- Create view for department_id = 50
-- =========================================================

CREATE OR REPLACE VIEW v_dept50 AS
SELECT *
FROM hr.employees
WHERE department_id = 50;



-- =========================================================
-- M3
-- Create view WITH READ ONLY
-- =========================================================

CREATE OR REPLACE VIEW v_read_only AS
SELECT employee_id,
       first_name,
       last_name
FROM hr.employees
WITH READ ONLY;



-- =========================================================
-- M4
-- Create view WITH CHECK OPTION
-- =========================================================

CREATE OR REPLACE VIEW v_dept80 AS
SELECT *
FROM hr.employees
WHERE department_id = 80
WITH CHECK OPTION;



-- =========================================================
-- M5
-- View with GROUP BY
-- =========================================================

CREATE OR REPLACE VIEW v_dept_count AS
SELECT d.department_name,
       COUNT(e.employee_id) AS emp_count
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;



-- =========================================================
-- M6
-- Select from view
-- =========================================================

SELECT *
FROM v_emp_dept;



-- =========================================================
-- M7
-- Create view hiding salary
-- =========================================================

CREATE OR REPLACE VIEW v_emp_nosalary AS
SELECT employee_id,
       first_name,
       last_name,
       department_id
FROM hr.employees;



-- =========================================================
-- M8
-- Create Sales department view
-- =========================================================

CREATE OR REPLACE VIEW v_sales_emp AS
SELECT e.employee_id,
       e.first_name,
       d.department_name
FROM hr.employees e
JOIN hr.departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Sales';



-- =========================================================
-- M9
-- Replace view definition
-- =========================================================

CREATE OR REPLACE VIEW v_replace AS
SELECT employee_id,
       first_name
FROM hr.employees;



-- =========================================================
-- M10
-- View with full_name column
-- =========================================================

CREATE OR REPLACE VIEW v_fullname AS
SELECT employee_id,
       first_name || ' ' || last_name AS full_name,
       department_id
FROM hr.employees;



-- =========================================================
-- M11
-- Drop a view
-- =========================================================

DROP VIEW v_replace;



-- =========================================================
-- M12
-- Create departments view
-- =========================================================

CREATE OR REPLACE VIEW v_departments AS
SELECT *
FROM hr.departments;



-- =========================================================
-- M13
-- Create view salary > 5000
-- =========================================================

CREATE OR REPLACE VIEW v_sal5000 AS
SELECT *
FROM hr.employees
WHERE salary > 5000;



-- =========================================================
-- M14
-- View with total salary
-- =========================================================

CREATE OR REPLACE VIEW v_dept_salary AS
SELECT d.department_id,
       d.department_name,
       SUM(e.salary) AS total_salary
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id,
         d.department_name;



-- =========================================================
-- M15
-- View with alias column names
-- =========================================================

CREATE OR REPLACE VIEW v_alias AS
SELECT employee_id AS id,
       first_name AS fname,
       last_name AS lname
FROM hr.employees;



-- =========================================================
-- M16
-- AVG salary per job
-- =========================================================

CREATE OR REPLACE VIEW v_job_avg AS
SELECT job_id,
       AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY job_id;



-- =========================================================
-- M17
-- WITH CHECK OPTION salary > 0
-- =========================================================

CREATE OR REPLACE VIEW v_sal_positive AS
SELECT *
FROM hr.employees
WHERE salary > 0
WITH CHECK OPTION;



-- =========================================================
-- M18
-- View employee + department + salary
-- =========================================================

CREATE OR REPLACE VIEW v_emp_salary AS
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name,
       e.salary
FROM hr.employees e
JOIN hr.departments d
ON e.department_id = d.department_id;



-- =========================================================
-- M19
-- List views in schema
-- =========================================================

SELECT view_name
FROM user_views;



-- =========================================================
-- M20
-- View employees with commission
-- =========================================================

CREATE OR REPLACE VIEW v_commission AS
SELECT *
FROM hr.employees
WHERE commission_pct IS NOT NULL;



-- =========================================================
-- HARD QUESTIONS
-- =========================================================



-- =========================================================
-- H1
-- Department totals view
-- =========================================================

CREATE OR REPLACE VIEW v_h1 AS
SELECT d.department_id,
       d.department_name,
       COUNT(e.employee_id) AS employee_count,
       SUM(e.salary) AS total_salary
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id,
         d.department_name;



-- =========================================================
-- H2
-- Updatable view WITH CHECK OPTION
-- =========================================================

CREATE OR REPLACE VIEW v_h2 AS
SELECT employee_id,
       first_name,
       department_id
FROM hr.employees
WHERE department_id = 50
WITH CHECK OPTION;



-- =========================================================
-- H3
-- Top 5 highest-paid employees
-- =========================================================

CREATE OR REPLACE VIEW v_top5_salary AS
SELECT *
FROM
(
    SELECT *
    FROM hr.employees
    ORDER BY salary DESC
)
WHERE ROWNUM <= 5;



-- =========================================================
-- H4
-- View with ROWID
-- =========================================================

CREATE OR REPLACE VIEW v_rowid AS
SELECT ROWID,
       employee_id,
       first_name
FROM hr.employees;



-- =========================================================
-- H5
-- Employee + manager name view
-- =========================================================

CREATE OR REPLACE VIEW v_manager AS
SELECT e.employee_id,
       e.manager_id,
       m.first_name || ' ' || m.last_name AS manager_name
FROM hr.employees e
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id;



-- =========================================================
-- H6
-- DISTINCT job_id view
-- =========================================================

CREATE OR REPLACE VIEW v_jobs AS
SELECT DISTINCT job_id
FROM hr.employees;



-- =========================================================
-- H7
-- Join employees, departments and inline view
-- =========================================================

CREATE OR REPLACE VIEW v_h7 AS
SELECT e.employee_id,
       d.department_name,
       sub.emp_count
FROM hr.employees e
JOIN hr.departments d
ON e.department_id = d.department_id
JOIN
(
    SELECT department_id,
           COUNT(*) AS emp_count
    FROM hr.employees
    GROUP BY department_id
) sub
ON e.department_id = sub.department_id;



-- =========================================================
-- H8
-- View with CASE
-- =========================================================

CREATE OR REPLACE VIEW v_salary_band AS
SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary < 5000 THEN 'LOW'
           WHEN salary BETWEEN 5000 AND 10000 THEN 'MEDIUM'
           ELSE 'HIGH'
       END AS salary_band
FROM hr.employees;



-- =========================================================
-- H9
-- WITH CHECK OPTION department IN (10,20,30)
-- =========================================================

CREATE OR REPLACE VIEW v_dept_10_20_30 AS
SELECT *
FROM hr.employees
WHERE department_id IN (10,20,30)
WITH CHECK OPTION;



-- =========================================================
-- H10
-- Read-only non-sensitive view
-- =========================================================

CREATE OR REPLACE VIEW v_safe_emp AS
SELECT employee_id,
       first_name,
       last_name,
       department_id,
       hire_date,
       job_id
FROM hr.employees
WITH READ ONLY;



-- =========================================================
-- H11
-- Replace view to add column
-- =========================================================

CREATE OR REPLACE VIEW v_replace_col AS
SELECT employee_id,
       first_name,
       salary
FROM hr.employees;



-- =========================================================
-- H12
-- LISTAGG employee names by department
-- =========================================================

CREATE OR REPLACE VIEW v_listagg AS
SELECT d.department_name,
       LISTAGG(e.last_name, ', ')
       WITHIN GROUP (ORDER BY e.last_name) AS emp_names
FROM hr.employees e
JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;



-- =========================================================
-- H13
-- Scalar subquery in view
-- =========================================================

CREATE OR REPLACE VIEW v_scalar_sub AS
SELECT e.employee_id,
       (
           SELECT d.department_name
           FROM hr.departments d
           WHERE d.department_id = e.department_id
       ) AS department_name
FROM hr.employees e;



-- =========================================================
-- H14
-- Rank employees by salary in department
-- =========================================================

CREATE OR REPLACE VIEW v_rank_salary AS
SELECT e.employee_id,
       e.department_id,
       e.salary,
       RANK() OVER
       (
           PARTITION BY e.department_id
           ORDER BY e.salary DESC
       ) AS sal_rank
FROM hr.employees e;



-- =========================================================
-- H15
-- Grant SELECT on view
-- =========================================================

GRANT SELECT
ON v_emp_dept
TO PUBLIC;



-- =========================================================
-- H16
-- View with HAVING
-- =========================================================

CREATE OR REPLACE VIEW v_having AS
SELECT department_id,
       COUNT(*) AS emp_count
FROM hr.employees
GROUP BY department_id
HAVING COUNT(*) > 5;



-- =========================================================
-- H17
-- Employees above department average
-- =========================================================

CREATE OR REPLACE VIEW v_above_avg AS
SELECT e.employee_id,
       e.first_name,
       e.salary,
       e.department_id
FROM hr.employees e
JOIN
(
    SELECT department_id,
           AVG(salary) AS avg_salary
    FROM hr.employees
    GROUP BY department_id
) sub
ON e.department_id = sub.department_id
WHERE e.salary > sub.avg_salary;



-- =========================================================
-- H18
-- View with UNION
-- =========================================================

CREATE OR REPLACE VIEW v_union AS
SELECT employee_id,
       first_name
FROM hr.employees
WHERE department_id = 50

UNION

SELECT employee_id,
       first_name
FROM hr.employees
WHERE department_id = 80;



-- =========================================================
-- H19
-- View referencing another view
-- =========================================================

CREATE OR REPLACE VIEW v_from_view AS
SELECT *
FROM v_emp_dept
WHERE department_name = 'Sales';



-- =========================================================
-- H20
-- View with ORDER BY
-- =========================================================

CREATE OR REPLACE VIEW v_order_salary AS
SELECT *
FROM hr.employees
ORDER BY salary DESC;
