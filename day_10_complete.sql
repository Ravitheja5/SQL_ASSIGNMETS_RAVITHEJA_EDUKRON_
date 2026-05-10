/* =========================================================
Day 10 Assignment: HAVING & Advanced Aggregation

All exercises use hr.employees and hr.departments only.
========================================================= */


/* M1. List department_id where average salary > 8000.
Hint: HAVING AVG(salary) > 8000; */

SELECT department_id,
AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) > 8000;



/* M2. Show job_id that have more than 3 employees.
Hint: HAVING COUNT(*) > 3; */

SELECT job_id,
COUNT(*) AS emp_count
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) > 3;



/* M3. List department_name and total salary per department.
Hint: Join and GROUP BY. */

SELECT d.department_name,
SUM(e.salary) AS total_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;



/* M4. List department_id where total salary > 150000.
Hint: HAVING SUM(salary) > 150000; */

SELECT department_id,
SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
HAVING SUM(salary) > 150000;



/* M5. Show job_id where min(salary) < 4000.
Hint: HAVING MIN(salary) < 4000; */

SELECT job_id,
MIN(salary) AS min_salary
FROM hr.employees
GROUP BY job_id
HAVING MIN(salary) < 4000;



/* M6. List department_id and employee count with more than 5 employees.
Hint: HAVING COUNT(*) > 5; */

SELECT department_id,
COUNT(*) AS emp_count
FROM hr.employees
GROUP BY department_id
HAVING COUNT(*) > 5;



/* M7. Show department_name and average salary per department.
Hint: AVG(e.salary). */

SELECT d.department_name,
AVG(e.salary) AS avg_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;



/* M8. Show total salary for jobs with more than 2 employees.
Hint: HAVING COUNT(*) > 2; */

SELECT job_id,
SUM(salary) AS total_salary
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) > 2;



/* M9. Show department_id where max salary > 12000.
Hint: HAVING MAX(salary) > 12000; */

SELECT department_id,
MAX(salary) AS max_salary
FROM hr.employees
GROUP BY department_id
HAVING MAX(salary) > 12000;



/* M10. Show department_name and employee count with at least 3 employees.
Hint: HAVING COUNT(e.employee_id) >= 3; */

SELECT d.department_name,
COUNT(e.employee_id) AS emp_count
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) >= 3;



/* M11. Show avg salary for jobs with total salary > 50000.
Hint: HAVING SUM(salary) > 50000; */

SELECT job_id,
AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY job_id
HAVING SUM(salary) > 50000;



/* M12. List department_id where avg salary between 6000 and 10000.
Hint: HAVING AVG(salary) BETWEEN 6000 AND 10000; */

SELECT department_id,
AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) BETWEEN 6000 AND 10000;



/* M13. Show department_name with min and max salary.
Hint: MIN and MAX salary. */

SELECT d.department_name,
MIN(e.salary) AS min_salary,
MAX(e.salary) AS max_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;



/* M14. Show jobs with exactly 2 employees.
Hint: HAVING COUNT(*) = 2; */

SELECT job_id,
COUNT(*) AS emp_count
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) = 2;



/* M15. Show department_id and sum salary where avg salary < 7000.
Hint: HAVING AVG(salary) < 7000; */

SELECT department_id,
SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) < 7000;



/* M16. Show department_name and total salary with more than 10 employees.
Hint: HAVING COUNT(*) > 10; */

SELECT d.department_name,
SUM(e.salary) AS total_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) > 10;



/* M17. Show SA jobs and employee count.
Hint: WHERE job_id LIKE 'SA%'. */

SELECT job_id,
COUNT(*) AS emp_count
FROM hr.employees
WHERE job_id LIKE 'SA%'
GROUP BY job_id;



/* M18. List department_id where min hire_date after 2005-01-01.
Hint: HAVING MIN(hire_date) > DATE '2005-01-01'; */

SELECT department_id,
MIN(hire_date) AS min_hire_date
FROM hr.employees
GROUP BY department_id
HAVING MIN(hire_date) > DATE '2005-01-01';



/* M19. Show department_name and employee count with total salary > 200000.
Hint: HAVING SUM(e.salary) > 200000; */

SELECT d.department_name,
COUNT(e.employee_id) AS emp_count
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING SUM(e.salary) > 200000;



/* M20. Show avg salary by job ordered desc.
Hint: ORDER BY AVG(salary) DESC; */

SELECT job_id,
AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) >= 1
ORDER BY AVG(salary) DESC;



/* H1. Show department_id, job_id, count and sum using ROLLUP.
Hint: GROUP BY ROLLUP(department_id, job_id); */

SELECT department_id,
job_id,
COUNT(*) AS emp_count,
SUM(salary) AS total_salary
FROM hr.employees
GROUP BY ROLLUP(department_id, job_id);



/* H2. Show department_name and total salary where avg salary >8000 and count >3.
Hint: HAVING AVG(e.salary) > 8000 AND COUNT(*) > 3; */

SELECT d.department_name,
SUM(e.salary) AS total_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING AVG(e.salary) > 8000
AND COUNT(*) > 3;



