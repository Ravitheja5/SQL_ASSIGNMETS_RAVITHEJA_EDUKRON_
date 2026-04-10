---14. **M14.** Update last_name to 'Smith' for all employees in hr_emp_backup with first_name 'John'.  
--**Hint:** UPDATE hr_emp_backup SET last_name = 'Smith' WHERE first_name = 'John';
update hr_emp_backup set last_name = 'Smith' where first_name = 'John';

select * from hr_emp_backup;


--15. **M15.** Delete rows from hr_emp_backup where hire_date is before 2000.  
 --   **Hint:** DELETE FROM hr_emp_backup WHERE hire_date < DATE '2000-01-01';
delete from hr_emp_backup where hire_date < DATE '2000-01-01';
--16. **M16.** Insert from hr.employees where salary between 5000 and 7000 into hr_emp_backup.  
  --  **Hint:** INSERT INTO hr_emp_backup SELECT * FROM hr.employees WHERE salary BETWEEN 5000 AND 7000;
insert into hr_emp_backup select * from  hr.employees where salary BETWEEN 5000 AND 7000; 
--17. **M17.** Update job_id to 'IT_PROG' for one specific employee (e.g. employee_id 200) in hr_emp_backup.  
  --  **Hint:** UPDATE hr_emp_backup SET job_id = 'IT_PROG' WHERE employee_id = 200;
UPDATE HR_EMP_BACKUP SET JOB_ID = 'IT_PROG' WHERE EMPLOYEE_ID = 200;




--18. **M18.** Delete rows from hr_emp_backup where commission_pct is not null.  
  --  **Hint:** DELETE FROM hr_emp_backup WHERE commission_pct IS NOT NULL;
DELETE FROM HR_EMP_BACKUP WHERE COMMISSION_PCT IS NOT NULL;


--19. **M19.** Insert a row with hire_date = SYSDATE for a new employee in hr_emp_backup.  
 --   **Hint:** Include hire_date in INSERT and use SYSDATE in VALUES.
INSERT INTO HR_EMP_BACKUP (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)VALUES (101, 'Ravi', 'Kumar', 'ravi@gmail.com', '9876543210',SYSDATE, 'IT_PROG', 50000, NULL, 100, 10);

--20. **M20.** Update salary to 10000 for the employee with the highest employee_id in hr_emp_backup (use subquery: WHERE employee_id = (SELECT MAX(employee_id) FROM hr_emp_backup)).  
UPDATE HR_EMP_BACKUP SET SALARY = 10000 WHERE EMPLOYEE_ID = (SELECT MAX(EMPLOYEE_ID) FROM HR_EMP_BACKUP);

--1. **H1.** Use MERGE to sync hr_emp_backup with hr.employees: when employee_id matches, update salary and hire_date; when not matched, insert the row from hr.employees.  
--   **Hint:** MERGE INTO hr_emp_backup t USING hr.employees s ON (t.employee_id = s.employee_id) WHEN MATCHED THEN UPDATE SET t.salary = s.salary, t.hire_date = s.hire_date WHEN NOT MATCHED THEN INSERT (...) VALUES (s....);


MERGE INTO HR_EMP_BACKUP T
USING HR.EMPLOYEES S
ON (T.EMPLOYEE_ID = S.EMPLOYEE_ID)

WHEN MATCHED THEN
  UPDATE SET 
    T.SALARY = S.SALARY,
    T.HIRE_DATE = S.HIRE_DATE

WHEN NOT MATCHED THEN
  INSERT (
    EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER,
    HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
  )
  VALUES (
    S.EMPLOYEE_ID, S.FIRST_NAME, S.LAST_NAME, S.EMAIL, S.PHONE_NUMBER,
    S.HIRE_DATE, S.JOB_ID, S.SALARY, S.COMMISSION_PCT, S.MANAGER_ID, S.DEPARTMENT_ID
  );