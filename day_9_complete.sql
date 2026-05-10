/* =========================================================
Day 9 Assignment: Aggregation & GROUP BY

All exercises use hr.employees (and hr.departments if needed).
========================================================= */


/* M1. Show total salary for whole company.
Hint: SELECT SUM(salary) FROM hr.employees; */

SELECT SUM(salary) AS total_salary
FROM hr.employees;



/* M2. Count employees per job_id.
Hint: GROUP BY job_id. */

SELECT job_id,
COUNT(*) AS employee_count
FROM hr.employees
GROUP BY job_id;



/* M3. Show average salary per department_id.
Hint: AVG(salary). */

SELECT department_id,
AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY department_id;



/* M4. Show department_id and min/max salary.
Hint: MIN and MAX. */

SELECT department_id,
MIN(salary) AS min_salary,
MAX(salary) AS max_salary
FROM hr.employees
GROUP BY department_id;



/* M5. Count employees per department_id.
Hint: COUNT(*). */

SELECT department_id,
COUNT(*) AS employee_count
FROM hr.employees
GROUP BY department_id;



/* M6. Show job_id and total salary.
Hint: SUM(salary). */

SELECT job_id,
SUM(salary) AS total_salary
FROM hr.employees
GROUP BY job_id;



/* M7. Count employees with commission_pct.
Hint: COUNT(commission_pct). */

SELECT department_id,
COUNT(commission_pct) AS commission_count
FROM hr.employees
GROUP BY department_id;



/* M8. Show min and max hire_date per job_id.
Hint: MIN(hire_date), MAX(hire_date). */

SELECT job_id,
MIN(hire_date) AS earliest_hire,
MAX(hire_date) AS latest_hire
FROM hr.employees
GROUP BY job_id;



/* M9. Count total employees.
Hint: COUNT(*). */

SELECT COUNT(*) AS total_employees
FROM hr.employees;



/* M10. Show department_id, avg salary and count.
Hint: GROUP BY department_id. */

SELECT department_id,
AVG(salary) AS avg_salary,
COUNT(*) AS employee_count
FROM hr.employees
GROUP BY department_id;



/* M11. Show job_id and average salary ordered desc.
Hint: ORDER BY AVG(salary) DESC. */

SELECT job_id,
AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY job_id
ORDER BY AVG(salary) DESC;



/* M12. Show department salary for 50,60,80.
Hint: WHERE department_id IN (50,60,80). */

SELECT department_id,
SUM(salary) AS total_salary
FROM hr.employees
WHERE department_id IN (50,60,80)
GROUP BY department_id;



/* M13. Count employees per manager_id.
Hint: manager_id IS NOT NULL. */

SELECT manager_id,
COUNT(*) AS employee_count
FROM hr.employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;



/* M14. Show minimum salary per job.
Hint: MIN(salary). */

SELECT job_id,
MIN(salary) AS min_salary
FROM hr.employees
GROUP BY job_id;



/* M15. Show latest hire_date per department.
Hint: MAX(hire_date). */

SELECT department_id,
MAX(hire_date) AS latest_hire
FROM hr.employees
GROUP BY department_id;



/* M16. Show total salary for department 90.
Hint: WHERE department_id = 90. */

SELECT SUM(salary) AS total_salary
FROM hr.employees
WHERE department_id = 90;



/* M17. Count distinct job_id.
Hint: COUNT(DISTINCT job_id). */

SELECT COUNT(DISTINCT job_id) AS total_jobs
FROM hr.employees;



/* M18. Show department_id, job_id and count.
Hint: GROUP BY department_id, job_id. */

SELECT department_id,
job_id,
COUNT(*) AS employee_count
FROM hr.employees
GROUP BY department_id, job_id;



/* M19. Show rounded avg salary per department.
Hint: ROUND(AVG(salary),2). */

SELECT department_id,
ROUND(AVG(salary),2) AS avg_salary
FROM hr.employees
GROUP BY department_id;



/* M20. Show job_ids with at least 2 employees.
Hint: HAVING COUNT(*) >= 2. */

SELECT job_id,
COUNT(*) AS employee_count
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) >= 2;



/* H1. Show department_id, department_name and total salary.
Hint: Join departments and employees. */

SELECT d.department_id,
d.department_name,
SUM(e.salary) AS total_salary
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;



/* H2. Show jobs with more than 3 employees.
Hint: HAVING COUNT(*) > 3. */

SELECT job_id,
AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY job_id
HAVING COUNT(*) > 3;



