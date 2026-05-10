
/*Day 5 Assignment: DCL and TCL
Use a copy of hr.employees (e.g. hr_emp_backup) for updates so you do not change production data.
---
Part 1: Practice Questions (With Answers and Explanations)
Question 1
Simulate a transaction: (a) Update salary for one employee in your backup table, (b) Create a savepoint, (c) Update another employee salary, (d) Rollback to the savepoint, (e) Commit. After (e), which change(s) are permanent?
Answer:
```sql
-- (a) First update
UPDATE hr_emp_backup SET salary = salary * 1.05 WHERE employee_id = 100;

-- (b) Savepoint
SAVEPOINT after_first;

-- (c) Second update
UPDATE hr_emp_backup SET salary = salary * 1.10 WHERE employee_id = 101;

-- (d) Rollback to savepoint (undoes only the second update)
ROLLBACK TO SAVEPOINT after_first;

-- (e) Commit
COMMIT;
```
Explanation: Only the first update (employee_id 100) is committed. The second update was undone by ROLLBACK TO SAVEPOINT. So after COMMIT, only the change to employee 100 is permanent.
---
Question 2
In your own words, explain what happens to session visibility when you COMMIT vs when you ROLLBACK in another session that is querying the same table.
Answer (conceptual): COMMIT makes your changes visible to other sessions; their new queries will see the updated data. ROLLBACK discards your changes; other sessions never see them. Read consistency means each query in another session sees data as of a consistent point in time; they do not see your uncommitted changes until you commit.
---
Part 2: Self-Practice (No Answers)
Write a script that performs two separate UPDATEs on your backup table, then performs one ROLLBACK (no savepoint). What happens to both updates?
List the object privileges a user would need to be able to query hr.employees (e.g. SELECT). If you cannot grant, describe what you would run as the table owner.
---
Part 3: Additional Practice — 20 Medium + 20 Hard Questions (With Hints)
Use hr_emp_backup or copy tables for DML; describe DCL as the schema owner where applicable.
20 Medium Questions*/

/* M1. After updating one row in hr_emp_backup, issue COMMIT. Then run a SELECT to verify.
Hint: UPDATE ... ; COMMIT; SELECT * FROM hr_emp_backup WHERE ... ; */

UPDATE hr_emp_backup
SET salary = salary + 1000
WHERE employee_id = 100;

COMMIT;

SELECT *
FROM hr_emp_backup
WHERE employee_id = 100;




/* M2. Update two different rows in hr_emp_backup, then ROLLBACK. Verify both changes are undone.
Hint: Two UPDATEs; ROLLBACK; SELECT to confirm original values. */

UPDATE hr_emp_backup
SET salary = salary + 500
WHERE employee_id = 101;

UPDATE hr_emp_backup
SET salary = salary + 1000
WHERE employee_id = 102;

ROLLBACK;

SELECT *
FROM hr_emp_backup
WHERE employee_id IN (101,102);




/* M3. Create a savepoint after one UPDATE, then do another UPDATE, then ROLLBACK TO SAVEPOINT. What is the state before COMMIT?
Hint: First update remains in transaction; second is undone. */

UPDATE hr_emp_backup
SET salary = salary + 200
WHERE employee_id = 103;

SAVEPOINT sp1;

UPDATE hr_emp_backup
SET salary = salary + 300
WHERE employee_id = 104;

ROLLBACK TO sp1;




/* M4. Write the SQL to GRANT SELECT on hr.employees to a role named hr_select_role (run as HR if you have access).
Hint: CREATE ROLE hr_select_role; GRANT SELECT ON hr.employees TO hr_select_role; */

CREATE ROLE hr_select_role;

GRANT SELECT
ON hr.employees
TO hr_select_role;




/* M5. Revoke SELECT on hr.departments from a user (use a placeholder user name).
Hint: REVOKE SELECT ON hr.departments FROM some_user; */

REVOKE SELECT
ON hr.departments
FROM some_user;




/* M6. In one transaction, update salary for employee_id 100, create savepoint sp1, update salary for employee_id 101, then ROLLBACK TO sp1, then COMMIT. Who has the new salary?
Hint: Only employee 100; 101's update was rolled back. */

UPDATE hr_emp_backup
SET salary = salary + 500
WHERE employee_id = 100;

SAVEPOINT sp1;

UPDATE hr_emp_backup
SET salary = salary + 1000
WHERE employee_id = 101;

ROLLBACK TO sp1;

COMMIT;




/* M7. Grant INSERT and UPDATE on hr_emp_backup to a role (your own backup table in your schema).
Hint: GRANT INSERT, UPDATE ON hr_emp_backup TO your_role; */

GRANT INSERT, UPDATE
ON hr_emp_backup
TO your_role;




/* M8. Run UPDATE on hr_emp_backup for 3 rows, then ROLLBACK. Check SQL%ROWCOUNT after UPDATE (in PL/SQL) and after ROLLBACK.
Hint: After UPDATE, SQL%ROWCOUNT = 3; after ROLLBACK, the updates are undone. */

BEGIN

