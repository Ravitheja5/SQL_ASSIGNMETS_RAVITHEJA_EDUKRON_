-- =========================================================
-- DAY 15 ASSIGNMENT: WINDOW FUNCTIONS – VALUE AND FRAME
-- =========================================================



-- =========================================================
-- Part 1: Practice Questions (With Answers and Explanations)
-- =========================================================



-- =========================================================
-- Question 1
-- Show running total of salary ordered by hire_date
-- =========================================================

SELECT employee_id,
       hire_date,
       salary,
       SUM(salary) OVER
       (
           ORDER BY hire_date
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND CURRENT ROW
       ) AS running_total_salary
FROM hr.employees;



-- =========================================================
-- Question 2
-- Show previous employee salary within same department
-- =========================================================

SELECT employee_id,
       department_id,
       salary,
       LAG(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY employee_id
       ) AS prev_salary_in_dept
FROM hr.employees;



-- =========================================================
-- Question 3
-- Show moving 3-row average salary within department
-- =========================================================

SELECT employee_id,
       department_id,
       salary,
       AVG(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY employee_id
           ROWS BETWEEN 2 PRECEDING
           AND CURRENT ROW
       ) AS moving_avg_3
FROM hr.employees;



-- =========================================================
-- Part 2: Self-Practice
-- =========================================================



-- =========================================================
-- 1. Show next employee hire date within department
-- =========================================================

SELECT employee_id,
       department_id,
       hire_date,
       LEAD(hire_date) OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date
       ) AS next_hire_date
FROM hr.employees;



-- =========================================================
-- 2. Show cumulative salary per department
-- =========================================================

SELECT employee_id,
       department_id,
       hire_date,
       salary,
       SUM(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND CURRENT ROW
       ) AS running_salary
FROM hr.employees;



-- =========================================================
-- Part 3: Additional Practice — 20 Medium Questions
-- =========================================================



-- M1
-- Previous salary in department

SELECT employee_id,
       department_id,
       salary,
       LAG(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY employee_id
       ) AS prev_salary
FROM hr.employees;



-- M2
-- Next salary in department

SELECT employee_id,
       department_id,
       salary,
       LEAD(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY employee_id
       ) AS next_salary
FROM hr.employees;



-- M3
-- Running total salary by hire_date

SELECT employee_id,
       hire_date,
       salary,
       SUM(salary) OVER
       (
           ORDER BY hire_date
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND CURRENT ROW
       ) AS running_total
FROM hr.employees;



-- M4
-- Department average salary

SELECT employee_id,
       department_id,
       salary,
       AVG(salary) OVER
       (
           PARTITION BY department_id
       ) AS dept_avg
FROM hr.employees;



-- M5
-- Previous hire date in department

SELECT employee_id,
       department_id,
       hire_date,
       LAG(hire_date) OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date
       ) AS prev_hire_date
FROM hr.employees;



-- M6
-- Running total salary per department

SELECT employee_id,
       department_id,
       hire_date,
       salary,
       SUM(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND CURRENT ROW
       ) AS running_total
FROM hr.employees;



-- M7
-- Next hire date in department

SELECT employee_id,
       department_id,
       hire_date,
       LEAD(hire_date) OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date
       ) AS next_hire_date
FROM hr.employees;



-- M8
-- Moving 3-row average salary

SELECT employee_id,
       department_id,
       salary,
       AVG(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY employee_id
           ROWS BETWEEN 2 PRECEDING
           AND CURRENT ROW
       ) AS moving_avg
FROM hr.employees;



-- M9
-- Minimum salary in department using FIRST_VALUE

SELECT employee_id,
       department_id,
       salary,
       FIRST_VALUE(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY salary
       ) AS min_salary
FROM hr.employees;



-- M10
-- Maximum salary in department using LAST_VALUE

SELECT employee_id,
       department_id,
       salary,
       LAST_VALUE(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY salary
           RANGE BETWEEN UNBOUNDED PRECEDING
           AND UNBOUNDED FOLLOWING
       ) AS max_salary
FROM hr.employees;



-- M11
-- Salary from 2 rows back

