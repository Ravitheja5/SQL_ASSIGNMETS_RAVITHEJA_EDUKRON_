/* =========================================================
Day 7 Assignment: Introduction to Joins

All exercises use hr.employees and hr.departments only.
========================================================= */



/* M1. List employee_id, first_name, last_name, and department_name.
Hint: INNER JOIN on department_id. */

SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id;



/* M2. Show employees in department 'IT'.
Hint: Join then WHERE d.department_name = 'IT'. */

SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'IT';



/* M3. Count employees per department and show department_name.
Hint: JOIN and GROUP BY. */

SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;



/* M4. List employee details for department_id 50.
Hint: WHERE department_id = 50. */

SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.department_id = 50;



/* M5. Show employee_id, salary, and department_name.
Hint: Join employees and departments. */

SELECT e.employee_id, e.salary, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id;



/* M6. List departments that have at least one employee.
Hint: DISTINCT with JOIN. */

SELECT DISTINCT d.department_id, d.department_name
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id;



/* M7. Show employees with salary > 8000.
Hint: WHERE e.salary > 8000. */

SELECT e.first_name, e.last_name, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.salary > 8000;



/* M8. List employee_id, job_id, department_name.
Hint: Join tables. */

SELECT e.employee_id, e.job_id, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id;



/* M9. Count employees per department_name.
Hint: GROUP BY department_name. */

SELECT d.department_name, COUNT(e.employee_id) AS emp_count
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;



/* M10. Show employees in Sales department.
Hint: WHERE department_name = 'Sales'. */

SELECT e.first_name, e.last_name, e.salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Sales';



/* M11. Show total salary by department.
Hint: SUM(e.salary). */

SELECT d.department_id, d.department_name, SUM(e.salary) AS total_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;



/* M12. Show employee_id, hire_date, department_name.
Hint: Join on department_id. */

SELECT e.employee_id, e.hire_date, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id;



/* M13. List employees ordered by department_name and last_name.
Hint: ORDER BY d.department_name, e.last_name. */

SELECT e.first_name, e.last_name, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
ORDER BY d.department_name, e.last_name;



/* M14. Show department average salary.
Hint: AVG(e.salary). */

SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;



/* M15. Show employees with job_id SA_REP.
Hint: WHERE e.job_id = 'SA_REP'. */

SELECT e.employee_id, e.first_name, e.department_id, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.job_id = 'SA_REP';



/* M16. Show minimum salary in each department.
Hint: MIN(e.salary). */

SELECT d.department_name, MIN(e.salary) AS min_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;



/* M17. List employees in department 80 or 90.
Hint: department_id IN (80,90). */

SELECT e.first_name, e.last_name, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.department_id IN (80,90);



/* M18. Show 5 highest paid employees.
Hint: ORDER BY salary DESC FETCH FIRST 5 ROWS ONLY. */

SELECT e.employee_id, e.salary, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
ORDER BY e.salary DESC
FETCH FIRST 5 ROWS ONLY;



/* M19. Show departments with more than 5 employees.
Hint: HAVING COUNT(e.employee_id) > 5. */

SELECT d.department_name, COUNT(e.employee_id) AS emp_count
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) > 5;



/* M20. Show employee name, department_name, hire_date.
Hint: Simple join query. */

SELECT e.first_name, e.last_name, d.department_name, e.hire_date
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id;



/* H1. Show employee and manager names with department.
Hint: Self join employees table. */

SELECT e.employee_id,
e.first_name,
e.last_name,
d.department_name,
m.first_name AS manager_first_name,
m.last_name AS manager_last_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id;



/* H2. Show departments with total salary > 100000.
Hint: HAVING SUM(e.salary) > 100000. */

SELECT d.department_name, SUM(e.salary) AS total_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING SUM(e.salary) > 100000;



/* H3. Employees earning above department average.
Hint: Compare with AVG(salary). */

SELECT e.first_name, e.last_name, e.salary, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.salary >
(
SELECT AVG(salary)
FROM hr.employees
WHERE department_id = e.department_id
);



/* H4. Employee with highest salary in each department.
Hint: ROW_NUMBER() OVER. */

