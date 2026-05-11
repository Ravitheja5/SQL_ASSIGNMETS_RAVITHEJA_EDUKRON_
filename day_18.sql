-- =========================================================
-- DAY 18 ASSIGNMENT: INDEXES
-- =========================================================



-- =========================================================
-- Part 1: Practice Questions
-- =========================================================



-- =========================================================
-- Question 1
-- Write SQL to create index on
-- hr.employees(department_id)
-- =========================================================

CREATE INDEX idx_emp_dept
ON hr.employees(department_id);



-- =========================================================
-- Question 2
-- Create composite index on
-- hr.employees(department_id, job_id)
-- =========================================================

CREATE INDEX idx_emp_dept_job
ON hr.employees(department_id, job_id);



-- =========================================================
-- Question 3
-- Explain whether index on salary
-- would be used for salary > 5000
-- =========================================================

-- Answer:

-- If many rows satisfy condition,
-- optimizer may choose full table scan.

-- If few rows satisfy condition,
-- optimizer may use index range scan.

-- Depends on:
-- 1. Selectivity
-- 2. Table size
-- 3. Statistics



-- =========================================================
-- Part 2: Self-Practice
-- =========================================================



-- =========================================================
-- 1. CREATE INDEX for hire_date range queries
-- =========================================================

CREATE INDEX idx_emp_hire
ON hr.employees(hire_date);



-- =========================================================
-- 2. When full table scan preferred?
-- =========================================================

-- Answer:

-- Full table scan preferred when:
-- 1. Table is small
-- 2. Large percentage of rows returned
-- 3. Low selectivity



-- =========================================================
-- Part 3: Additional Practice — 20 Medium Questions
-- =========================================================



-- =========================================================
-- M1
-- Create index on hr.employees(department_id)
-- =========================================================

CREATE INDEX idx_emp_dept
ON hr.employees(department_id);



-- =========================================================
-- M2
-- Create index on hr.employees(salary)
-- =========================================================

CREATE INDEX idx_emp_sal
ON hr.employees(salary);



-- =========================================================
-- M3
-- Create composite index
-- (department_id, job_id)
-- =========================================================

CREATE INDEX idx_dj
ON hr.employees(department_id, job_id);



-- =========================================================
-- M4
-- Create index on hire_date
-- =========================================================

CREATE INDEX idx_hire
ON hr.employees(hire_date);



-- =========================================================
-- M5
-- Create unique index on email
-- =========================================================

CREATE UNIQUE INDEX idx_email
ON hr.employees(email);



-- =========================================================
-- M6
-- When would index on department_id help?
-- =========================================================

-- Answer:

-- Useful for:
-- WHERE department_id = ?
-- JOIN using department_id



-- =========================================================
-- M7
-- Name index meaningfully
-- =========================================================

-- Examples:

-- idx_emp_dept
-- idx_emp_salary
-- idx_emp_hire



-- =========================================================
-- M8
-- Create index on hr.departments(department_id)
-- =========================================================

CREATE INDEX idx_dept_id
ON hr.departments(department_id);



-- =========================================================
-- M9
-- Why composite index order matters?
-- =========================================================

-- Answer:

-- Leading column used first.

-- (department_id, job_id)
-- supports:
-- department_id
-- department_id + job_id

-- Not efficient for:
-- job_id alone



-- =========================================================
-- M10
-- When low-cardinality index may not help?
-- =========================================================

-- Answer:

-- Few distinct values.

-- Example:
-- gender column.

-- Optimizer may prefer full scan.



-- =========================================================
-- M11
-- Create index for ORDER BY hire_date
-- =========================================================

CREATE INDEX idx_hire_date
ON hr.employees(hire_date);



-- =========================================================
-- M12
-- Drop index by name
-- =========================================================

DROP INDEX idx_emp_sal;



-- =========================================================
-- M13
-- Default Oracle index type
-- =========================================================

-- Answer:

-- B-tree index



-- =========================================================
-- M14
-- Index for salary > 5000
-- =========================================================

CREATE INDEX idx_salary
ON hr.employees(salary);



-- =========================================================
-- M15
-- Why not index every column?
-- =========================================================

-- Answer:

-- 1. Extra storage
-- 2. Slower INSERT/UPDATE/DELETE
-- 3. Optimizer may ignore indexes



-- =========================================================
-- M16
-- Composite index (job_id, department_id)
-- which predicates can use it?
-- =========================================================

CREATE INDEX idx_job_dept
ON hr.employees(job_id, department_id);

-- Supports:
-- WHERE job_id = ?
-- WHERE job_id = ? AND department_id = ?

-- Not efficient for:
-- WHERE department_id = ?



-- =========================================================
-- M17
-- Create index on hr.departments(location_id)
-- =========================================================

