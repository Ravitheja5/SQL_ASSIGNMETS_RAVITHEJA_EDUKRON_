-- 1. M1. Insert one row into hr_emp_backup with employee_id 990, first_name 'Test', last_name 'User', salary 4000, department_id 50.
INSERT INTO hr_emp_backup(employee_id, first_name, last_name, email,phone_number,hire_date,job_id,salary,commission_pct,manager_id, department_id) VALUES(990,'RAVITHEJA','EDIGA','ravi@gmail.com',6300442917,SYSDATE,'AD_PRES',100000,0,100,90);

-- 2. M2. Update salary to 6000 for employee_id 990 in hr_emp_backup.
UPDATE hr_emp_backup SET SALARY = 6000 WHERE EMPLOYEE_ID = 990;

-- 3. M3. Delete the row where employee_id = 990 from hr_emp_backup.
DELETE FROM HR_EMP_BACKUP WHERE EMPLOYEE_ID = 990;

-- 4. M4. Insert into hr_emp_backup from hr.employees only for department_id 80.
INSERT INTO HR_EMP_BACKUP SELECT * FROM HR.EMPLOYEES WHERE DEPARTMENT_ID = 80;

-- 5. M5. Update first_name to 'Updated' for employee_id 100 in hr_emp_backup.
UPDATE HR_EMP_BACKUP SET FIRST_NAME = 'UPDATD' WHERE EMPLOYEE_ID = 100;

-- 6. M6. Delete all rows from hr_emp_backup where department_id = 90.
DELETE FROM HR_EMP_BACKUP WHERE DEPARTMENT_ID =90;

-- 7. M7. Insert two rows into hr_emp_backup (e.g. employee_id 991 and 992) using two separate INSERT statements.
INSERT INTO hr_emp_backup(employee_id, first_name, last_name, email,phone_number,hire_date,job_id,salary,commission_pct,manager_id, department_id) VALUES(991,'RAVITHEJA','EDIGA','ravi@gmail.com',6300442917,SYSDATE,'AD_PRES',100000,0,100,90);
INSERT INTO hr_emp_backup(employee_id, first_name, last_name, email,phone_number,hire_date,job_id,salary,commission_pct,manager_id, department_id) VALUES(992,'THILAK','EDIGA','THILAKmail.com',63548452152,SYSDATE,'AD_PRES',50000,0,1000,89);

-- 8. M8. Update salary by 5% for all employees in hr_emp_backup in department 50.
UPDATE hr_emp_backup SET salary = salary * 1.05 WHERE department_id = 50;

-- 9. M9. Delete rows from hr_emp_backup where salary is NULL.
DELETE FROM hr_emp_backup WHERE salary IS NULL;

-- 10. M10. Insert into hr_emp_backup from hr.employees where job_id = 'SA_REP' (all columns that exist in backup).
INSERT INTO HR_EMP_BACKUP SELECT * FROM HR.EMPLOYEES WHERE JOB_ID ='SA_REP';

-- 11. M11. Update department_id to 60 for employee_id 105 in hr_emp_backup.
update hr_emp_backup set department_id = 60 where employee_id = 105;

-- 12. M12. Delete the single row with employee_id 999 from hr_emp_backup (if it exists).
delete from hr_emp_backup where employee_id = 999;

-- 13. M13. Insert one row with employee_id 993, last_name 'Lee', first_name 'Amy', salary 5500, department_id 60.
INSERT INTO hr_emp_backup(employee_id, first_name, last_name, email,phone_number,hire_date,job_id,salary,commission_pct,manager_id, department_id) VALUES(993,'amy','lee','amylee@gmail.com',6300442919,SYSDATE,'AD_PRES',55000,0,100,60);