SELECT employee_id,
       salary,
       LAG(salary, 2, 0) OVER
       (
           ORDER BY employee_id
       ) AS lag_salary
FROM hr.employees;



-- M12
-- Running total salary per job

SELECT employee_id,
       job_id,
       hire_date,
       salary,
       SUM(salary) OVER
       (
           PARTITION BY job_id
           ORDER BY hire_date
       ) AS running_total
FROM hr.employees;



-- M13
-- Next commission_pct in department

SELECT employee_id,
       department_id,
       commission_pct,
       LEAD(commission_pct) OVER
       (
           PARTITION BY department_id
           ORDER BY employee_id
       ) AS next_commission
FROM hr.employees;



-- M14
-- Moving 5-row average salary

SELECT employee_id,
       hire_date,
       salary,
       AVG(salary) OVER
       (
           ORDER BY hire_date
           ROWS BETWEEN 4 PRECEDING
           AND CURRENT ROW
       ) AS moving_avg_5
FROM hr.employees;



-- M15
-- Previous employee first_name in department

SELECT employee_id,
       department_id,
       first_name,
       LAG(first_name) OVER
       (
           PARTITION BY department_id
           ORDER BY employee_id
       ) AS prev_name
FROM hr.employees;



-- M16
-- Total company salary

SELECT employee_id,
       salary,
       SUM(salary) OVER () AS total_company_salary
FROM hr.employees;



-- M17
-- Earliest hire date in department

SELECT employee_id,
       department_id,
       hire_date,
       FIRST_VALUE(hire_date) OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date
       ) AS earliest_hire
FROM hr.employees;



-- M18
-- Latest hire date in department

SELECT employee_id,
       department_id,
       hire_date,
       LAST_VALUE(hire_date) OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date
           RANGE BETWEEN UNBOUNDED PRECEDING
           AND UNBOUNDED FOLLOWING
       ) AS latest_hire
FROM hr.employees;



-- M19
-- Previous salary ordered by descending salary

SELECT employee_id,
       salary,
       LAG(salary) OVER
       (
           ORDER BY salary DESC
       ) AS prev_salary
FROM hr.employees;



-- M20
-- Employee count per department

SELECT employee_id,
       department_id,
       COUNT(*) OVER
       (
           PARTITION BY department_id
       ) AS dept_count
FROM hr.employees;



-- =========================================================
-- HARD QUESTIONS
-- =========================================================



-- H1
-- Running salary total and running employee count

SELECT employee_id,
       hire_date,
       salary,
       SUM(salary) OVER
       (
           ORDER BY hire_date
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND CURRENT ROW
       ) AS running_total,
       COUNT(*) OVER
       (
           ORDER BY hire_date
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND CURRENT ROW
       ) AS running_count
FROM hr.employees;



-- H2
-- Salary difference from previous employee in department

SELECT employee_id,
       department_id,
       salary,
       LAG(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY employee_id
       ) AS prev_salary,
       salary -
       LAG(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY employee_id
       ) AS diff_from_prev
FROM hr.employees;



-- H3
-- Moving average with 5-row frame

SELECT employee_id,
       department_id,
       salary,
       AVG(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY employee_id
           ROWS BETWEEN 2 PRECEDING
           AND 2 FOLLOWING
       ) AS moving_avg
FROM hr.employees;



-- H4
-- First and last salary in department

SELECT employee_id,
       department_id,
       salary,
       FIRST_VALUE(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY salary
       ) AS min_salary,
       LAST_VALUE(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY salary
           RANGE BETWEEN UNBOUNDED PRECEDING
           AND UNBOUNDED FOLLOWING
       ) AS max_salary
FROM hr.employees;



-- H5
-- Days between employee hires in department

SELECT employee_id,
       department_id,
       hire_date,
       LEAD(hire_date) OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date
       ) AS next_hire,
       LEAD(hire_date) OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date
       ) - hire_date AS days_between
FROM hr.employees;



-- H6
-- Running salary total and row number per department

SELECT employee_id,
       department_id,
       hire_date,
       salary,
       SUM(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date
       ) AS running_total,
       ROW_NUMBER() OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date
       ) AS rn
FROM hr.employees;