UPDATE hr_emp_backup
SET salary = salary + 100
WHERE department_id = 60;

DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);

ROLLBACK;

END;
/




/* M9. Create a role hr_report and grant it SELECT on hr.employees and hr.departments.
Hint: CREATE ROLE hr_report; GRANT SELECT ON hr.employees TO hr_report; GRANT SELECT ON hr.departments TO hr_report; */

CREATE ROLE hr_report;

GRANT SELECT
ON hr.employees
TO hr_report;

GRANT SELECT
ON hr.departments
TO hr_report;




/* M10. After a DELETE from hr_emp_backup, do not COMMIT. In another session (or same), can you see the deleted rows before COMMIT?
Hint: In the same session, the rows are gone; in another session with read consistency, they may still be visible until the first session commits. */

DELETE FROM hr_emp_backup
WHERE employee_id = 105;

SELECT *
FROM hr_emp_backup
WHERE employee_id = 105;




/* M11. Write a script: UPDATE one row, SAVEPOINT a, UPDATE another row, SAVEPOINT b, UPDATE a third row, ROLLBACK TO SAVEPOINT a, then COMMIT. Which rows are updated permanently?
Hint: Only the first update; second and third are rolled back. */

UPDATE hr_emp_backup
SET salary = salary + 100
WHERE employee_id = 106;

SAVEPOINT a;

UPDATE hr_emp_backup
SET salary = salary + 200
WHERE employee_id = 107;

SAVEPOINT b;

UPDATE hr_emp_backup
SET salary = salary + 300
WHERE employee_id = 108;

ROLLBACK TO a;

COMMIT;




/* M12. Grant SELECT on hr.employees to a user. Then revoke it.
Hint: GRANT SELECT ON hr.employees TO user1; REVOKE SELECT ON hr.employees FROM user1; */

GRANT SELECT
ON hr.employees
TO user1;

REVOKE SELECT
ON hr.employees
FROM user1;




/* M13. In a single transaction, run two UPDATEs on hr_emp_backup (different departments). Then COMMIT. How many rows are committed?
Hint: All rows updated by both UPDATEs are committed together. */

UPDATE hr_emp_backup
SET salary = salary + 500
WHERE department_id = 50;

UPDATE hr_emp_backup
SET salary = salary + 1000
WHERE department_id = 60;

COMMIT;




/* M14. Create a role and grant it only SELECT on hr.departments (no other tables).
Hint: CREATE ROLE dept_reader; GRANT SELECT ON hr.departments TO dept_reader; */

CREATE ROLE dept_reader;

GRANT SELECT
ON hr.departments
TO dept_reader;




/* M15. After an UPDATE, run SELECT to verify, then ROLLBACK. Why is ROLLBACK useful here?
Hint: To discard the change if the SELECT showed something wrong. */

UPDATE hr_emp_backup
SET salary = salary + 200
WHERE employee_id = 109;

SELECT *
FROM hr_emp_backup
WHERE employee_id = 109;

ROLLBACK;




/* M16. Use two savepoints: after first UPDATE (sp1), after second UPDATE (sp2). Then ROLLBACK TO sp1. What happens to the second update?
Hint: The second update is undone; first remains in the transaction. */

UPDATE hr_emp_backup
SET salary = salary + 100
WHERE employee_id = 110;

SAVEPOINT sp1;

UPDATE hr_emp_backup
SET salary = salary + 200
WHERE employee_id = 111;

SAVEPOINT sp2;

ROLLBACK TO sp1;




/* M17. List the privileges you would need (as DBA) to allow a user to create a table and insert into hr.employees (conceptual).
Hint: CREATE TABLE (system), INSERT on hr.employees (object), and possibly quota on tablespace. */

GRANT CREATE TABLE
TO app_user;

GRANT INSERT
ON hr.employees
TO app_user;




/* M18. Run UPDATE on hr_emp_backup, then COMMIT. Run another UPDATE, then ROLLBACK. Is the first update still committed?
Hint: Yes; ROLLBACK only undoes the second update. */

UPDATE hr_emp_backup
SET salary = salary + 500
WHERE employee_id = 112;

COMMIT;

UPDATE hr_emp_backup
SET salary = salary + 1000
WHERE employee_id = 113;

ROLLBACK;




/* M19. Grant a role to a user: GRANT hr_reader TO app_user; What can app_user do?
Hint: Whatever privileges were granted to hr_reader (e.g. SELECT on hr.employees and hr.departments). */

GRANT hr_reader
TO app_user;




/* M20. In one transaction, DELETE 5 rows from hr_emp_backup, then ROLLBACK. Verify the 5 rows are back.
Hint: DELETE ... WHERE ... ; ROLLBACK; SELECT COUNT(*) should show rows restored. */

DELETE FROM hr_emp_backup
WHERE department_id = 90;

ROLLBACK;

SELECT COUNT(*)
FROM hr_emp_backup
WHERE department_id = 90;

/* H1. Implement a "try and undo" pattern: UPDATE 10 rows, check SQL%ROWCOUNT, if not 10 then ROLLBACK else COMMIT (in PL/SQL).
Hint: BEGIN UPDATE ... ; IF SQL%ROWCOUNT != 10 THEN ROLLBACK; ELSE COMMIT; END IF; END; */

