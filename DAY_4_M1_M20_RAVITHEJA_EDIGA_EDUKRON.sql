/*
# Day 4 Assignment: DML – Insert, Update, Delete

### 20 Hard Questions

1. **H1.** Use MERGE to sync hr_emp_backup with hr.employees: when employee_id matches, update salary and hire_date; when not matched, insert the row from hr.employees.  
   **Hint:** MERGE INTO hr_emp_backup t USING hr.employees s ON (t.employee_id = s.employee_id) WHEN MATCHED THEN UPDATE SET t.salary = s.salary, t.hire_date = s.hire_date WHEN NOT MATCHED THEN INSERT (...) VALUES (s....);

2. **H2.** Update hr_emp_backup so that salary equals the salary from hr.employees for the same employee_id (only for employees in department 60).  
   **Hint:** UPDATE hr_emp_backup e SET e.salary = (SELECT salary FROM hr.employees WHERE employee_id = e.employee_id) WHERE e.employee_id IN (SELECT employee_id FROM hr.employees WHERE department_id = 60);

3. **H3.** Delete from hr_emp_backup all employees who do not exist in hr.employees (e.g. test rows).  
   **Hint:** DELETE FROM hr_emp_backup WHERE employee_id NOT IN (SELECT employee_id FROM hr.employees); or use NOT EXISTS.

4. **H4.** Insert into hr_emp_backup only employees from hr.employees whose employee_id is not already in hr_emp_backup (use INSERT ... SELECT ... WHERE NOT EXISTS).  
   **Hint:** INSERT INTO hr_emp_backup SELECT * FROM hr.employees e WHERE NOT EXISTS (SELECT 1 FROM hr_emp_backup b WHERE b.employee_id = e.employee_id);

5. **H5.** Update hr_emp_backup: set salary to the average salary of the department (from hr.employees) for that employee's department_id.  
   **Hint:** SET salary = (SELECT AVG(salary) FROM hr.employees WHERE department_id = hr_emp_backup.department_id); use table alias in subquery.

6. **H6.** Delete from hr_emp_backup the single row with the smallest employee_id.  
   **Hint:** DELETE FROM hr_emp_backup WHERE employee_id = (SELECT MIN(employee_id) FROM hr_emp_backup);

7. **H7.** Insert into a backup table one row per department from hr.departments with department_id, department_name, and a column emp_count = 0. Then (separately) update emp_count using a subquery that counts employees per department.  
   **Hint:** INSERT from departments with 0; then UPDATE ... SET emp_count = (SELECT COUNT(*) FROM hr.employees e WHERE e.department_id = backup.department_id).

8. **H8.** Update hr_emp_backup: set first_name and last_name from hr.employees for the same employee_id where department_id = 50.  
   **Hint:** UPDATE hr_emp_backup e SET (first_name, last_name) = (SELECT first_name, last_name FROM hr.employees WHERE employee_id = e.employee_id) WHERE e.department_id = 50;

9. **H9.** Delete from hr_emp_backup all rows where the employee's salary in hr.employees is less than 3000 (match on employee_id).  
   **Hint:** DELETE FROM hr_emp_backup WHERE employee_id IN (SELECT employee_id FROM hr.employees WHERE salary < 3000);

10. **H10.** Insert from hr.employees where department_id is in (10, 20, 30) and salary > 5000.  
    **Hint:** INSERT INTO hr_emp_backup SELECT * FROM hr.employees WHERE department_id IN (10,20,30) AND salary > 5000;

11. **H11.** Update hr_emp_backup: set department_id to 50 for all employees whose current department_id is NULL.  
    **Hint:** UPDATE hr_emp_backup SET department_id = 50 WHERE department_id IS NULL;

12. **H12.** Delete from hr_emp_backup employees who have the same first_name and last_name as another row in hr_emp_backup (keep one; delete duplicates—e.g. keep min(employee_id) per name).  
    **Hint:** DELETE FROM hr_emp_backup a WHERE employee_id NOT IN (SELECT MIN(employee_id) FROM hr_emp_backup GROUP BY first_name, last_name) AND EXISTS (SELECT 1 FROM hr_emp_backup b WHERE b.first_name = a.first_name AND b.last_name = a.last_name AND b.employee_id < a.employee_id); or use ROW_NUMBER() in subquery.

13. **H13.** MERGE: for rows in hr.employees that exist in hr_emp_backup, update salary; for rows that do not exist, insert. Use department_id 80 only.  
    **Hint:** MERGE USING (SELECT * FROM hr.employees WHERE department_id = 80) s ON ...

14. **H14.** Update hr_emp_backup so salary is increased by 10% only for employees whose salary in hr.employees is below the company average.  
    **Hint:** UPDATE hr_emp_backup SET salary = salary * 1.10 WHERE employee_id IN (SELECT employee_id FROM hr.employees WHERE salary < (SELECT AVG(salary) FROM hr.employees));

15. **H15.** Delete from hr_emp_backup where hire_date is the earliest in the table (only one row).  
    **Hint:** DELETE FROM hr_emp_backup WHERE hire_date = (SELECT MIN(hire_date) FROM hr_emp_backup);

16. **H16.** Insert into hr_emp_backup from hr.employees only for employees who are managers (employee_id in (SELECT manager_id FROM hr.employees)).  
    **Hint:** INSERT ... SELECT * FROM hr.employees WHERE employee_id IN (SELECT manager_id FROM hr.employees WHERE manager_id IS NOT NULL);

17. **H17.** Update last_name in hr_emp_backup to UPPER(last_name) for all rows.  
    **Hint:** UPDATE hr_emp_backup SET last_name = UPPER(last_name);

18. **H18.** Delete from hr_emp_backup the top 5 highest salary earners (use subquery with ROWNUM or FETCH).  
    **Hint:** DELETE FROM hr_emp_backup WHERE employee_id IN (SELECT employee_id FROM (SELECT employee_id FROM hr_emp_backup ORDER BY salary DESC FETCH FIRST 5 ROWS ONLY));

19. **H19.** Insert from hr.employees where job_id like 'SA%' and commission_pct is not null.  
    **Hint:** INSERT INTO hr_emp_backup SELECT * FROM hr.employees WHERE job_id LIKE 'SA%' AND commission_pct IS NOT NULL;

20. **H20.** Update hr_emp_backup: set salary to the max salary in the same department (from hr.employees) for each employee.  
    **Hint:** UPDATE hr_emp_backup e SET salary = (SELECT MAX(salary) FROM hr.employees WHERE department_id = e.department_id) WHERE department_id IS NOT NULL;

---

/* 1. **M1.** Insert one row into hr_emp_backup with employee_id 990, first_name 'Test', last_name 'User', salary 4000, department_id 50.  
   **Hint:** INSERT INTO hr_emp_backup (employee_id, first_name, last_name, salary, department_id) VALUES (990, 'Test', 'User', 4000, 50);
 */