CREATE INDEX idx_dept_loc
ON hr.departments(location_id);



-- =========================================================
-- M18
-- What is covering index?
-- =========================================================

-- Answer:

-- Index containing all columns
-- required by query.

-- Avoids table access.



-- =========================================================
-- M19
-- When INSERT becomes slower?
-- =========================================================

-- Answer:

-- More indexes on table.

-- Every index must update
-- during INSERT.



-- =========================================================
-- M20
-- Index for COUNT(*) WHERE department_id = 50
-- =========================================================

CREATE INDEX idx_count_dept
ON hr.employees(department_id);



-- =========================================================
-- HARD QUESTIONS
-- =========================================================



-- =========================================================
-- H1
-- Composite index for:
-- department_id = ?
-- AND job_id = ?
-- AND salary > ?
-- =========================================================

CREATE INDEX idx_h1
ON hr.employees(department_id, job_id, salary);



-- =========================================================
-- H2
-- When full table scan chosen over index?
-- =========================================================

-- Answer:

-- 1. Large percentage rows returned
-- 2. Small table
-- 3. Low selectivity



-- =========================================================
-- H3
-- Function-based index UPPER(last_name)
-- =========================================================

CREATE INDEX idx_upper_last
ON hr.employees(UPPER(last_name));



-- =========================================================
-- H4
-- Explain index range scan
-- for salary BETWEEN 5000 AND 10000
-- =========================================================

-- Answer:

-- B-tree finds first value >= 5000
-- scans until values > 10000.



-- =========================================================
-- H5
-- Why composite better than two indexes?
-- =========================================================

-- Answer:

-- One index lookup.

-- Composite index satisfies
-- both conditions together.



-- =========================================================
-- H6
-- What is index skip scan?
-- =========================================================

-- Answer:

-- Oracle uses composite index
-- even when leading column missing
-- if few distinct leading values exist.



-- =========================================================
-- H7
-- Index for ORDER BY
-- department_id, salary DESC
-- =========================================================

CREATE INDEX idx_dept_sal
ON hr.employees(department_id, salary DESC);



-- =========================================================
-- H8
-- Function on column prevents index use
-- =========================================================

-- Example:

SELECT *
FROM hr.employees
WHERE TRUNC(hire_date) = SYSDATE;

-- Better:

CREATE INDEX idx_trunc_hire
ON hr.employees(TRUNC(hire_date));



-- =========================================================
-- H9
-- Monitor index usage
-- =========================================================

SELECT *
FROM user_indexes;

-- Oracle monitoring:
-- V$OBJECT_USAGE



-- =========================================================
-- H10
-- Partial index concept
-- =========================================================

-- Some databases allow:
-- CREATE INDEX ...
-- WHERE condition

-- Oracle has limited support.



-- =========================================================
-- H11
-- Composite index
-- (manager_id, department_id)
-- =========================================================

CREATE INDEX idx_mgr_dept
ON hr.employees(manager_id, department_id);

-- Useful for:
-- WHERE manager_id = ?
-- AND department_id = ?



-- =========================================================
-- H12
-- Why unique index on email?
-- =========================================================

-- Answer:

-- 1. Enforces uniqueness
-- 2. Fast lookup
-- 3. Useful for login/search



-- =========================================================
-- H13
-- Rebuild index
-- =========================================================

ALTER INDEX idx_emp_dept
REBUILD;



-- =========================================================
-- H14
-- Index on
-- (department_id, hire_date)
-- =========================================================

CREATE INDEX idx_dept_hire
ON hr.employees(department_id, hire_date);



-- =========================================================
-- H15
-- Why optimizer chooses full scan despite index?
-- =========================================================

-- Answer:

-- 1. Large rows returned
-- 2. Poor clustering factor
-- 3. Statistics favor full scan



-- =========================================================
-- H16
-- Index for JOIN on department_id
-- =========================================================

CREATE INDEX idx_join_dept
ON hr.employees(department_id);



-- =========================================================
-- H17
-- Bitmap index concept
-- =========================================================

-- Used for:
-- low-cardinality columns
-- data warehouse
-- read-heavy systems



-- =========================================================
-- H18
-- Why not composite
-- (salary, department_id)
-- for department_id filter?
-- =========================================================

-- Answer:

-- Leading column should be
-- department_id.

-- Otherwise index inefficient
-- for department_id predicate.



-- =========================================================
-- H19
-- Invisible index purpose
-- =========================================================

ALTER INDEX idx_emp_dept
INVISIBLE;

-- Used to test impact
-- before dropping index.



-- =========================================================
-- H20
-- List indexes on hr.employees
-- =========================================================

SELECT index_name,
       column_name
FROM user_ind_columns
WHERE table_name = 'EMPLOYEES';
