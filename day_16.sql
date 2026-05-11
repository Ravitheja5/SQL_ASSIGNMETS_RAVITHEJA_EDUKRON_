-- =========================================================
-- DAY 16 ASSIGNMENT: CONSTRAINTS
-- =========================================================



-- =========================================================
-- Part 1: Practice Questions (With Answers and Explanations)
-- =========================================================



-- =========================================================
-- Question 1
-- Create table hr_emp_copy with PRIMARY KEY
-- and FOREIGN KEY
-- =========================================================

CREATE TABLE hr_emp_copy
(
    employee_id   NUMBER(6),
    first_name    VARCHAR2(20),
    last_name     VARCHAR2(25),
    department_id NUMBER(4),

    PRIMARY KEY (employee_id),

    FOREIGN KEY (department_id)
    REFERENCES hr.departments(department_id)
);



-- =========================================================
-- Question 2
-- Add CHECK constraint on salary > 0
-- =========================================================

ALTER TABLE hr_emp_copy
ADD salary NUMBER(8,2);

ALTER TABLE hr_emp_copy
ADD CONSTRAINT chk_salary
CHECK (salary > 0);



-- =========================================================
-- Question 3
-- Find constraint names and types for hr.employees
-- =========================================================

SELECT constraint_name,
       constraint_type,
       table_name
FROM user_constraints
WHERE table_name = 'EMPLOYEES';



-- =========================================================
-- Part 2: Self-Practice
-- =========================================================



-- =========================================================
-- 1. Add UNIQUE constraint on (department_id, job_id)
-- =========================================================

ALTER TABLE hr_emp_copy
ADD job_id VARCHAR2(20);

ALTER TABLE hr_emp_copy
ADD CONSTRAINT uk_dept_job
UNIQUE (department_id, job_id);



-- =========================================================
-- 2. Disable and enable constraint
-- =========================================================

ALTER TABLE hr_emp_copy
DISABLE CONSTRAINT uk_dept_job;

ALTER TABLE hr_emp_copy
ENABLE CONSTRAINT uk_dept_job;



-- =========================================================
-- Part 3: Additional Practice — 20 Medium Questions
-- =========================================================



-- M1
-- Create table with PRIMARY KEY

CREATE TABLE emp_test1
(
    employee_id NUMBER(6) PRIMARY KEY,
    first_name  VARCHAR2(20)
);



-- M2
-- Add FOREIGN KEY constraint

ALTER TABLE hr_emp_copy
ADD CONSTRAINT fk_dept
FOREIGN KEY (department_id)
REFERENCES hr.departments(department_id);



-- M3
-- Add CHECK salary > 0

ALTER TABLE hr_emp_copy
ADD CONSTRAINT chk_sal
CHECK (salary > 0);



-- M4
-- Add NOT NULL to first_name

ALTER TABLE hr_emp_copy
MODIFY first_name NOT NULL;



-- M5
-- Add UNIQUE constraint on email

ALTER TABLE hr_emp_copy
ADD email VARCHAR2(50);

ALTER TABLE hr_emp_copy
ADD CONSTRAINT uk_email
UNIQUE (email);



-- M6
-- Named PRIMARY KEY constraint

CREATE TABLE emp_test2
(
    employee_id NUMBER(6),

    CONSTRAINT pk_emp_copy
    PRIMARY KEY (employee_id)
);



-- M7
-- Drop CHECK constraint

ALTER TABLE hr_emp_copy
DROP CONSTRAINT chk_salary;



-- M8
-- Composite PRIMARY KEY

CREATE TABLE emp_test3
(
    department_id NUMBER(4),
    employee_id   NUMBER(6),

    PRIMARY KEY (department_id, employee_id)
);



-- M9
-- CHECK no future hire date

ALTER TABLE hr_emp_copy
ADD hire_date DATE;

ALTER TABLE hr_emp_copy
ADD CONSTRAINT chk_hire
CHECK (hire_date <= SYSDATE);



-- M10
-- Add FK manager_id

ALTER TABLE hr_emp_copy
ADD manager_id NUMBER(6);

