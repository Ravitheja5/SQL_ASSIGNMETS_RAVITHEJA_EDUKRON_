-- =========================================================
-- DAY 14 ASSIGNMENT: WINDOW FUNCTIONS – RANKING
-- =========================================================



-- =========================================================
-- Part 1: Practice Questions (With Answers and Explanations)
-- =========================================================



-- =========================================================
-- Question 1
-- Rank employees by salary within each department.
-- =========================================================

SELECT employee_id,
       first_name,
       department_id,
       salary,
       RANK() OVER
       (
           PARTITION BY department_id
           ORDER BY salary DESC
       ) AS salary_rank
FROM hr.employees;



-- =========================================================
-- Question 2
-- Get top earner per department.
-- =========================================================

SELECT employee_id,
       first_name,
       department_id,
       salary
FROM
(
    SELECT employee_id,
           first_name,
           department_id,
           salary,
           ROW_NUMBER() OVER
           (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS rn
    FROM hr.employees
)
WHERE rn = 1;



-- =========================================================
-- Question 3
-- Assign DENSE_RANK by hire_date within each job_id.
-- =========================================================

SELECT job_id,
       employee_id,
       hire_date,
       DENSE_RANK() OVER
       (
           PARTITION BY job_id
           ORDER BY hire_date
       ) AS hire_rank
FROM hr.employees;



-- =========================================================
-- Part 2: Self-Practice
-- =========================================================



-- =========================================================
-- 1. Assign employees into salary quartiles.
-- =========================================================

SELECT employee_id,
       salary,
       NTILE(4) OVER
       (
           ORDER BY salary
       ) AS quartile
FROM hr.employees;



-- =========================================================
-- 2. Rank employees by commission_pct with NULLS LAST.
-- =========================================================

SELECT employee_id,
       commission_pct,
       RANK() OVER
       (
           ORDER BY commission_pct DESC NULLS LAST
       ) AS commission_rank
FROM hr.employees;



-- =========================================================
-- Part 3: Additional Practice — 20 Medium Questions
-- =========================================================



-- M1
-- ROW_NUMBER by salary descending

SELECT employee_id,
       salary,
       ROW_NUMBER() OVER
       (
           ORDER BY salary DESC
       ) AS rn
FROM hr.employees;



-- M2
-- Rank salary within department

SELECT employee_id,
       department_id,
       salary,
       RANK() OVER
       (
           PARTITION BY department_id
           ORDER BY salary DESC
       ) AS salary_rank
FROM hr.employees;



-- M3
-- Dense rank by hire_date

SELECT employee_id,
       hire_date,
       DENSE_RANK() OVER
       (
           ORDER BY hire_date
       ) AS hire_rank
FROM hr.employees;



-- M4
-- Salary quartiles

SELECT employee_id,
       salary,
       NTILE(4) OVER
       (
           ORDER BY salary
       ) AS quartile
FROM hr.employees;



-- M5
-- Top employee per department

SELECT *
FROM
(
    SELECT employee_id,
           first_name,
           department_id,
           salary,
           ROW_NUMBER() OVER
           (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS rn
    FROM hr.employees
)
WHERE rn = 1;



-- M6
-- Rank salary with NULLS LAST

SELECT employee_id,
       salary,
       RANK() OVER
       (
           ORDER BY salary DESC NULLS LAST
       ) AS salary_rank
FROM hr.employees;



-- M7
-- Row number by hire_date within job

SELECT employee_id,
       job_id,
       hire_date,
       ROW_NUMBER() OVER
       (
           PARTITION BY job_id
           ORDER BY hire_date
       ) AS rn
FROM hr.employees;



-- M8
-- Dense rank salary within department

SELECT employee_id,
       department_id,
       salary,
       DENSE_RANK() OVER
       (
           PARTITION BY department_id
           ORDER BY salary
       ) AS dense_rank_sal
FROM hr.employees;



-- M9
-- Salary quintiles

SELECT employee_id,
       salary,
       NTILE(5) OVER
       (
           ORDER BY salary
       ) AS quintile
FROM hr.employees;



-- M10
-- Rank hire_date descending within department

SELECT employee_id,
       department_id,
       hire_date,
       RANK() OVER
       (
           PARTITION BY department_id
           ORDER BY hire_date DESC
       ) AS hire_rank
FROM hr.employees;



-- M11
-- Row number by employee_id

SELECT employee_id,
       salary,
       ROW_NUMBER() OVER
       (
           ORDER BY employee_id
       ) AS rn
FROM hr.employees;



-- M12
-- Dense rank by commission_pct

SELECT employee_id,
       commission_pct,
       DENSE_RANK() OVER
       (
           ORDER BY commission_pct DESC NULLS LAST
       ) AS commission_rank
FROM hr.employees;



-- M13
-- Row number within department and job

SELECT employee_id,
       department_id,
       job_id,
       salary,
       ROW_NUMBER() OVER
       (
           PARTITION BY department_id,
                        job_id
           ORDER BY salary DESC
       ) AS rn
FROM hr.employees;



-- M14
-- Salary deciles

SELECT employee_id,
       salary,
       NTILE(10) OVER
       (
           ORDER BY salary
       ) AS decile
FROM hr.employees;



-- M15
-- Rank salary ascending

SELECT employee_id,
       salary,
       RANK() OVER
       (
           ORDER BY salary ASC
       ) AS salary_rank
FROM hr.employees;



-- M16
-- Top 3 salaries per job

SELECT *
FROM
(
    SELECT employee_id,
           first_name,
           job_id,
           salary,
           ROW_NUMBER() OVER
           (
               PARTITION BY job_id
               ORDER BY salary DESC
           ) AS rn
    FROM hr.employees
)
WHERE rn <= 3;



-- M17
-- Dense rank by hire_date per job

SELECT employee_id,
       job_id,
       hire_date,
       DENSE_RANK() OVER
       (
           PARTITION BY job_id
           ORDER BY hire_date
       ) AS hire_rank
FROM hr.employees;



-- M18
-- Highest salary per department using rank

SELECT *
FROM
(
    SELECT employee_id,
           department_id,
           salary,
           RANK() OVER
           (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS salary_rank
    FROM hr.employees
)
WHERE salary_rank = 1;



-- M19
-- Salary tertiles within department

SELECT employee_id,
       department_id,
       salary,
       NTILE(3) OVER
       (
           PARTITION BY department_id
           ORDER BY salary
       ) AS tertile
FROM hr.employees;



-- M20
-- Rank direct reports by salary

SELECT employee_id,
       manager_id,
       salary,
       ROW_NUMBER() OVER
       (
           PARTITION BY manager_id
           ORDER BY salary DESC
       ) AS rn
FROM hr.employees;



-- =========================================================
-- HARD QUESTIONS
-- =========================================================



-- H1
-- Top 2 earners per department

SELECT *
FROM
(
    SELECT employee_id,
           department_id,
           salary,
           ROW_NUMBER() OVER
           (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS rn
    FROM hr.employees
)
WHERE rn <= 2;



-- H2
-- Top 3 salaries per department using rank

SELECT *
FROM
(
    SELECT employee_id,
           department_id,
           salary,
           RANK() OVER
           (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS salary_rank
    FROM hr.employees
)
WHERE salary_rank <= 3;



-- H3
-- Dense rank salary and employee count per job

SELECT employee_id,
       job_id,
       salary,
       DENSE_RANK() OVER
       (
           PARTITION BY job_id
           ORDER BY salary DESC
       ) AS salary_rank,
       COUNT(*) OVER
       (
           PARTITION BY job_id
       ) AS emp_count
FROM hr.employees;



-- H4
-- Quartile salary ranges

SELECT quartile,
       MIN(salary) AS min_salary,
       MAX(salary) AS max_salary
FROM
(
    SELECT salary,
           NTILE(4) OVER
           (
               ORDER BY salary
           ) AS quartile
    FROM hr.employees
)
GROUP BY quartile;



-- H5
-- First hired employee per department

SELECT *
FROM
(
    SELECT employee_id,
           department_id,
           hire_date,
           ROW_NUMBER() OVER
           (
               PARTITION BY department_id
               ORDER BY hire_date
           ) AS rn
    FROM hr.employees
)
WHERE rn = 1;



-- H6
-- Employees with rank 1 or 2 salary per department

SELECT *
FROM
(
    SELECT employee_id,
           department_id,
           salary,
           RANK() OVER
           (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS salary_rank
    FROM hr.employees
)
WHERE salary_rank IN (1,2);



-- H7
-- Rank by salary and hire_date within job

SELECT employee_id,
       job_id,
       salary,
       hire_date,
       RANK() OVER
       (
           PARTITION BY job_id
           ORDER BY salary DESC
       ) AS salary_rank,
       RANK() OVER
       (
           PARTITION BY job_id
           ORDER BY hire_date
       ) AS hire_rank
FROM hr.employees;



-- H8
-- Quartiles within department

SELECT employee_id,
       department_id,
       salary,
       NTILE(4) OVER
       (
           PARTITION BY department_id
           ORDER BY salary
       ) AS quartile
FROM hr.employees;



-- H9
-- 5th highest salary using dense rank

SELECT *
FROM
(
    SELECT employee_id,
           salary,
           DENSE_RANK() OVER
           (
               ORDER BY salary DESC
           ) AS dr
    FROM hr.employees
)
WHERE dr = 5;



-- H10
-- Row number with tie breaker

SELECT employee_id,
       department_id,
       salary,
       ROW_NUMBER() OVER
       (
           PARTITION BY department_id
           ORDER BY salary DESC,
                    employee_id
       ) AS rn
FROM hr.employees;



-- H11
-- Earliest hired employee per department

SELECT *
FROM
(
    SELECT employee_id,
           department_id,
           hire_date,
           ROW_NUMBER() OVER
           (
               PARTITION BY department_id
               ORDER BY hire_date
           ) AS rn
    FROM hr.employees
)
WHERE rn = 1;



-- H12
-- Lowest salary per job

SELECT *
FROM
(
    SELECT employee_id,
           job_id,
           salary,
           RANK() OVER
           (
               PARTITION BY job_id
               ORDER BY salary
           ) AS salary_rank
    FROM hr.employees
)
WHERE salary_rank = 1;



-- H13
-- Median split per department

SELECT employee_id,
       department_id,
       salary,
       NTILE(2) OVER
       (
           PARTITION BY department_id
           ORDER BY salary
       ) AS split_group
FROM hr.employees;



-- H14
-- Most recently hired employee per department

SELECT *
FROM
(
    SELECT employee_id,
           department_id,
           hire_date,
           DENSE_RANK() OVER
           (
               PARTITION BY department_id
               ORDER BY hire_date DESC
           ) AS hire_rank
    FROM hr.employees
)
WHERE hire_rank = 1;



-- H15
-- Employees ranked 5 to 10 by salary

SELECT *
FROM
(
    SELECT employee_id,
           salary,
           ROW_NUMBER() OVER
           (
               ORDER BY salary DESC
           ) AS rn
    FROM hr.employees
)
WHERE rn BETWEEN 5 AND 10;



-- H16
-- Rank employees only in departments with at least 3 employees

SELECT employee_id,
       department_id,
       salary,
       RANK() OVER
       (
           PARTITION BY department_id
           ORDER BY salary DESC
       ) AS salary_rank
FROM hr.employees
WHERE department_id IN
(
    SELECT department_id
    FROM hr.employees
    GROUP BY department_id
    HAVING COUNT(*) >= 3
);



-- H17
-- Quartiles and company average salary

SELECT employee_id,
       salary,
       NTILE(4) OVER
       (
           ORDER BY salary
       ) AS quartile,
       ROUND(AVG(salary) OVER (),2) AS company_avg
FROM hr.employees;



-- H18
-- Rank direct reports per manager

SELECT employee_id,
       manager_id,
       salary,
       RANK() OVER
       (
           PARTITION BY manager_id
           ORDER BY salary DESC
       ) AS report_rank
FROM hr.employees;



-- H19
-- Top 3 jobs by total salary

SELECT *
FROM
(
    SELECT job_id,
           SUM(salary) AS total_salary,
           RANK() OVER
           (
               ORDER BY SUM(salary) DESC
           ) AS salary_rank
    FROM hr.employees
    GROUP BY job_id
)
WHERE salary_rank <= 3;



-- H20
-- Dense rank salary with department name

SELECT e.employee_id,
       e.department_id,
       (
           SELECT department_name
           FROM hr.departments d
           WHERE d.department_id = e.department_id
       ) AS department_name,
       e.salary,
       DENSE_RANK() OVER
       (
           PARTITION BY e.department_id
           ORDER BY e.salary DESC
       ) AS salary_rank
FROM hr.employees e;
