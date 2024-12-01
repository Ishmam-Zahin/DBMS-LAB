SELECT e.employee_name
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'Sonali';

SELECT e.employee_name, e.street, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'Agrani';

SELECT *
FROM employee NATURAL JOIN works
WHERE company_name = 'Sonali' && (salary * 12) > 120000;

SELECT employee_name
FROM employee NATURAL JOIN works NATURAL JOIN company;

SELECT a.employee_name
from (employee AS a JOIN manages on a.employee_name = manages.employee_name) JOIN employee AS b ON manages.manager_name = b.employee_name && a.street = b.street && b.city = a.city;

SELECT employee_name
FROM employee
WHERE employee_name NOT IN (
    SELECT employee_name
    FROM works
    WHERE company_name = 'Sonali'
);


SELECT employee_name
from works
where salary > ALL (
	SELECT salary
    from works
    WHERE company_name = 'Janata'
);

SELECT a.employee_name
FROM works AS a JOIN (
    SELECT AVG(salary) as avg_salary, company_name
    FROM works
    GROUP BY company_name
) AS b on a.company_name = b.company_name && a.salary > b.avg_salary;

SELECT a.employee_name
FROM works AS a JOIN (
    SELECT AVG(salary) as avg_salary, company_name
    FROM works
    GROUP BY company_name
) AS b on a.company_name = b.company_name && a.salary > b.avg_salary;

SELECT COUNT(company_name) as no_of_employee, company_name
FROM works
GROUP BY company_name
ORDER BY no_of_employee DESC
LIMIT 1;

SELECT SUM(salary) as payroll, company_name
FROM works
GROUP BY company_name
ORDER BY payroll DESC
LIMIT 1;

SELECT SUM(salary) as payroll, company_name
FROM works
GROUP BY company_name
ORDER BY payroll ASC
LIMIT 1;

SELECT company_name, AVG(salary) AS average_salary
FROM works
GROUP BY company_name
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM works
    WHERE company_name = 'Agrani'
);

UPDATE employee
SET city = 'Natore'
WHERE employee_name = 'Arif';

UPDATE works
SET salary = salary * 1.10
WHERE company_name = 'Agrani';

UPDATE works
SET salary = salary * 1.10
WHERE employee_name IN (
    SELECT manages.manager_name
    FROM manages
    JOIN works ON manages.employee_name = works.employee_name
    WHERE works.company_name = 'Agrani'
);


UPDATE works
SET salary = CASE
    WHEN salary * 1.10 <= 19000 THEN salary * 1.10
    ELSE salary * 1.03
END
WHERE employee_name IN (
    SELECT DISTINCT manager_name
    FROM manages
);


CREATE VIEW myview AS
SELECT AVG(salary) as avg_salary, manager_name
FROM manages NATURAL JOIN works
GROUP BY manager_name;