SELECT department_name, first_name, salary
FROM
(
SELECT d.department_name,
e.first_name,
e.salary,
ROW_NUMBER() OVER
(PARTITION BY d.department_id ORDER BY e.salary DESC) rn
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
)
WHERE rn = 1;



/* H5. Show employee count for departments 10,20,30,40.
Hint: WHERE d.department_id IN (...). */

SELECT d.department_id, d.department_name, COUNT(e.employee_id) emp_count
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id
WHERE d.department_id IN (10,20,30,40)
GROUP BY d.department_id, d.department_name;



/* H6. Show employee department and manager department.
Hint: Join departments twice. */

SELECT e.first_name,
e.last_name,
d.department_name AS employee_department,
dm.department_name AS manager_department
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id
LEFT JOIN hr.departments dm
ON m.department_id = dm.department_id;



/* H7. Show average salary ordered descending.
Hint: ORDER BY AVG(e.salary) DESC. */

SELECT d.department_name, AVG(e.salary) avg_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY avg_salary DESC;



/* H8. Employees with salary above company average.
Hint: salary > AVG(salary). */

SELECT e.first_name, e.last_name, e.salary, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.salary > (SELECT AVG(salary) FROM hr.employees);



/* H9. Departments having employees with commission.
Hint: commission_pct IS NOT NULL. */

SELECT DISTINCT d.department_name
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id
WHERE e.commission_pct IS NOT NULL;



/* H10. Show employee and department manager_id.
Hint: Select d.manager_id. */

SELECT e.employee_id,
e.first_name,
e.last_name,
d.department_name,
d.manager_id
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id;



/* H11. Departments with max salary > 12000.
Hint: HAVING MAX(e.salary) > 12000. */

SELECT d.department_name, MAX(e.salary) AS max_salary
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING MAX(e.salary) > 12000;



/* H12. Employees hired after 2005.
Hint: hire_date > DATE '2005-12-31'. */

SELECT e.first_name, e.last_name, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.hire_date > DATE '2005-12-31';



/* H13. Count SA_REP employees by department.
Hint: WHERE e.job_id = 'SA_REP'. */

SELECT d.department_name, COUNT(e.employee_id) AS emp_count
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id
WHERE e.job_id = 'SA_REP'
GROUP BY d.department_id, d.department_name;



/* H14. Salary rank within department.
Hint: RANK() OVER(PARTITION BY). */

SELECT e.first_name,
e.last_name,
d.department_name,
RANK() OVER
(PARTITION BY e.department_id ORDER BY e.salary DESC) AS rank_in_dept
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id;



/* H15. Show departments including departments with 0 employees.
Hint: LEFT JOIN. */

SELECT d.department_name,
COUNT(e.employee_id) AS emp_count
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;



/* H16. Show employees in departments 50,60,70 ordered by dept and salary.
Hint: ORDER BY department_name, salary DESC. */

SELECT e.first_name,
e.last_name,
e.salary,
d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE e.department_id IN (50,60,70)
ORDER BY d.department_name, e.salary DESC;



/* H17. Average tenure by department.
Hint: AVG(MONTHS_BETWEEN(SYSDATE,e.hire_date)/12). */

SELECT d.department_name,
AVG(MONTHS_BETWEEN(SYSDATE,e.hire_date)/12) AS avg_tenure
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;



/* H18. Show employee and number of employees in department.
Hint: Join with count subquery. */

SELECT e.employee_id,
e.first_name,
e.last_name,
d.department_name,
sub.cnt AS dept_employee_count
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
INNER JOIN
(
SELECT department_id, COUNT(*) cnt
FROM hr.employees
GROUP BY department_id
) sub
ON e.department_id = sub.department_id;



/* H19. Departments with more than 2 employees salary > 5000.
Hint: HAVING COUNT(*) > 2. */

SELECT d.department_name, COUNT(*) AS emp_count
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id
WHERE e.salary > 5000
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) > 2;



/* H20. Salary percentage of department total.
Hint: salary * 100 / SUM(salary) OVER(PARTITION BY department_id). */

SELECT e.first_name,
e.last_name,
d.department_name,
ROUND(
e.salary * 100 /
SUM(e.salary) OVER(PARTITION BY e.department_id),
2
) AS pct_of_dept_sal
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id;
