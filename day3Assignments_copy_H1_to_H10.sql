-- 1. H1. Create a table `emp_dept_summary` that has one row per department with columns department_id, department_name (from hr.departments), and a computed column total_sal (use a subquery or join to get SUM(salary) per department).  
CREATE TABLE emp_dept_summary AS SELECT d.department_id, d.department_name, (SELECT SUM(salary) FROM hr.employees e WHERE e.department_id = d.department_id) AS total_sal FROM hr.departments d;

-- 2. H2. Create table `emp_backup_80` from hr.employees for department 80, but only columns employee_id, first_name, last_name, salary, commission_pct.
CREATE TABLE emp_backup_80 AS SELECT employee_id, first_name, last_name, salary, commission_pct FROM hr.employees WHERE department_id = 80;

-- 3. H3. Add a column `full_name` to a backup table and populate it with first_name || ' ' || last_name for all existing rows (requires UPDATE after ADD; then you could add a default for new rows).
alter table emp_backup_80 add full_name VARCHAR2(50);
update emp_backup_80 set full_name = first_name || ' ' || last_name;

-- 4. H4. Create a table that has department_id, department_name, and a column `manager_name` (you would need to join hr.departments with hr.employees on manager_id to get manager's name).
create table dept_with_mgr as select d.department_id, d.department_name, e.first_name || ' ' || e.last_name as manager_name from hr.departments d left join hr.employees e on d.manager_id = e.employee_id;

-- 5. H5. Create table `emp_job_salary` with columns job_id, min_sal, max_sal, avg_sal (use GROUP BY job_id with MIN, MAX, AVG on salary from hr.employees).
CREATE TABLE emp_job_salary AS SELECT JOB_ID ,MIN(SALARY) AS MIN_SAL,MAX(SALARY) AS MAX_SAL ,AVG(SALARY) AS AVG_SAL FROM HR.EMPLOYEES GROUP BY JOB_ID;
SELECT * FROM emp_job_salary;

-- 6. H6. Add a column that has a DEFAULT expression using SYSDATE and rename an existing column in the same table (two statements).
ALTER TABLE emp_job_salary ADD  DATE_SYSTEM  DATE DEFAULT SYSDATE;
ALTER TABLE  emp_job_salary RENAME COLUMN  DATEOFSYSTEM TO NEWcOLUMN;

-- 7. H7. Create a table `emp_top_sal` with the same structure as hr.employees but only rows where salary is in the top 10 (use subquery: WHERE salary IN (SELECT ... ORDER BY salary DESC FETCH FIRST 10 ROWS ONLY)).
CREATE TABLE emp_top_sal AS SELECT * FROM hr.employees WHERE SALARY IN (SELECT SALARY FROM hr.employees ORDER BY SALARY DESC FETCH FIRST 10 ROWS ONLY );
SELECT * FROM emp_top_sal;

-- 8. H8. Create table `dept_emp_list` with department_id, department_name, and employee_count (count of employees per department).
CREATE TABLE dept_emp_list AS SELECT d.department_id, d.department_name, COUNT(e.employee_id) AS employee_count FROM hr.departments d LEFT JOIN hr.employees e ON e.department_id = d.department_id GROUP BY d.department_id, d.department_name;
SELECT * FROM dept_emp_list;

-- 9. H9. Drop two columns from your backup table in one statement (if Oracle supports: ALTER TABLE ... DROP (col1, col2)).
alter table  emp_job_salary drop column min_sal;
alter table  emp_job_salary drop column max_sal;

-- 10. H10. Create a table that contains only employees whose manager_id is not null and department_id is not null (all columns).
CREATE TABLE emp_with_mgr_dept AS SELECT * FROM hr.employees WHERE manager_id IS NOT NULL AND department_id IS NOT NULL;