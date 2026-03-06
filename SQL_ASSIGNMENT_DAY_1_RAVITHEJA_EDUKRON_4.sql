-- 11. H11. List employee_id, commission_pct, and commission_category: 'Commissioned' if commission_pct is not null, 'Non-commissioned' if null.
-- Hint: NVL2(commission_pct, 'Commissioned', 'Non-commissioned') AS commission_category.

SELECT employee_id , commission_pct, NVL2(commission_pct, 'Commissioned', 'Non-commissioned') AS commission_category FROM HR.EMPLOYEES;

-- 12. H12. Show employee_id, first_name, last_name, salary, and a column salary_expression that is the literal string 'salary * 12' (not the result of the calculation).
-- Hint: 'salary * 12' AS salary_expression — a string literal.

SELECT employee_id, first_name, last_name, salary, 'salary * 12' AS salary_expression FROM HR.EMPLOYEES;

-- 13. H13. From hr.employees, display employee_id, job_id, and a column job_salary_label as job_id concatenated with ':' and salary (e.g., "SA_REP:9000"). Use TO_CHAR(salary).
-- Hint: job_id || ':' || TO_CHAR(salary) AS job_salary_label.

SELECT employee_id, job_id, job_id || ':' || TO_CHAR(salary) AS job_salary_label FROM HR.EMPLOYEES;

-- 14. H14. List employee_id, salary, and tax_bracket as '20%' if salary >= 10000, '15%' if salary >= 5000, else '10%'. Use CASE.
-- Hint: CASE WHEN salary >= 10000 THEN '20%' WHEN salary >= 5000 THEN '15%' ELSE '10%' END.

SELECT employee_id, salary, CASE WHEN salary >= 10000 THEN '20%' WHEN salary >= 5000 THEN '15%' ELSE '10%' END AS tax_bracket FROM HR.EMPLOYEES;

-- 15. H15. Display department_id, department_name from hr.departments, and a column dept_info that is "Department " followed by department_id and " - " and department_name.
-- Hint: 'Department ' || TO_CHAR(department_id) || ' - ' || department_name AS dept_info.

SELECT department_id, department_name, 'Department ' || TO_CHAR(department_id) || ' - ' || department_name AS dept_info FROM HR.DEPARTMENTS;

-- 16. H16. From hr.employees, show employee_id, first_name, last_name, and full_name_reversed as last_name, space, first_name (e.g., "Doe John").
-- Hint: last_name || ' ' || first_name AS full_name_reversed.

SELECT employee_id, first_name, last_name, last_name || ' ' || first_name AS full_name_reversed FROM HR.EMPLOYEES;

-- 17. H17. List employee_id, salary, commission_pct, and effective_salary as salary when commission_pct is null, otherwise salary * (1 + commission_pct). Use NVL2 or CASE.
-- Hint: NVL2(commission_pct, salary * (1 + commission_pct), salary) AS effective_salary.

SELECT employee_id, salary, commission_pct, NVL2(commission_pct, salary * (1 + commission_pct), salary) AS effective_salary FROM HR.EMPLOYEES;

-- 18. H18. Show employee_id, hire_date, and a column hire_year that is the year from hire_date (use EXTRACT(YEAR FROM hire_date) in Oracle).
-- Hint: EXTRACT(YEAR FROM hire_date) AS hire_year.

SELECT employee_id,HIRE_DATE, EXTRACT(YEAR FROM hire_date) AS hire_year FROM HR.EMPLOYEES;

-- 19. H19. From hr.departments, display department_name and a column word_count as the number of words.
-- For simplicity, use LENGTH(department_name) - LENGTH(REPLACE(department_name, ' ', '')) + 1 AS word_count.

SELECT department_name, LENGTH(department_name) - LENGTH(REPLACE(department_name, ' ', '')) + 1 AS word_count FROM HR.DEPARTMENTS;

-- 20. H20. List employee_id, first_name, last_name, and a column name_with_id as "[" || employee_id || "] " || first_name || " " || last_name.
-- Hint: '[' || TO_CHAR(employee_id) || '] ' || first_name || ' ' || last_name AS name_with_id.

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME,'[' || TO_CHAR(employee_id) || '] ' || first_name || ' ' || last_name AS name_with_id FROM HR.EMPLOYEES;