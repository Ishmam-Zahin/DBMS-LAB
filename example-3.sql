SELECT name
FROM person
WHERE address = 'Rajshahi';

SELECT c.model
FROM car c
JOIN log l ON c.license = l.license
WHERE c.year = 2013;

SELECT driver
FROM accident
WHERE damage_amount BETWEEN 10000 AND 15000;

SELECT name, address
from owns NATURAL JOIN car NATURAL JOIN person
WHERE model = 'Alto';

SELECT driver
FROM accident
WHERE `date` <= '2011-12-20';

SELECT name
from owns NATURAL JOIN car NATURAL JOIN person
WHERE license = '12-4000';

SELECT name
from owns NATURAL JOIN (
	SELECT DISTINCT license
    from log
    WHERE driver = 'Arif'
) as a NATURAL JOIN person;

SELECT DISTINCT model
from accident JOIN log ON accident.driver = log.driver NATURAL JOIN car
WHERE accident.`date` <= '2015-09-19';

SELECT COUNT(driver) as no_of_accident
FROM accident
WHERE driver = 'Arif';

SELECT accident.`date`
FROM accident
JOIN log ON accident.driver = log.driver
JOIN owns ON owns.license = log.license
JOIN person ON owns.nid = person.nid
WHERE person.name = 'Arif';

UPDATE person
SET address = 'Natore'
WHERE name = 'Arif';

