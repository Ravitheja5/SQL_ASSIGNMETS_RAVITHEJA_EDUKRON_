/* =========================================================
Day 8 Assignment: All Join Types

All exercises use hr.employees and hr.departments only.
========================================================= */


/* M1. List all employees and department_name; include employees with no department.
Hint: LEFT JOIN departments. */

SELECT e.employee_id,
e.first_name,
e.last_name,
d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id;



/* M2. Show employee and manager names using self join.
Hint: e LEFT JOIN employees m ON e.manager_id = m.employee_id; */

SELECT e.first_name,
e.last_name,
m.first_name AS mgr_first_name,
m.last_name AS mgr_last_name
FROM hr.employees e
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id;



/* M3. List all departments and employee count including 0 employees.
Hint: LEFT JOIN and COUNT. */

SELECT d.department_id,
d.department_name,
COUNT(e.employee_id) AS emp_count
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;



/* M4. Show employees who have no department.
Hint: WHERE d.department_id IS NULL. */

SELECT e.employee_id,
e.first_name,
e.last_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;



/* M5. Show employee name and department with No Dept if null.
Hint: COALESCE(d.department_name,'No Dept'). */

SELECT e.first_name,
e.last_name,
COALESCE(d.department_name,'No Dept') AS department_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id;



/* M6. Show all departments and total salary including 0 salary.
Hint: LEFT JOIN and SUM(e.salary). */

SELECT d.department_name,
SUM(e.salary) AS total_salary
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;



/* M7. Show employee and manager names.
Hint: LEFT JOIN employees m. */

SELECT e.first_name,
e.last_name,
m.first_name AS manager_first_name
FROM hr.employees e
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id;



/* M8. List departments with no employees.
Hint: LEFT JOIN and WHERE e.employee_id IS NULL. */

SELECT d.department_name
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;



/* M9. Show employee_id, first_name, department_id, department_name.
Hint: LEFT JOIN. */

SELECT e.employee_id,
e.first_name,
e.department_id,
d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id;



/* M10. Show departments and number of employees including 0.
Hint: COUNT(e.employee_id). */

SELECT d.department_name,
COUNT(e.employee_id) AS emp_count
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;



/* M11. Show employee and manager names with aliases.
Hint: mgr_first_name and mgr_last_name. */

SELECT e.first_name,
e.last_name,
m.first_name AS mgr_first_name,
m.last_name AS mgr_last_name
FROM hr.employees e
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id;



/* M12. List employees and department_name including invalid departments.
Hint: LEFT JOIN with no filter. */

SELECT e.first_name,
e.last_name,
d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id;



/* M13. Show department_id, department_name and employee count.
Hint: GROUP BY d.department_id, d.department_name. */

SELECT d.department_id,
d.department_name,
COUNT(e.employee_id) AS emp_count
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;



/* M14. Show employee_id, salary and department_name with Unassigned if null.
Hint: NVL(d.department_name,'Unassigned'). */

SELECT e.employee_id,
e.salary,
NVL(d.department_name,'Unassigned') AS department_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id;



/* M15. Show employee and manager employee_id and last_name.
Hint: Self join employees. */

SELECT e.first_name,
e.last_name,
m.employee_id AS mgr_emp_id,
m.last_name AS mgr_last_name
FROM hr.employees e
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id;



/* M16. Show departments and minimum salary.
Hint: MIN(e.salary). */

SELECT d.department_name,
MIN(e.salary) AS min_salary
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;



/* M17. List employees who have managers.
Hint: manager_id IS NOT NULL. */

SELECT e.first_name,
e.last_name,
m.first_name AS manager_name
FROM hr.employees e
INNER JOIN hr.employees m
ON e.manager_id = m.employee_id;



/* M18. Show employee_id, first_name, department_name.
Hint: LEFT JOIN. */

SELECT e.employee_id,
e.first_name,
d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id;



/* M19. Show departments and average salary including empty departments.
Hint: AVG(e.salary). */

SELECT d.department_name,
AVG(e.salary) AS avg_salary
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;



/* M20. Show employee name and department with N/A if no department.
Hint: COALESCE(d.department_name,'N/A'). */

SELECT e.first_name,
e.last_name,
COALESCE(d.department_name,'N/A') AS department_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id;



/* H1. Show employee, manager and manager's manager names.
Hint: Self join three times. */

SELECT e.first_name AS employee,
m.first_name AS manager,
m2.first_name AS manager_manager
FROM hr.employees e
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id
LEFT JOIN hr.employees m2
ON m.manager_id = m2.employee_id;



/* H2. List departments with no employees using NOT EXISTS.
Hint: NOT EXISTS subquery. */

SELECT d.department_name
FROM hr.departments d
WHERE NOT EXISTS (
SELECT 1
FROM hr.employees e
WHERE e.department_id = d.department_id
);



/* H3. Show all employees and all departments using FULL OUTER JOIN.
Hint: FULL OUTER JOIN. */

