
--1.CREATE DOMAIN FOR DEPARTMENT TABLE AS DEPT_TYPE.

CREATE DOMAIN dept_type as varchar(100)
CHECK (VALUE IN ('science','art','commerce'));

SELECT * FROM COLLEGE

--CREATE TABLE DEPARTMENT.

CREATE TABLE department
(
dept_id serial NOT NULL,
dept_name varchar(100),
dept_type dept_type NOT NULL,
college_id int,
FOREIGN KEY (COLLEGE_ID) REFERENCES COLLEGE(ID));

SELECT * FROM DEPARTMENT;

INSERT INTO DEPARTMENT(DEPT_NAME,DEPT_TYPE,COLLEGE_ID) VALUES ('department of engineering','abc',12);

---ERROR:  value for domain dept_type violates check constraint "dept_type_check" 

INSERT INTO DEPARTMENT(DEPT_NAME,DEPT_TYPE,COLLEGE_ID) VALUES ('department of engineering','science',11);
INSERT INTO DEPARTMENT(DEPT_NAME,DEPT_TYPE,COLLEGE_ID) VALUES ('department of B.COM','commerce',13);

--CREATE A ENUM TYPE FOR TABLE STUDENT1 AS STUDENT_STATUS AND ALTER THE TABLE STUDENT1.

create type  student_status as ENUM ('pass', 'fail', 'grace') 

select * from student1;

ALTER TABLE STUDENT1 
ADD COLUMN status student_status;

--USE THE MULTIIF FUNCTION FOR STUDENT_STATUS.

CREATE OR REPLACE FUNCTION student_status(Grade varchar(100))
RETURNS VARCHAR AS $$
BEGIN
    IF grade = 'A' THEN
        RETURN 'Pass';
    ELSIF grade = 'B' THEN
        RETURN 'Grace';
    ELSE
        RETURN 'Fail';
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT CHECK_STATUS('A');


select first_name,age,grade, email, student_status(Grade) from student1;

