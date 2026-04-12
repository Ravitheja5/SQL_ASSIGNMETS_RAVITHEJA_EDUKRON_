--1. **H1.** Use MERGE to sync hr_emp_backup with hr.employees: when employee_id matches, update salary and hire_date; when not matched, insert the row from hr.employees.  
-- **Hint:** MERGE INTO hr_emp_backup t USING hr.employees s ON (t.employee_id = s.employee_id) WHEN MATCHED THEN UPDATE SET t.salary = s.salary, t.hire_date = s.hire_date WHEN NOT MATCHED THEN INSERT (...) VALUES (s....);
MERGE INTO hr_emp_backup t
USING hr.employees s
ON (t.emp_id = s.employee_id)

WHEN MATCHED THEN
    UPDATE SET
        t.salary = s.salary,
        t.hire_date = s.hire_date

WHEN NOT MATCHED THEN
    INSERT (
        emp_id,
        emp_name,
        job,
        salary,
        hire_date,
        dept_id,
        email,
        record_type
    )
    VALUES (
        s.employee_id,
        s.first_name,
        s.job_id,
        s.salary,
        s.hire_date,
        s.department_id,
        s.email,
        'Employee'
    );
    
---2. **H2.** Update hr_emp_backup so that salary equals the salary from hr.employees for the same employee_id (only for employees in department 60).  
--- **Hint:** UPDATE hr_emp_backup e SET e.salary = (SELECT salary FROM hr.employees WHERE employee_id = e.employee_id) WHERE e.employee_id IN (SELECT employee_id FROM hr.employees WHERE department_id = 60);
UPDATE HR_EMP_BACKUP SET HR_EMP_BACKUP.SALARY = (SELECT SALARY FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = HR_EMP_BACKUP.EMPLOYEE_ID) WHERE HR_EMP_BACKUP.EMPLOYEE_ID IN (SELECT employee_id FROM hr.employees WHERE department_id = 60);










--- 3. **H3.** Delete from hr_emp_backup all employees who do not exist in hr.employees (e.g. test rows).  
 ---  **Hint:** DELETE FROM hr_emp_backup WHERE employee_id NOT IN (SELECT employee_id FROM hr.employees); or use NOT EXISTS.
DELETE FROM HR_EMP_BACKUP WHERE EMPLOYEE_ID NOT IN (SELECT EMPLOYEE_ID FROM HR.EMPLOYEES);





---4. **H4.** Insert into hr_emp_backup only employees from hr.employees whose employee_id is not already in hr_emp_backup (use INSERT ... SELECT ... WHERE NOT EXISTS).  
-- **Hint:** INSERT INTO hr_emp_backup SELECT * FROM hr.employees e WHERE NOT EXISTS (SELECT 1 FROM hr_emp_backup b WHERE b.employee_id = e.employee_id);
INSERT INTO hr_emp_backup SELECT * FROM hr.employees e WHERE NOT EXISTS (SELECT 1 FROM hr_emp_backup b WHERE b.employee_id = e.employee_id);




---5. **H5.** Update hr_emp_backup: set salary to the average salary of the department (from hr.employees) for that employee's department_id.  
---**Hint:** SET salary = (SELECT AVG(salary) FROM hr.employees WHERE department_id = hr_emp_backup.department_id); use table alias in subquery.
UPDATE HR_EMP_BACKUP SET salary = (SELECT AVG(salary) FROM hr.employees WHERE department_id = hr_emp_backup.department_id);




---**H6.** Delete from hr_emp_backup the single row with the smallest employee_id.  
---**Hint:** DELETE FROM hr_emp_backup WHERE employee_id = (SELECT MIN(employee_id) FROM hr_emp_backup);
DELETE FROM HR_EMP_BACKUP WHERE EMPLOYEE_ID = (SELECT MIN(EMPLOYEE_ID) FROM HR_EMP_BACKUP);


--8. **H8.** Update hr_emp_backup: set first_name and last_name from hr.employees for the same employee_id where department_id = 50.  
update hr_emp_backup eb set (first_name,last_name) = (select first_name, last_name from hr.employees es where eb.employee_id = es.employee_id) where department_id=50;


--9. **H9.** Delete from hr_emp_backup all rows where the employee's salary in hr.employees is less than 3000 (match on employee_id).  
DELETE FROM HR_EMP_BACKUP WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM HR.EMPLOYEES WHERE SALARY < 3000);
--10. **H10.** Insert from hr.employees where department_id is in (10, 20, 30) and salary > 5000.  
--**Hint:** INSERT INTO hr_emp_backup SELECT * FROM hr.employees WHERE department_id IN (10,20,30) AND salary > 5000;
INSERT INTO hr_emp_backup SELECT * FROM hr.employees WHERE department_id IN (10,20,30) AND salary > 5000;


