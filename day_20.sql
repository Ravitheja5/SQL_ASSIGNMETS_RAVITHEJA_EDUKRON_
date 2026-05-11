-- =========================================================
-- DAY 20 ASSIGNMENT: PL/SQL BASICS
-- =========================================================



-- =========================================================
-- Part 1: Practice Questions
-- =========================================================



-- =========================================================
-- Question 1
-- Fetch one employee and print name
-- =========================================================

SET SERVEROUTPUT ON

DECLARE
    v_first_name hr.employees.first_name%TYPE;
    v_last_name  hr.employees.last_name%TYPE;
BEGIN

    SELECT first_name,
           last_name
    INTO v_first_name,
         v_last_name
    FROM hr.employees
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE
    (
        'Employee: ' ||
        v_first_name || ' ' || v_last_name
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found');

END;
/




-- =========================================================
-- Question 2
-- Loop employees in department 50
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    CURSOR c IS
    SELECT employee_id,
           salary
    FROM hr.employees
    WHERE department_id = 50;

BEGIN

    FOR rec IN c LOOP

        DBMS_OUTPUT.PUT_LINE
        (
            'ID: ' || rec.employee_id ||
            ', Salary: ' || rec.salary
        );

    END LOOP;

END;
/




-- =========================================================
-- Question 3
-- Print High earner if salary > 15000
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    v_salary hr.employees.salary%TYPE;

BEGIN

    SELECT salary
    INTO v_salary
    FROM hr.employees
    WHERE employee_id = 100;

    IF v_salary > 15000 THEN

        DBMS_OUTPUT.PUT_LINE('High earner');

    ELSE

        DBMS_OUTPUT.PUT_LINE
        (
            'Salary: ' || v_salary
        );

    END IF;

END;
/




-- =========================================================
-- Part 2: Self Practice
-- =========================================================



-- =========================================================
-- 1. FOR loop from 1 to 10
-- =========================================================

SET SERVEROUTPUT ON

BEGIN

    FOR i IN 1..10 LOOP

        DBMS_OUTPUT.PUT_LINE(i);

    END LOOP;

END;
/




-- =========================================================
-- 2. Use %ROWTYPE
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    v_emp hr.employees%ROWTYPE;

BEGIN

    SELECT *
    INTO v_emp
    FROM hr.employees
    WHERE employee_id = 101;

    DBMS_OUTPUT.PUT_LINE
    (
        v_emp.first_name || ' ' ||
        v_emp.last_name
    );

END;
/




-- =========================================================
-- 20 MEDIUM QUESTIONS
-- =========================================================



-- =========================================================
-- M1
-- Count employees
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    v_count NUMBER;

BEGIN

    SELECT COUNT(*)
    INTO v_count
    FROM hr.employees;

    DBMS_OUTPUT.PUT_LINE(v_count);

END;
/




-- =========================================================
-- M2
-- Fetch first_name
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    v_name VARCHAR2(100);

BEGIN

    SELECT first_name
    INTO v_name
    FROM hr.employees
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE(v_name);

END;
/




-- =========================================================
-- M3
-- Use %TYPE
-- =========================================================

DECLARE

    v_sal hr.employees.salary%TYPE;

BEGIN

    NULL;

END;
/




-- =========================================================
-- M4
-- Use %ROWTYPE
-- =========================================================

DECLARE

    v_emp hr.employees%ROWTYPE;

BEGIN

    SELECT *
    INTO v_emp
    FROM hr.employees
    WHERE employee_id = 100;

END;
/




-- =========================================================
-- M5
-- IF salary > 10000
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    v_salary hr.employees.salary%TYPE;

BEGIN

    SELECT salary
    INTO v_salary
    FROM hr.employees
    WHERE employee_id = 100;

    IF v_salary > 10000 THEN

        DBMS_OUTPUT.PUT_LINE('High');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Low');

    END IF;

END;
/




-- =========================================================
-- M6
-- FOR loop 1 to 5
-- =========================================================

SET SERVEROUTPUT ON

BEGIN

    FOR i IN 1..5 LOOP

        DBMS_OUTPUT.PUT_LINE(i);

    END LOOP;

END;
/




-- =========================================================
-- M7
-- WHILE loop
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    i NUMBER := 0;

BEGIN

    WHILE i < 10 LOOP

        i := i + 1;

        DBMS_OUTPUT.PUT_LINE(i);

    END LOOP;

END;
/




-- =========================================================
-- M8
-- Fetch first_name and last_name
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    v_fname hr.employees.first_name%TYPE;
    v_lname hr.employees.last_name%TYPE;

BEGIN

    SELECT first_name,
           last_name
    INTO v_fname,
         v_lname
    FROM hr.employees
    WHERE employee_id = 101;

    DBMS_OUTPUT.PUT_LINE
    (
        v_fname || ' ' || v_lname
    );

END;
/




-- =========================================================
-- M9
-- Variable in WHERE clause
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    v_dept_id NUMBER := 50;
    v_count   NUMBER;

BEGIN

    SELECT COUNT(*)
    INTO v_count
    FROM hr.employees
    WHERE department_id = v_dept_id;

    DBMS_OUTPUT.PUT_LINE(v_count);

END;
/




-- =========================================================
-- M10
-- LOOP with EXIT WHEN
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    i NUMBER := 0;

BEGIN

    LOOP

        i := i + 1;

        DBMS_OUTPUT.PUT_LINE(i);

        EXIT WHEN i > 3;

    END LOOP;

END;
/




-- =========================================================
-- M11
-- Print Hello and SYSDATE
-- =========================================================

SET SERVEROUTPUT ON

BEGIN

    DBMS_OUTPUT.PUT_LINE
    (
        'Hello ' || TO_CHAR(SYSDATE)
    );

END;
/




-- =========================================================
-- M12
-- Use variable in SELECT INTO
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    v_emp_id NUMBER := 100;
    v_name   VARCHAR2(100);

BEGIN

    SELECT first_name
    INTO v_name
    FROM hr.employees
    WHERE employee_id = v_emp_id;

    DBMS_OUTPUT.PUT_LINE(v_name);

END;
/




-- =========================================================
-- M13
-- ELSIF example
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    v_salary hr.employees.salary%TYPE;

BEGIN

    SELECT salary
    INTO v_salary
    FROM hr.employees
    WHERE employee_id = 100;

    IF v_salary < 5000 THEN

        DBMS_OUTPUT.PUT_LINE('Low');

    ELSIF v_salary < 10000 THEN

        DBMS_OUTPUT.PUT_LINE('Mid');

    ELSE

        DBMS_OUTPUT.PUT_LINE('High');

    END IF;

END;
/




-- =========================================================
-- M14
-- REVERSE loop
-- =========================================================

SET SERVEROUTPUT ON

BEGIN

    FOR i IN REVERSE 1..5 LOOP

        DBMS_OUTPUT.PUT_LINE(i);

    END LOOP;

END;
/




-- =========================================================
-- M15
-- Fetch department_name
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    v_dname hr.departments.department_name%TYPE;

BEGIN

    SELECT department_name
    INTO v_dname
    FROM hr.departments
    WHERE department_id = 10;

    DBMS_OUTPUT.PUT_LINE(v_dname);

END;
/




-- =========================================================
-- M16
-- Assign variables
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    v1 NUMBER;
    v2 NUMBER;

BEGIN

    v1 := 1;

    SELECT 2
    INTO v2
    FROM dual;

    DBMS_OUTPUT.PUT_LINE(v1);
    DBMS_OUTPUT.PUT_LINE(v2);

END;
/




-- =========================================================
-- M17
-- Concatenate variables
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    v_fname VARCHAR2(50) := 'John';
    v_lname VARCHAR2(50) := 'King';

BEGIN

    DBMS_OUTPUT.PUT_LINE
    (
        v_fname || ' ' || v_lname
    );

END;
/




-- =========================================================
-- M18
-- Use %ROWTYPE fields
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    v_emp hr.employees%ROWTYPE;

BEGIN

    SELECT *
    INTO v_emp
    FROM hr.employees
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE
    (
        v_emp.first_name || ' ' ||
        v_emp.last_name
    );

END;
/




-- =========================================================
-- M19
-- LOOP 3 times
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    i NUMBER := 0;

BEGIN

    LOOP

        i := i + 1;

        DBMS_OUTPUT.PUT_LINE(i);

        EXIT WHEN i >= 3;

    END LOOP;

END;
/




-- =========================================================
-- M20
-- IF count > 0
-- =========================================================

SET SERVEROUTPUT ON

DECLARE

    v_count NUMBER;

BEGIN

    SELECT COUNT(*)
    INTO v_count
    FROM hr.employees;

    IF v_count > 0 THEN

        DBMS_OUTPUT.PUT_LINE('Rows exist');

    ELSE

        DBMS_OUTPUT.PUT_LINE('No rows');

    END IF;

END;
/