/* H3. Show employee count by job for departments 50,60,80.
Hint: WHERE department_id IN (50,60,80). */

SELECT job_id,
COUNT(*) AS emp_count
FROM hr.employees
WHERE department_id IN (50,60,80)
GROUP BY job_id;



/* H4. Departments with top 3 total salaries.
Hint: HAVING SUM(salary) IN (subquery). */

SELECT department_id,
SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
HAVING SUM(salary) IN (
SELECT SUM(salary)
FROM hr.employees
GROUP BY department_id
ORDER BY SUM(salary) DESC
FETCH FIRST 3 ROWS ONLY
);



/* H5. Show department_name, count and sum salary with commission employees.
Hint: HAVING COUNT(e.commission_pct) > 0; */

SELECT d.department_name,
COUNT(*) AS emp_count,
SUM(e.salary) AS total_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.commission_pct) > 0;



/* H6. Show avg salary for jobs where salary range >5000.
Hint: MAX(salary)-MIN(salary). */

SELECT job_id,
AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY job_id
HAVING MAX(salary) - MIN(salary) > 5000;



/* H7. Show department summary where count >2 and avg >6000.
Hint: HAVING COUNT(*) >2 AND AVG(e.salary)>6000; */

SELECT d.department_id,
d.department_name,
COUNT(*) AS emp_count,
SUM(e.salary) AS total_salary,
AVG(e.salary) AS avg_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) > 2
AND AVG(e.salary) > 6000;



/* H8. Show department_name and employees with salary >5000.
Hint: SUM(CASE WHEN salary>5000 THEN 1 ELSE 0 END). */

SELECT d.department_name,
SUM(
CASE
WHEN e.salary > 5000 THEN 1
ELSE 0
END
) AS high_salary_emp
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;



/* H9. Show jobs with at least 2 employees and total salary >20000.
Hint: HAVING COUNT(*) >=2 AND SUM(salary)>20000; */

SELECT job_id,
SUM(salary) AS total_salary
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) >= 2
AND SUM(salary) > 20000;



/* H10. Departments with at least 3 employees and avg salary <9000.
Hint: HAVING COUNT(*) >=3 AND AVG(salary)<9000; */

SELECT department_id,
AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY department_id
HAVING COUNT(*) >= 3
AND AVG(salary) < 9000;



/* H11. Show rounded avg salary where total salary >100000.
Hint: ROUND(AVG(e.salary),2). */

SELECT d.department_name,
ROUND(AVG(e.salary),2) AS avg_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING SUM(e.salary) > 100000;



/* H12. Show jobs with more than 1 employee and sum salary >30000.
Hint: HAVING COUNT(*) >1 AND SUM(salary)>30000; */

SELECT job_id,
COUNT(*) AS emp_count,
SUM(salary) AS total_salary
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) > 1
AND SUM(salary) > 30000;



/* H13. Show grouping sets for department_id and job_id.
Hint: GROUPING SETS. */

SELECT department_id,
job_id,
COUNT(*) AS emp_count
FROM hr.employees
GROUP BY GROUPING SETS (
(department_id),
(job_id)
);



/* H14. Show department_name and total salary excluding single employee departments.
Hint: HAVING COUNT(*) >1; */

SELECT d.department_name,
SUM(e.salary) AS total_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) > 1;



/* H15. Show departments where min salary >3000 and max salary <15000.
Hint: HAVING MIN(salary)>3000 AND MAX(salary)<15000; */

SELECT department_id,
MIN(salary) AS min_salary,
MAX(salary) AS max_salary
FROM hr.employees
GROUP BY department_id
HAVING MIN(salary) > 3000
AND MAX(salary) < 15000;



/* H16. Show avg salary by job for employees hired after 2000.
Hint: WHERE hire_date > DATE '2000-12-31'. */

SELECT job_id,
AVG(salary) AS avg_salary
FROM hr.employees
WHERE hire_date > DATE '2000-12-31'
GROUP BY job_id;



/* H17. Show department summary where employee count between 2 and 10.
Hint: HAVING COUNT(*) BETWEEN 2 AND 10; */

SELECT d.department_name,
COUNT(*) AS emp_count,
SUM(e.salary) AS total_salary,
AVG(e.salary) AS avg_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) BETWEEN 2 AND 10;



/* H18. Department with highest average salary.
Hint: HAVING AVG(salary) = (subquery). */

SELECT department_id,
AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) = (
SELECT MAX(av)
FROM (
SELECT AVG(salary) av
FROM hr.employees
GROUP BY department_id
)
);



/* H19. Show cube aggregation by department and job.
Hint: GROUP BY CUBE(department_id, job_id); */

SELECT department_id,
job_id,
COUNT(*) AS emp_count
FROM hr.employees
GROUP BY CUBE(department_id, job_id);



/* H20. Show department_name and total salary where at least one SA_REP employee exists.
Hint: HAVING MAX(CASE WHEN e.job_id='SA_REP' THEN 1 ELSE 0 END)=1; */

SELECT d.department_name,
SUM(e.salary) AS total_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING MAX(
CASE
WHEN e.job_id = 'SA_REP' THEN 1
ELSE 0
END
) = 1;