SELECT e.employee_id,
e.first_name,
d.department_id,
d.department_name
FROM hr.employees e
FULL OUTER JOIN hr.departments d
ON e.department_id = d.department_id;



/* H4. Show employee department and manager department.
Hint: Join departments twice. */

SELECT e.first_name,
d.department_name AS emp_department,
dm.department_name AS mgr_department
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id
LEFT JOIN hr.departments dm
ON m.department_id = dm.department_id;



/* H5. Employees earning more than manager.
Hint: Compare e.salary > m.salary. */

SELECT e.first_name,
e.salary,
m.first_name AS manager_name,
m.salary AS manager_salary
FROM hr.employees e
INNER JOIN hr.employees m
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;



/* H6. Show departments with employee count and commission count.
Hint: COUNT and conditional SUM. */

SELECT d.department_name,
COUNT(e.employee_id) AS emp_count,
SUM(CASE
WHEN e.commission_pct IS NOT NULL THEN 1
ELSE 0
END) AS commission_emp_count
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;



/* H7. Employees with same manager as employee 104.
Hint: manager_id = (SELECT manager_id...). */

SELECT employee_id,
first_name,
last_name
FROM hr.employees
WHERE manager_id = (
SELECT manager_id
FROM hr.employees
WHERE employee_id = 104
)
AND employee_id <> 104;



/* H8. Show employee, department and manager including nulls.
Hint: LEFT JOIN both tables. */

SELECT e.first_name,
d.department_name,
m.first_name AS manager_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id;



/* H9. Departments whose manager not found in employees.
Hint: LEFT JOIN employees mgr. */

SELECT d.department_name
FROM hr.departments d
LEFT JOIN hr.employees mgr
ON d.manager_id = mgr.employee_id
WHERE mgr.employee_id IS NULL;



/* H10. Show employee, department and manager last_name.
Hint: LEFT JOINs. */

SELECT e.employee_id,
e.first_name,
e.last_name,
d.department_name,
m.last_name AS manager_last_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id;



/* H11. Employees whose salary greater than manager salary.
Hint: Self join compare salary. */

SELECT e.first_name,
e.salary,
m.first_name AS manager_name,
m.salary AS manager_salary
FROM hr.employees e
INNER JOIN hr.employees m
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;



/* H12. Show departments and total salary including empty departments.
Hint: LEFT JOIN and SUM. */

SELECT d.department_name,
SUM(e.salary) AS total_salary
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;



/* H13. Show employee, department and department employee count.
Hint: COUNT(*) OVER(PARTITION BY). */

SELECT e.first_name,
d.department_name,
COUNT(*) OVER(PARTITION BY e.department_id) AS dept_count
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id;



/* H14. Show managers and how many employees they manage.
Hint: GROUP BY manager_id. */

SELECT m.employee_id,
m.first_name,
c.cnt AS employees_managed
FROM hr.employees m
INNER JOIN (
SELECT manager_id,
COUNT(*) cnt
FROM hr.employees
GROUP BY manager_id
) c
ON m.employee_id = c.manager_id;



/* H15. Show employee, department and manager including null values.
Hint: LEFT JOIN. */

SELECT e.first_name,
d.department_name,
m.first_name AS manager_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id;



/* H16. Departments with employees salary > 10000.
Hint: DISTINCT department_name. */

SELECT DISTINCT d.department_name
FROM hr.departments d
INNER JOIN hr.employees e
ON d.department_id = e.department_id
WHERE e.salary > 10000;



/* H17. Show employee, department and manager with No Manager text.
Hint: COALESCE(m.first_name,'No Manager'). */

SELECT e.employee_id,
e.first_name,
e.last_name,
d.department_name,
COALESCE(m.first_name,'No Manager') AS manager_name
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id
LEFT JOIN hr.employees m
ON e.manager_id = m.employee_id;



/* H18. FULL OUTER JOIN with source column.
Hint: CASE WHEN e.employee_id IS NOT NULL THEN 'Emp'. */

SELECT e.employee_id,
e.first_name,
d.department_id,
d.department_name,
CASE
WHEN e.employee_id IS NOT NULL THEN 'Emp'
ELSE 'Dept'
END AS source_type
FROM hr.employees e
FULL OUTER JOIN hr.departments d
ON e.department_id = d.department_id;



/* H19. Show department and highest paid employee.
Hint: ROW_NUMBER() OVER(PARTITION BY). */

SELECT department_name,
first_name,
salary
FROM (
SELECT d.department_name,
e.first_name,
e.salary,
ROW_NUMBER() OVER(
PARTITION BY d.department_id
ORDER BY e.salary DESC
) rn
FROM hr.departments d
LEFT JOIN hr.employees e
ON d.department_id = e.department_id
)
WHERE rn = 1;



/* H20. Employees hired before manager.
Hint: e.hire_date < m.hire_date. */

SELECT e.first_name,
e.hire_date,
m.first_name AS manager_name,
m.hire_date AS manager_hire_date
FROM hr.employees e
INNER JOIN hr.employees m
ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;