ALTER TABLE hr_emp_copy
ADD CONSTRAINT fk_manager
FOREIGN KEY (manager_id)
REFERENCES hr.employees(employee_id);



-- M11
-- List constraints on hr.employees

SELECT constraint_name,
       constraint_type
FROM user_constraints
WHERE table_name = 'EMPLOYEES';



-- M12
-- CHECK commission_pct between 0 and 1

ALTER TABLE hr_emp_copy
ADD commission_pct NUMBER(2,2);

ALTER TABLE hr_emp_copy
ADD CONSTRAINT chk_comm
CHECK (commission_pct BETWEEN 0 AND 1);



-- M13
-- UNIQUE full name

ALTER TABLE hr_emp_copy
ADD CONSTRAINT uk_name
UNIQUE (first_name, last_name);



-- M14
-- Modify column NOT NULL

ALTER TABLE hr_emp_copy
MODIFY last_name NOT NULL;



-- M15
-- Create table with PK and two FK

CREATE TABLE emp_test4
(
    employee_id   NUMBER(6),
    department_id NUMBER(4),
    manager_id    NUMBER(6),

    CONSTRAINT pk_emp4
    PRIMARY KEY (employee_id),

    CONSTRAINT fk_emp4_dept
    FOREIGN KEY (department_id)
    REFERENCES hr.departments(department_id),

    CONSTRAINT fk_emp4_mgr
    FOREIGN KEY (manager_id)
    REFERENCES hr.employees(employee_id)
);



-- M16
-- Drop foreign key constraint

ALTER TABLE hr_emp_copy
DROP CONSTRAINT fk_dept;



-- M17
-- CHECK employee_id > 0

ALTER TABLE hr_emp_copy
ADD CONSTRAINT chk_empid
CHECK (employee_id > 0);



-- M18
-- Find constraint types for hr.departments

SELECT constraint_name,
       constraint_type
FROM user_constraints
WHERE table_name = 'DEPARTMENTS';



-- M19
-- Add DEFAULT 0 and NOT NULL

ALTER TABLE hr_emp_copy
ADD bonus NUMBER DEFAULT 0 NOT NULL;



-- M20
-- Named CHECK constraint

ALTER TABLE hr_emp_copy
ADD CONSTRAINT chk_bonus
CHECK (bonus >= 0);



-- =========================================================
-- HARD QUESTIONS
-- =========================================================



-- H1
-- Create table with PK, FK and CHECK constraints

CREATE TABLE emp_hard1
(
    employee_id    NUMBER(6),
    department_id  NUMBER(4),
    salary         NUMBER(8,2),
    commission_pct NUMBER(2,2),

    CONSTRAINT pk_h1
    PRIMARY KEY (employee_id),

    CONSTRAINT fk_h1_dept
    FOREIGN KEY (department_id)
    REFERENCES hr.departments(department_id),

    CONSTRAINT chk_h1_sal
    CHECK (salary > 0),

    CONSTRAINT chk_h1_comm
    CHECK (commission_pct BETWEEN 0 AND 1)
);



-- H2
-- FK with ON DELETE SET NULL

ALTER TABLE hr_emp_copy
ADD CONSTRAINT fk_delete_null
FOREIGN KEY (department_id)
REFERENCES hr.departments(department_id)
ON DELETE SET NULL;



-- H3
-- Disable and enable constraint

ALTER TABLE hr_emp_copy
DISABLE CONSTRAINT chk_sal;

ALTER TABLE hr_emp_copy
ENABLE CONSTRAINT chk_sal;



-- H4
-- CHECK using two columns

ALTER TABLE hr_emp_copy
ADD CONSTRAINT chk_salary_comm
CHECK (salary >= NVL(commission_pct,0) * 1000);



-- H5
-- DEFERRABLE PRIMARY KEY

CREATE TABLE emp_hard5
(
    employee_id NUMBER(6),

    CONSTRAINT pk_h5
    PRIMARY KEY (employee_id)
    DEFERRABLE INITIALLY DEFERRED
);



-- H6
-- List constraints and columns for hr.employees