/* H3. Show employee count and employees hired after 2000.
Hint: SUM(CASE WHEN...). */

SELECT department_id,
COUNT(*) AS total_employees,
SUM(
CASE
WHEN EXTRACT(YEAR FROM hire_date) > 2000
THEN 1
ELSE 0
END
) AS hired_after_2000
FROM hr.employees
GROUP BY department_id;



/* H4. Departments where total salary > 100000.
Hint: HAVING SUM(salary) > 100000. */

SELECT department_id,
SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
HAVING SUM(salary) > 100000;



/* H5. Jobs where salary difference > 5000.
Hint: MAX(salary)-MIN(salary). */

SELECT job_id,
MAX(salary) AS max_salary,
MIN(salary) AS min_salary
FROM hr.employees
GROUP BY job_id
HAVING MAX(salary) - MIN(salary) > 5000;



/* H6. Department employee count ordered desc.
Hint: ORDER BY COUNT(*) DESC. */

SELECT d.department_name,
COUNT(*) AS employee_count
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY COUNT(*) DESC;



/* H7. Show average tenure per department.
Hint: MONTHS_BETWEEN(SYSDATE, hire_date)/12. */

SELECT department_id,
AVG(MONTHS_BETWEEN(SYSDATE, hire_date)/12) AS avg_tenure
FROM hr.employees
GROUP BY department_id;



/* H8. Show MAN jobs and total salary.
Hint: job_id LIKE '%MAN%'. */

SELECT job_id,
SUM(salary) AS total_salary
FROM hr.employees
WHERE job_id LIKE '%MAN%'
GROUP BY job_id;



/* H9. Show departments with avg salary > 7000.
Hint: HAVING AVG(salary) > 7000. */

SELECT department_id,
COUNT(*) AS employee_count,
SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
HAVING AVG(salary) > 7000;



/* H10. Show department_name and min/max salary.
Hint: Join departments. */

SELECT d.department_name,
MIN(e.salary) AS min_salary,
MAX(e.salary) AS max_salary
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;



/* H11. Show managers with more than 2 reports.
Hint: GROUP BY manager_id HAVING COUNT(*) > 2. */

SELECT manager_id,
COUNT(*) AS direct_reports
FROM hr.employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING COUNT(*) > 2;



/* H12. Show distinct jobs per department.
Hint: COUNT(DISTINCT job_id). */

SELECT department_id,
COUNT(DISTINCT job_id) AS distinct_jobs
FROM hr.employees
GROUP BY department_id;



/* H13. Show avg salary for departments 50,80,90.
Hint: WHERE department_id IN (...). */

SELECT job_id,
AVG(salary) AS avg_salary
FROM hr.employees
WHERE department_id IN (50,80,90)
GROUP BY job_id;



/* H14. Departments with employee count >5 and total salary >200000.
Hint: HAVING COUNT(*) >5 AND SUM(salary)>200000. */

SELECT department_id,
COUNT(*) AS employee_count,
SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
HAVING COUNT(*) > 5
AND SUM(salary) > 200000;



/* H15. Departments with commission employees.
Hint: COUNT(commission_pct) > 0. */

SELECT d.department_name,
SUM(e.salary) AS total_salary
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.commission_pct) > 0;



/* H16. Show job count ordered desc.
Hint: ORDER BY COUNT(*) DESC, job_id. */

SELECT job_id,
COUNT(*) AS employee_count
FROM hr.employees
GROUP BY job_id
ORDER BY COUNT(*) DESC, job_id;



/* H17. Show department sum and avg salary.
Hint: ROUND(AVG(salary),2). */

SELECT department_id,
SUM(salary) AS total_salary,
ROUND(AVG(salary),2) AS avg_salary
FROM hr.employees
GROUP BY department_id;



/* H18. Department with maximum total salary.
Hint: Subquery with MAX(total). */

SELECT department_id,
SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
HAVING SUM(salary) = (
SELECT MAX(s)
FROM (
SELECT SUM(salary) s
FROM hr.employees
GROUP BY department_id
)
);



/* H19. Show department/job rollup summary.
Hint: GROUP BY ROLLUP(department_id, job_id). */

SELECT department_id,
job_id,
COUNT(*) AS employee_count,
SUM(salary) AS total_salary
FROM hr.employees
GROUP BY ROLLUP(department_id, job_id);



/* H20. Show department_name and employee count including 0 employees.
Hint: LEFT JOIN departments and employees. */

SELECT d.department_name,
COUNT(e.employee_id) AS employee_count
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;
