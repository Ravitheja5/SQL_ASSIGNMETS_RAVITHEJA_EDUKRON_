/* /* 11. **H11.** List employees with commission_pct NULL and job_id starting with 'SA'.  
    **Hint:** WHERE commission_pct IS NULL AND job_id LIKE 'SA%'. */
SELECT * FROM hr.employees WHERE commission_pct IS NULL AND job_id LIKE 'SA%';

/* 12. **H12.** Get the 3 oldest employees (earliest hire_date) in department 90.  
    **Hint:** WHERE department_id = 90 ORDER BY hire_date ASC FETCH FIRST 3 ROWS ONLY. */
SELECT * FROM hr.employees WHERE department_id = 90 ORDER BY hire_date ASC FETCH FIRST 3 ROWS ONLY;

/* 13. **H13.** List employees whose last_name does not start with 'A', 'B', or 'C'.  
    **Hint:** WHERE last_name NOT LIKE 'A%' AND last_name NOT LIKE 'B%' AND last_name NOT LIKE 'C%'; or use NOT IN with SUBSTR.
 */
SELECT * FROM hr.employees WHERE last_name NOT LIKE 'A%' AND last_name NOT LIKE 'B%' AND last_name NOT LIKE 'C%';

/* 14. **H14.** Find employees with salary in (5000, 6000, 7000, 8000).  
    **Hint:** WHERE salary IN (5000, 6000, 7000, 8000). */
SELECT * FROM hr.employees WHERE salary IN (5000, 6000, 7000, 8000);

/* 15. **H15.** List employees ordered by department_id ASC, then by hire_date DESC within each department.  
    **Hint:** ORDER BY department_id, hire_date DESC. */
SELECT * FROM hr.employees ORDER BY department_id, hire_date DESC;

/* 16. **H16.** Get employees whose first_name and last_name both start with the same letter (simplified: same first letter).  
    **Hint:** WHERE SUBSTR(first_name,1,1) = SUBSTR(last_name,1,1). */
SELECT * FROM hr.employees WHERE SUBSTR(first_name,1,1) = SUBSTR(last_name,1,1);

/* 17. **H17.** List employees with manager_id not null and department_id in (50, 80, 100).  
    **Hint:** WHERE manager_id IS NOT NULL AND department_id IN (50, 80, 100). */
SELECT * FROM hr.employees WHERE manager_id IS NOT NULL AND department_id IN (50, 80, 100);

/* 


18. **H18.** Find employees with salary between 3000 and 5000 and job_id containing 'REP'.  
    **Hint:** WHERE salary BETWEEN 3000 AND 5000 AND job_id LIKE '%REP%'. */
SELECT * FROM hr.employees WHERE salary BETWEEN 3000 AND 5000 AND job_id LIKE '%REP%';

/* 19. **H19.** List departments (hr.departments) ordered by department_name descending.  
    **Hint:** SELECT * FROM hr.departments ORDER BY department_name DESC. */
SELECT * FROM hr.departments ORDER BY department_name DESC;

/* 20. **H20.** Get employees with hire_date not in 2004 (all years except 2004).  
    **Hint:** WHERE EXTRACT(YEAR FROM hire_date) <> 2004 or hire_date < DATE '2004-01-01' OR hire_date > DATE '2004-12-31'.
  */
SELECT * FROM hr.employees WHERE EXTRACT(YEAR FROM hire_date) <> 2004;