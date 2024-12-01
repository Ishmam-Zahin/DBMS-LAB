-- exmaple-2
SELECT employee_name from employee
WHERE city = 'Rajshahi';

SELECT employee_name, street from employee
WHERE city = 'Rajshahi';

SELECT employee_name from works
WHERE company_name = 'Sonali';

SELECT employee_name from works
WHERE company_name = 'Agrani';

SELECT employee_name from works
WHERE company_name = 'Janata';

SELECT employee_name, salary from works
WHERE company_name = 'Sonali';

SELECT employee_name, salary from works
WHERE company_name = 'Agrani';

SELECT employee_name, salary from works
WHERE company_name = 'Janata';

SELECT employee_name FROM works
WHERE salary = 12000;

SELECT employee_name FROM works
WHERE salary >= 12000;

SELECT employee_name FROM works
WHERE salary < 12000;

SELECT employee_name, company_name
FROM works
WHERE salary = 12000;

SELECT employee_name, company_name
FROM works
WHERE salary >= 12000;

SELECT employee_name, company_name
FROM works
WHERE salary < 12000;

SELECT employee_name, street, city
FROM employee NATURAL JOIN works
WHERE company_name = 'Agrani';

SELECT employee_name, street, city
FROM employee NATURAL JOIN works
WHERE salary >= 10000;

SELECT employee_name, company_name, salary
FROM employee NATURAL JOIN works
WHERE city = 'Rajshahi';

SELECT employee_name, street, city
FROM employee NATURAL JOIN works
WHERE company_name = 'Sonali' && salary >= 12000;

SELECT employee_name, street, city
FROM employee NATURAL JOIN works
WHERE company_name != 'Sonali';

UPDATE employee
SET
city = 'Natore'
WHERE employee_name = 'Arif';

UPDATE works
SET
salary = (salary + ((salary * 10)/100))
WHERE company_name = 'Agrani';

DELETE FROM employee
WHERE employee_name = 'Sagor';

ALTER TABLE company
ADD COLUMN manager VARCHAR(100);