INSERT INTO hr_emp_backup (employee_id, first_name, last_name,email,phone_number,hire_date,job_id, salary,commission_pct,manager_id, department_id) VALUES (999,'ravi','Ediga','ravitheja6300',6300442917,'13-03-2026','sh_clerk',100000,0.1,12000,20);

--SELECT * FROM hr_emp_backup;

/* 2. **M2.** Update salary to 6000 for employee_id 990 in hr_emp_backup.  
   **Hint:** UPDATE hr_emp_backup SET salary = 6000 WHERE employee_id = 990;
 */
UPDATE hr_emp_backup set salary = 60000 where employee_id = 990;

/* 3. **M3.** Delete the row where employee_id = 990 from hr_emp_backup.  
   **Hint:** DELETE FROM hr_emp_backup WHERE employee_id = 990; */

DELETE FROM hr_emp_backup where employee_id = 990;

/* 7. **M7.** Insert two rows into hr_emp_backup (e.g. employee_id 991 and 992) using two separate INSERT statements.  
   **Hint:** Two INSERT INTO ... VALUES ... statements.
 */
INSERT INTO hr_emp_backup (employee_id, first_name, last_name,email,phone_number,hire_date,job_id, salary,commission_pct,manager_id, department_id) VALUES (992,'raviTHEJA','EdigaEDIGA','ravitheja63000',6300442918,'13-03-2025','sh_clerk',100000,0.1,12000,20);

