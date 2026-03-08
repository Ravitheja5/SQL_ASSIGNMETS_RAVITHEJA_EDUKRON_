/* 1. **H1.** List employees in department 80 with salary > 7000 OR job_id = 'SA_MAN', ordered by salary DESC.  
   **Hint:** WHERE (department_id = 80 AND salary > 7000) OR job_id = 'SA_MAN' ORDER BY salary DESC.


 */
select * from hr.employees where (department_id = 80 and salary > 7000) or job_id = 'SA_MAN' order by salary desc;

/* 2. **H2.** Find employees hired between Jan 1, 2000 and Dec 31, 2005.  
   **Hint:** WHERE hire_date BETWEEN DATE '2000-01-01' AND DATE '2005-12-31' */
SELECT * FROM hr.employees WHERE hire_date BETWEEN DATE '2000-01-01' AND DATE '2005-12-31';

/* 3. **H3.** List employees whose last_name is 4 characters and starts with 'K'.  
   **Hint:** WHERE last_name LIKE 'K___'. */
SELECT * FROM hr.employees WHERE last_name LIKE 'K___';

/* 4. **H4.** Get top 5 highest-paid employees in department 50 only.  
   **Hint:** WHERE department_id = 50 ORDER BY salary DESC FETCH FIRST 5 ROWS ONLY.
 */
SELECT * FROM hr.employees WHERE department_id = 50 ORDER BY salary DESC FETCH FIRST 5 ROWS ONLY;

/* 5. **H5.** List employees with no manager and salary > 5000.  
   **Hint:** WHERE manager_id IS NULL AND salary > 5000.
 */
SELECT * FROM hr.employees WHERE manager_id IS NULL AND salary > 5000;

/* 
6. **H6.** Find employees whose first_name has an 'a' as the second character.  
   **Hint:** WHERE first_name LIKE '_a%'. */
SELECT * FROM hr.employees WHERE first_name LIKE '_a%';

/* 
7. **H7.** List departments (hr.departments) with department_id between 40 and 90.  
   **Hint:** WHERE department_id BETWEEN 40 AND 90 */
SELECT * FROM hr.departments WHERE department_id BETWEEN 40 AND 90;

/* 8. **H8.** Get employees with salary < 3000 or salary > 15000, ordered by salary.  
   **Hint:** WHERE salary < 3000 OR salary > 15000 ORDER BY salary. */
SELECT * FROM hr.employees WHERE salary < 3000 OR salary > 15000 ORDER BY salary;

/* 9. **H9.** List employees in department 60 with job_id 'IT_PROG', or in department 100 with job_id like 'FI%'.  
   **Hint:** WHERE (department_id = 60 AND job_id = 'IT_PROG') OR (department_id = 100 AND job_id LIKE 'FI%').
 */
SELECT * FROM hr.employees WHERE (department_id = 60 AND job_id = 'IT_PROG') OR (department_id = 100 AND job_id LIKE 'FI%');

/* 10. **H10.** Find employees whose hire_date is in the year 2003.  
    **Hint:** WHERE EXTRACT(YEAR FROM hire_date) = 2003 or hire_date between DATE '2003-01-01' AND DATE '2003-12-31'.
 */
SELECT * FROM hr.employees WHERE EXTRACT(YEAR FROM hire_date) = 2003;