
/* 1. **M1.** List employees in department_id 80 with salary greater than 8000.  
   **Hint:** WHERE department_id = 80 AND salary > 8000. */
SELECT * FROM HR.EMPLOYEES WHERE DEPARTMENT_ID = 80 AND SALARY > 8000;

/* 2. **M2.** Find employees whose last_name ends with 'n'.  
   **Hint:** WHERE last_name LIKE '%n'. */ 
SELECT * FROM HR.EMPLOYEES WHERE last_name LIKE '%n';

/* 
3. **M3.** List employees hired after January 1, 2005.  
   **Hint:** WHERE hire_date > DATE '2005-01-01' or hire_date >= DATE '2005-01-01'. */
SELECT * FROM HR.EMPLOYEES WHERE hire_date > DATE '2005-01-01' or hire_date >= DATE '2005-01-01';

/* 4. **M4.** Get employees whose job_id is either 'SA_REP' or 'SA_MAN'.  
   **Hint:** WHERE job_id IN ('SA_REP', 'SA_MAN'). */ select * from hr.employees where job_id ='SA_REP' or job_id = 'SA_MAN'; 

/* 5. **M5.** List employees with salary between 4000 and 7000 (inclusive).  
   **Hint:** WHERE salary BETWEEN 4000 AND 7000. */
select * from hr.employees where salary between 4000 and 7000;

/* 6. **M6.** Find employees who have a manager (manager_id is not null).  
**Hint:** WHERE manager_id IS NOT NULL. */
select * from hr.employees where manager_id IS NOT NULL;

/* 7. **M7.** List departments with department_id 10, 20, or 30 from hr.departments.  
   **Hint:** WHERE department_id IN (10, 20, 30). */
select * from hr.departments where department_id IN (10, 20, 30);

/* 8. **M8.** Get the top 3 employees by hire_date (oldest first).  
   **Hint:** ORDER BY hire_date ASC then FETCH FIRST 3 ROWS ONLY. */
SELECT * FROM hr.employees ORDER BY hire_date ASC FETCH FIRST 3 ROWS ONLY;

/* 9. **M9.** List employees in department 50, ordered by last_name ascending.  
   **Hint:** WHERE department_id = 50 ORDER BY last_name. */
SELECT * FROM hr.employees WHERE department_id = 50 ORDER BY last_name;

/* 10. **M10.** Find employees whose first_name starts with 'J'.  
    **Hint:** WHERE first_name LIKE 'J%'. */
SELECT * FROM hr.employees WHERE first_name LIKE 'J%';