/* 8. **M8.** Update salary by 5% for all employees in hr_emp_backup in department 50.  
   **Hint:** UPDATE hr_emp_backup SET salary = salary * 1.05 WHERE department_id = 50;
 */
UPDATE hr_emp_backup SET SALARY = SALARY * 1.05 WHERE DEPARTMENT_ID = 50;

/* 9. **M9.** Delete rows from hr_emp_backup where salary is NULL.  
   **Hint:** DELETE FROM hr_emp_backup WHERE salary IS NULL;
 */
DELETE FROM hr_emp_backup WHERE SALARY IS NULL;

/* 10. **M10.** Insert into hr_emp_backup from hr.employees where job_id = 'SA_REP' (all columns that exist in backup).  
    **Hint:** INSERT INTO hr_emp_backup SELECT * FROM hr.employees WHERE job_id = 'SA_REP';
 */
INSERT INTO HR_EMP_BACKUP SELECT * FROM HR.EMPLOYEES WHERE JOB_ID  = 'SAP_REP';

/* 11. **M11.** Update department_id to 60 for employee_id 105 in hr_emp_backup.  
    **Hint:** UPDATE hr_emp_backup SET department_id = 60 WHERE employee_id = 105;
 */
UPDATE hr_emp_backup SET department_id = 60 WHERE department_id = 105;

/* 12. **M12.** Delete the single row with employee_id 999 from hr_emp_backup (if it exists).  
    **Hint:** DELETE FROM hr_emp_backup WHERE employee_id = 999;
 */
DELETE FROM hr_emp_backup WHERE employee_id = 999;

/* 13. **M13.** Insert one row with employee_id 993, last_name 'Lee', first_name 'Amy', salary 5500, department_id 60.  
    **Hint:** INSERT with columns in any order but VALUES in same order as columns.
 */

INSERT INTO hr_emp_backup
(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)VALUES(993,'Amy','Lee','AMYLEE','9876543210',TO_DATE('13-03-2026','DD-MM-YYYY'),'SH_CLERK',5500,NULL,120,60);

/* 14. **M14.** Update last_name to 'Smith' for all employees in hr_emp_backup with first_name 'John'.  
    **Hint:** UPDATE hr_emp_backup SET last_name = 'Smith' WHERE first_name = 'John';
 */
UPDATE hr_emp_backup SET last_name = 'Smith' WHERE first_name = 'John';

/* 15. **M15.** Delete rows from hr_emp_backup where hire_date is before 2000.  
    **Hint:** DELETE FROM hr_emp_backup WHERE hire_date < DATE '2000-01-01';
 */
DELETE FROM hr_emp_backup WHERE hire_date < DATE '2000-01-01';

/* 17. **M17.** Update job_id to 'IT_PROG' for one specific employee (e.g. employee_id 200) in hr_emp_backup.  
    **Hint:** UPDATE hr_emp_backup SET job_id = 'IT_PROG' WHERE employee_id = 200;
 */
UPDATE hr_emp_backup SET job_id = 'IT_PROG' WHERE employee_id = 200;

/* 18. **M18.** Delete rows from hr_emp_backup where commission_pct is not null.  
    **Hint:** DELETE FROM hr_emp_backup WHERE commission_pct IS NOT NULL;
 */
DELETE FROM hr_emp_backup WHERE commission_pct IS NOT NULL;

/* 19. **M19.** Insert a row with hire_date = SYSDATE for a new employee in hr_emp_backup.  
    **Hint:** Include hire_date in INSERT and use SYSDATE in VALUES. */
INSERT INTO hr_emp_backup(employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id)VALUES(994, 'John', 'Smith', 'JSMITH', SYSDATE, 'SH_CLERK', 6000, 50);

/* 20. **M20.** Update salary to 10000 for the employee with the highest employee_id in hr_emp_backup (use subquery: WHERE employee_id = (SELECT MAX(employee_id) FROM hr_emp_backup)).  
    **Hint:** UPDATE hr_emp_backup SET salary = 10000 WHERE employee_id = (SELECT MAX(employee_id) FROM hr_emp_backup);
 */
UPDATE hr_emp_backup set salary = 10000 where employee_id = (SELECT MAX(EMPLOYEE_ID) FROM HR_EMP_BACKUP);