BEGIN

UPDATE hr_emp_backup
SET salary = salary + 1000
WHERE department_id = 50;

IF SQL%ROWCOUNT != 10 THEN
ROLLBACK;
ELSE
COMMIT;
END IF;

END;
/




/* H2. Create two savepoints. After three UPDATEs (one after each savepoint), ROLLBACK TO the first savepoint. Then COMMIT. Which updates are permanent?
Hint: Only the first update (before first savepoint) is committed; the other two are rolled back. */

UPDATE hr_emp_backup
SET salary = salary + 500
WHERE employee_id = 114;

SAVEPOINT sp1;

UPDATE hr_emp_backup
SET salary = salary + 1000
WHERE employee_id = 115;

SAVEPOINT sp2;

UPDATE hr_emp_backup
SET salary = salary + 1500
WHERE employee_id = 116;

ROLLBACK TO sp1;

COMMIT;




/* H3. Write a script that grants SELECT, INSERT, UPDATE on hr.employees to role hr_hrw (read and write), then revokes UPDATE only.
Hint: GRANT SELECT, INSERT, UPDATE ON hr.employees TO hr_hrw; REVOKE UPDATE ON hr.employees FROM hr_hrw; */

GRANT SELECT, INSERT, UPDATE
ON hr.employees
TO hr_hrw;

REVOKE UPDATE
ON hr.employees
FROM hr_hrw;




/* H4. In a transaction, update salary for department 50, savepoint, update salary for department 60, rollback to savepoint, update salary for department 70, commit. Which departments are updated?
Hint: 50 and 70; 60 is rolled back. */

UPDATE hr_emp_backup
SET salary = salary * 1.10
WHERE department_id = 50;

SAVEPOINT sp1;

UPDATE hr_emp_backup
SET salary = salary * 1.20
WHERE department_id = 60;

ROLLBACK TO sp1;

UPDATE hr_emp_backup
SET salary = salary * 1.15
WHERE department_id = 70;

COMMIT;




/* H5. Explain: Session A updates a row and does not commit. Session B updates the same row. What happens?
Hint: Session B blocks (waits) until A commits or rolls back; then B proceeds or gets a conflict depending on isolation. */

-- Session A

UPDATE hr_emp_backup
SET salary = salary + 100
WHERE employee_id = 117;

-- no commit


-- Session B

UPDATE hr_emp_backup
SET salary = salary + 200
WHERE employee_id = 117;




/* H6. Create a role that has SELECT on hr.employees and hr.departments, and grant that role to two different users (placeholder names).
Hint: CREATE ROLE r; GRANT SELECT ON hr.employees TO r; GRANT SELECT ON hr.departments TO r; GRANT r TO u1; GRANT r TO u2; */

CREATE ROLE hr_reader;

GRANT SELECT
ON hr.employees
TO hr_reader;

GRANT SELECT
ON hr.departments
TO hr_reader;

GRANT hr_reader TO user1;

GRANT hr_reader TO user2;




/* H7. Run UPDATE on hr_emp_backup, then create savepoint, then DELETE 1 row, then ROLLBACK TO SAVEPOINT, then COMMIT. Is the row deleted?
Hint: No; the DELETE was rolled back. Only the UPDATE is committed. */

UPDATE hr_emp_backup
SET salary = salary + 500
WHERE employee_id = 118;

SAVEPOINT sp1;

DELETE FROM hr_emp_backup
WHERE employee_id = 119;

ROLLBACK TO sp1;

COMMIT;




/* H8. What object privilege is needed to allow a user to run SELECT * FROM hr.employees?
Hint: SELECT on hr.employees (and possibly on schema/table if qualified). */

GRANT SELECT
ON hr.employees
TO app_user;




/* H9. In one transaction, INSERT one row, SAVEPOINT, INSERT another row, ROLLBACK TO SAVEPOINT, COMMIT. How many rows are in the table?
Hint: One (the first insert); the second insert was rolled back. */

INSERT INTO hr_emp_backup (
employee_id,
first_name,
last_name,
email,
hire_date,
job_id
)
VALUES (
901,
'RAVI',
'KUMAR',
'RAVI901',
SYSDATE,
'IT_PROG'
);

SAVEPOINT sp1;

INSERT INTO hr_emp_backup (
employee_id,
first_name,
last_name,
email,
hire_date,
job_id
)
VALUES (
902,
'RAJU',
'KUMAR',
'RAJU902',
SYSDATE,
'IT_PROG'
);

ROLLBACK TO sp1;

COMMIT;




/* H10. Grant SELECT on hr.employees to a role, then grant that role to a user. Then revoke the role from the user. Can the user still query hr.employees?
Hint: No; revoking the role removes the privilege. */

CREATE ROLE hr_select_role;

GRANT SELECT
ON hr.employees
TO hr_select_role;

GRANT hr_select_role
TO app_user;

REVOKE hr_select_role
FROM app_user;
