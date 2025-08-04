--CREATE ENUM FUNCTION FOR TABLE EMPLOYEE.

CREATE TYPE position_enum AS ENUM (
    'Associate professor',
    'senior professor',
    'Principal',
    'clerk',
    'Director',
    'Vice President'
);

--ALTER TABLE EMPLOYEE AND ADD THE COLUMN POSITION

alter table EMPLOYEE add column POSITION position_enum;

SELECT * FROM EMPLOYEE;

update EMPLOYEE set position = 'clerk' WHERE EMPLOYEE_ID = 3;

update EMPLOYEE set position = 'Associate professor' WHERE EMPLOYEE_ID = 1;

update EMPLOYEE set position = 'cler' WHERE EMPLOYEE_ID = 2;

 --ERROR:  invalid input value for enum position_enum: "cler"

 --CREATE DOMAIN

 -- Domain for email addresses
CREATE DOMAIN email_type AS VARCHAR(255)
    CHECK (VALUE ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

ALTER TABLE employee
ALTER COLUMN email TYPE email_type;

-- Create the mobile number domain first
CREATE DOMAIN mobile_type AS VARCHAR(15)
    CHECK (VALUE ~ '^\d{10}$');

-- Add the new column using the domain
ALTER TABLE employee
ADD COLUMN mobile_no mobile_type;

DROP DOMAIN IF EXISTS email_type;

ALTER TABLE EMPLOYEE


INSERT INTO employee (
    employee_id,
    first_name,
    last_name,
    email,
	department,
	salary,
	date_of_joining,
    position,
    mobile_no
) VALUES 
(11,'Amit', 'Sharma', 'amit.sharma@example.com','Finance',60000,'2025-02-03','senior professor', 9876543210),
(13,'Aarav', 'Sharma', 'aarav.sharma@example.com','HR',70000,'2024-02-03','Director', 9833234534);


select * from employee;

--Create a function with multi if.

create or replace function checkstatus(salary numeric)
RETURNS varchar as $$
BEGIN
		if salary > 70000 THEN  
			return 'Executive';
		else 
			return 'Senior_level';
		end if;
END;
$$ LANGUAGE plpgsql;

select * from employee;

select first_name, email, department,salary, checkstatus(salary) from employee;