SELECT uc.constraint_name,
       uc.constraint_type,
       ucc.column_name
FROM user_constraints uc
JOIN user_cons_columns ucc
ON uc.constraint_name = ucc.constraint_name
WHERE uc.table_name = 'EMPLOYEES';



-- H7
-- FK manager_id to employees

ALTER TABLE hr_emp_copy
ADD CONSTRAINT fk_mgr_emp
FOREIGN KEY (manager_id)
REFERENCES hr.employees(employee_id);



-- H8
-- CHECK hire_date >= 1990

ALTER TABLE hr_emp_copy
ADD CONSTRAINT chk_hire_1990
CHECK (hire_date >= DATE '1990-01-01');



-- H9
-- UNIQUE constraint on department_id and job_id

ALTER TABLE hr_emp_copy
ADD CONSTRAINT uk_dept_job2
UNIQUE (department_id, job_id);



-- H10
-- Find CHECK constraints

SELECT constraint_name
FROM user_constraints
WHERE table_name = 'HR_EMP_COPY'
AND constraint_type = 'C';



-- H11
-- Update NULLs then add NOT NULL

UPDATE hr_emp_copy
SET first_name = 'UNKNOWN'
WHERE first_name IS NULL;

ALTER TABLE hr_emp_copy
MODIFY first_name NOT NULL;



-- H12
-- Self reference FK

ALTER TABLE hr_emp_copy
ADD CONSTRAINT fk_self_mgr
FOREIGN KEY (manager_id)
REFERENCES hr_emp_copy(employee_id);



-- H13
-- Create table with PK, 2 FK and CHECK

CREATE TABLE emp_hard13
(
    employee_id   NUMBER(6),
    department_id NUMBER(4),
    manager_id    NUMBER(6),
    salary        NUMBER(8,2),

    CONSTRAINT pk_h13
    PRIMARY KEY (employee_id),

    CONSTRAINT fk_h13_dept
    FOREIGN KEY (department_id)
    REFERENCES hr.departments(department_id),

    CONSTRAINT fk_h13_mgr
    FOREIGN KEY (manager_id)
    REFERENCES hr.employees(employee_id),

    CONSTRAINT chk_h13_sal
    CHECK (salary > 0)
);



-- H14
-- Find tables referencing hr.departments

SELECT table_name,
       constraint_name
FROM user_constraints
WHERE r_constraint_name =
(
    SELECT constraint_name
    FROM user_constraints
    WHERE table_name = 'DEPARTMENTS'
    AND constraint_type = 'P'
);



-- H15
-- CHECK length of first_name

ALTER TABLE hr_emp_copy
ADD CONSTRAINT chk_fname_len
CHECK (LENGTH(first_name) >= 2);



-- H16
-- Enable VALIDATE constraint

ALTER TABLE hr_emp_copy
ENABLE VALIDATE CONSTRAINT chk_sal;



-- H17
-- Composite UNIQUE and FK

ALTER TABLE hr_emp_copy
ADD CONSTRAINT uk_h17
UNIQUE (department_id, job_id);

ALTER TABLE hr_emp_copy
ADD CONSTRAINT fk_h17
FOREIGN KEY (department_id)
REFERENCES hr.departments(department_id);



-- H18
-- Trigger for maximum salary validation

CREATE OR REPLACE TRIGGER trg_salary_limit
BEFORE INSERT OR UPDATE
ON hr_emp_copy
FOR EACH ROW
BEGIN
    IF :NEW.salary >
    (
        SELECT MAX(salary)
        FROM hr.employees
    )
    THEN
        RAISE_APPLICATION_ERROR
        (
            -20001,
            'Salary exceeds allowed maximum'
        );
    END IF;
END;
/



-- H19
-- Rename constraint

ALTER TABLE hr_emp_copy
RENAME CONSTRAINT chk_bonus TO chk_bonus_new;



-- H20
-- List CHECK constraints and conditions

SELECT constraint_name,
       constraint_type,
       search_condition
FROM user_constraints
WHERE table_name = 'HR_EMP_COPY'
AND constraint_type = 'C';