-- H7
-- Previous salary or self salary if first row

SELECT employee_id,
       department_id,
       salary,
       LAG(salary,1,salary) OVER
       (
           PARTITION BY department_id
           ORDER BY employee_id
       ) AS prev_salary
FROM hr.employees;



-- H8
-- Percent of department total salary

SELECT employee_id,
       department_id,
       salary,
       salary * 100 /
       SUM(salary) OVER
       (
           PARTITION BY department_id
       ) AS dept_percent
FROM hr.employees;



-- H9
-- Running salary and cumulative percentage

SELECT employee_id,
       department_id,
       hire_date,
       salary,
       SUM(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND CURRENT ROW
       ) AS running_total,
       (
           SUM(salary) OVER
           (
               PARTITION BY department_id
               ORDER BY hire_date
               ROWS BETWEEN UNBOUNDED PRECEDING
               AND CURRENT ROW
           )
           /
           SUM(salary) OVER
           (
               PARTITION BY department_id
           )
       ) * 100 AS cumulative_percent
FROM hr.employees;



-- H10
-- Salary of employee 2 positions below in same job

SELECT employee_id,
       job_id,
       salary,
       LEAD(salary,2) OVER
       (
           PARTITION BY job_id
           ORDER BY salary DESC
       ) AS lead_salary
FROM hr.employees;



-- H11
-- Highest paid employee name in department

SELECT employee_id,
       department_id,
       first_name,
       salary,
       FIRST_VALUE(first_name) OVER
       (
           PARTITION BY department_id
           ORDER BY salary DESC
       ) AS top_earner
FROM hr.employees;



-- H12
-- Moving middle value using NTH_VALUE

SELECT employee_id,
       department_id,
       salary,
       NTH_VALUE(salary,2) OVER
       (
           PARTITION BY department_id
           ORDER BY salary
           ROWS BETWEEN 1 PRECEDING
           AND 1 FOLLOWING
       ) AS middle_salary
FROM hr.employees;



-- H13
-- Running salary total resetting by department

SELECT employee_id,
       department_id,
       salary,
       SUM(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY employee_id
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND CURRENT ROW
       ) AS running_total
FROM hr.employees;



-- H14
-- Previous and next salary in department

SELECT employee_id,
       department_id,
       salary,
       LAG(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY employee_id
       ) AS prev_salary,
       LEAD(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY employee_id
       ) AS next_salary
FROM hr.employees;



-- H15
-- Last hired employee_id in department

SELECT employee_id,
       department_id,
       hire_date,
       LAST_VALUE(employee_id) OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date
           RANGE BETWEEN UNBOUNDED PRECEDING
           AND UNBOUNDED FOLLOWING
       ) AS last_hired_emp
FROM hr.employees;



-- H16
-- Running average salary by hire_date

SELECT employee_id,
       hire_date,
       salary,
       AVG(salary) OVER
       (
           ORDER BY hire_date
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND CURRENT ROW
       ) AS running_avg
FROM hr.employees;



-- H17
-- Difference from department average

SELECT employee_id,
       department_id,
       salary,
       salary -
       AVG(salary) OVER
       (
           PARTITION BY department_id
       ) AS diff_from_avg
FROM hr.employees;



-- H18
-- Salary difference from previous hire in department

SELECT employee_id,
       department_id,
       hire_date,
       salary,
       LAG(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date
       ) AS prev_salary,
       salary -
       LAG(salary) OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date
       ) AS salary_diff
FROM hr.employees;



-- H19
-- Running employee count per department

SELECT employee_id,
       department_id,
       hire_date,
       COUNT(*) OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND CURRENT ROW
       ) AS running_count
FROM hr.employees;



-- H20
-- First and last salary per job

SELECT employee_id,
       job_id,
       salary,
       FIRST_VALUE(salary) OVER
       (
           PARTITION BY job_id
           ORDER BY salary
       ) AS min_salary,
       LAST_VALUE(salary) OVER
       (
           PARTITION BY job_id
           ORDER BY salary
           RANGE BETWEEN UNBOUNDED PRECEDING
           AND UNBOUNDED FOLLOWING
       ) AS max_salary
FROM hr.employees;