--11. **H11.** Update hr_emp_backup: set department_id to 50 for all employees whose current department_id is NULL.  
--**Hint:** UPDATE hr_emp_backup SET department_id = 50 WHERE department_id IS NULL;


UPDATE hr_emp_backup SET department_id = 50 WHERE department_id IS NULL;


--12. **H12.** Delete from hr_emp_backup employees who have the same first_name and last_name as another row in hr_emp_backup (keep one; delete duplicates—e.g. keep min(employee_id) per name).12. **H12.** Delete from hr_emp_backup employees who have the same first_name and last_name as another row in hr_emp_backup (keep one; delete duplicates—e.g. keep min(employee_id) per name).  
--**Hint:** DELETE FROM hr_emp_backup a WHERE employee_id NOT IN (SELECT MIN(employee_id) FROM hr_emp_backup GROUP BY first_name, last_name) AND EXISTS (SELECT 1 FROM hr_emp_backup b WHERE b.first_name = a.first_name AND b.last_name = a.last_name AND b.employee_id < a.employee_id); or use ROW_NUMBER() in subquery.
 DELETE FROM hr_emp_backup a WHERE employee_id NOT IN (SELECT MIN(employee_id) FROM hr_emp_backup GROUP BY first_name, last_name) AND EXISTS (SELECT 1 FROM hr_emp_backup b WHERE b.first_name = a.first_name AND b.last_name = a.last_name AND b.employee_id < a.employee_id);
 
 
 --14. **H14.** Update hr_emp_backup so salary is increased by 10% only for employees whose salary in hr.employees is below the company average.  
   -- **Hint:** UPDATE hr_emp_backup SET salary = salary * 1.10 WHERE employee_id IN (SELECT employee_id FROM hr.employees WHERE salary < (SELECT AVG(salary) FROM hr.employees));
UPDATE hr_emp_backup SET salary = salary * 1.10 WHERE employee_id IN (SELECT employee_id FROM hr.employees WHERE salary < (SELECT AVG(salary) FROM hr.employees));














--15. **H15.** Delete from hr_emp_backup where hire_date is the earliest in the table (only one row).  
--**Hint:** DELETE FROM hr_emp_backup WHERE hire_date = (SELECT MIN(hire_date) FROM hr_emp_backup);
DELETE FROM hr_emp_backup WHERE hire_date = (SELECT MIN(hire_date) FROM hr_emp_backup);





--16. **H16.** Insert into hr_emp_backup from hr.employees only for employees who are managers (employee_id in (SELECT manager_id FROM hr.employees)).  
-- **Hint:** INSERT ... SELECT * FROM hr.employees WHERE employee_id IN (SELECT manager_id FROM hr.employees WHERE manager_id IS NOT NULL);



INSERT INTO HR_EMP_BACKUP SELECT * FROM hr.employees WHERE employee_id IN (SELECT manager_id FROM hr.employees WHERE manager_id IS NOT NULL);


--17. **H17.** Update last_name in hr_emp_backup to UPPER(last_name) for all rows.  
  --  **Hint:** UPDATE hr_emp_backup SET last_name = UPPER(last_name);
UPDATE HR_EMP_BACKUP SET LAST_NAME = UPPER(LAST_NAME);


--18. **H18.** Delete from hr_emp_backup the top 5 highest salary earners (use subquery with ROWNUM or FETCH).  
--**Hint:** DELETE FROM hr_emp_backup WHERE employee_id IN (SELECT employee_id FROM (SELECT employee_id FROM hr_emp_backup ORDER BY salary DESC FETCH FIRST 5 ROWS ONLY));
DELETE FROM hr_emp_backup WHERE employee_id IN (SELECT employee_id FROM (SELECT employee_id FROM hr_emp_backup ORDER BY salary DESC FETCH FIRST 5 ROWS ONLY));





--19. **H19.** Insert from hr.employees where job_id like 'SA%' and commission_pct is not null.  
  --  **Hint:** INSERT INTO hr_emp_backup SELECT * FROM hr.employees WHERE job_id LIKE 'SA%' AND commission_pct IS NOT NULL;
INSERT INTO hr_emp_backup SELECT * FROM hr.employees WHERE job_id LIKE 'SA%' AND commission_pct IS NOT NULL;


--20. **H20.** Update hr_emp_backup: set salary to the max salary in the same department (from hr.employees) for each employee.  
--**Hint:** UPDATE hr_emp_backup e SET salary = (SELECT MAX(salary) FROM hr.employees WHERE department_id = e.department_id) WHERE department_id IS NOT NULL;
UPDATE hr_emp_backup e SET salary = (SELECT MAX(salary) FROM hr.employees WHERE department_id = e.department_id) WHERE department_id IS NOT NULL;