/* 1. **M1.** Create a table `hr_dept_backup` as a full copy of `hr.departments`.  
   **Hint:** CREATE TABLE hr_dept_backup AS SELECT * FROM hr.departments; */

CREATE TABLE hr_dept_backup AS SELECT * FROM hr.departments;

/* 2. **M2.** Add a column `notes` VARCHAR2(100) to `hr_emp_backup`.  
   **Hint:** ALTER TABLE hr_emp_backup ADD notes VARCHAR2(100); */
ALTER TABLE hr_dept_backup ADD NOTES VARCHAR(100);

/* 

3. **M3.** Create a table `emp_50` from employees in department 50 only (all columns).  
   **Hint:** CREATE TABLE emp_50 AS SELECT * FROM hr.employees WHERE department_id = 50; */

CREATE TABLE emp_50 AS SELECT * FROM HR.EMPLOYEES WHERE DEPARTMENT_ID = 50;

/* 
4. **M4.** Add column `updated_at` DATE DEFAULT SYSDATE to your backup table.  
   **Hint:** ALTER TABLE ... ADD updated_at DATE DEFAULT SYSDATE; */
ALTER TABLE hr_dept_backup ADD updated_at DATE DEFAULT SYSDATE;
SELECT * FROM hr_dept_backup; -- Verify the new column with default value

/* 5. **M5.** Create a table `dept_names` with only `department_id` and `department_name` from hr.departments.  
   **Hint:** CREATE TABLE dept_names AS SELECT department_id, department_name FROM hr.departments; */
CREATE TABLE dept_names AS SELECT department_id, department_name FROM hr.departments;

/* 
6. **M6.** Modify column `notes` in hr_emp_backup to VARCHAR2(500).  
   **Hint:** ALTER TABLE hr_emp_backup MODIFY notes VARCHAR2(500); */
ALTER TABLE hr_DEPT_backup MODIFY NOTES VARCHAR2(500);

/* 
7. **M7.** Create an empty table `emp_structure` with the same structure as hr.employees (no rows).  
   **Hint:** CREATE TABLE emp_structure AS SELECT * FROM hr.employees WHERE 1=0; */
CREATE TABLE emp_structure AS SELECT * FROM hr.employees WHERE 1=0;

/* 
8. **M8.** Rename table `hr_emp_backup` to `hr_employees_archive`.  
   **Hint:** RENAME hr_emp_backup TO hr_employees_archive; */

ALTER TABLE hr_emp_backup RENAME TO hr_employees_archive;

/* 9. **M9.** Add two columns to a backup table: `created_by` VARCHAR2(50) and `created_date` DATE.  
   **Hint:** Two ALTER TABLE ... ADD statements (or one ADD with two columns if your Oracle version allows). */
ALTER TABLE hr_employees_archive ADD created_by VARCHAR2(50);
ALTER TABLE hr_employees_archive ADD created_date DATE;

/* 10. **M10.** Create table `high_earners` from hr.employees where salary > 10000 (all columns).  
    **Hint:** CREATE TABLE high_earners AS SELECT * FROM hr.employees WHERE salary > 10000;
 */
CREATE TABLE high_earners AS SELECT * FROM hr.employees WHERE salary > 10000;

/* 11. **M11.** Drop the column `notes` from your backup table.  
    **Hint:** ALTER TABLE ... DROP COLUMN notes;
 */
ALTER TABLE hr_DEPT_backup DROP COLUMN notes;

/* 12. **M12.** Create table `emp_salary_dept` with only  from hr.employees.  
    **Hint:** CREATE TABLE emp_salary_dept AS SELECT employee_id, salary, department_id FROM hr.employees;
 */
create table emp_salary_dept as select employee_id, salary, department_id from hr.employees;

/* 
13. **M13.** Truncate the table `emp_50` (or whatever copy table you created).  
    **Hint:** TRUNCATE TABLE emp_50; */
TRUNCATE TABLE emp_50;

/* 14. **M14.** Rename column `remarks` to `comments` in your backup table.  
    **Hint:** ALTER TABLE ... RENAME COLUMN remarks TO comments; */
alter table hr_dept_backup rename column remarks to comments;

/* 15. **M15.** Create a table `dept_emp_count` with department_id and a literal 0 as column `emp_count` (one row per department).  
    **Hint:** CREATE TABLE dept_emp_count AS SELECT department_id, 0 AS emp_count FROM hr.departments;
 */
create table dept_emp_count as select department_id,0 as emp_count from hr.employees;

/* 16. **M16.** Add column `status` VARCHAR2(20) DEFAULT 'ACTIVE' to a backup table.  
    **Hint:** ALTER TABLE ... ADD status VARCHAR2(20) DEFAULT 'ACTIVE'; */ 
alter table hr_dept_backup add status varchar(20) default 'ACTIVE';

/* 17. **M17.** Create table `emp_hire_2005` from hr.employees where EXTRACT(YEAR FROM hire_date) = 2005.  
    **Hint:** CREATE TABLE emp_hire_2005 AS SELECT * FROM hr.employees WHERE EXTRACT(YEAR FROM hire_date) = 2005;
 */
CREATE TABLE emp_hire_2005 AS SELECT * FROM hr.employees WHERE EXTRACT(YEAR FROM hire_date) = 2005;

/* 18. **M18.** Modify column `status` to VARCHAR2(30).  
    **Hint:** ALTER TABLE ... MODIFY status VARCHAR2(30);
 */
ALTER TABLE hr_dept_backup MODIFY status VARCHAR2(30);

/* 19. **M19.** Create an empty table with the same structure as hr.departments. Name it `dept_template`.  
    **Hint:** CREATE TABLE dept_template AS SELECT * FROM hr.departments WHERE 1=0; */
CREATE TABLE dept_template AS SELECT * FROM hr.departments WHERE 1=0;

/* 
20. **M20.** Add column `audit_id` NUMBER(10) to your backup table.  
    **Hint:** ALTER TABLE ... ADD audit_id NUMBER(10); */
ALTER TABLE hr_dept_backup ADD audit_id NUMBER(10);