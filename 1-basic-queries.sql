-- CRUD : Create, Read, Update, Delete

-- ## SELECT ##
-- database: 'World' is used for following queries

SELECT 'hello world' AS result;
SELECT * from Country;
SELECT Name, Continent, LifeExpectancy from Country; -- return selected columns of all rows with havind data or not.
SELECT Name AS Country, Region, Continent FROM Country;

-- NOT NULL
SELECT Name, Continent, LifeExpectancy AS "Life Expectancy" FROM Country WHERE LifeExpectancy NOT NULL ORDER BY LifeExpectancy ASC;

-- ORDER BY
SELECT Name, Continent, Region FROM Country WHERE Continent = 'Asia' ORDER BY Name;

-- LIMIT, OFFSET
SELECT Name, Continent, Region FROM Country WHERE Continent = 'Asia' ORDER BY Name LIMIT 10 OFFSET 0;
SELECT Name, Continent, Region FROM Country WHERE Continent = 'Asia' ORDER BY Name LIMIT 10 OFFSET 10;
SELECT Name, Continent, Region FROM Country WHERE Continent = 'Asia' ORDER BY Name LIMIT 10 OFFSET 20;

-- COUNT
SELECT COUNT(*) FROM Country;

SELECT COUNT(*) FROM Country WHERE LifeExpectancy NOT NULL;
SELECT COUNT(LifeExpectancy) FROM Country; -- only counts rows which have data in LifeExpectancy column.
SELECT COUNT(LifeExpectancy AND IndepYear) FROM Country;

SELECT COUNT(*) FROM Country WHERE IndepYear > 1990;
SELECT COUNT(*) FROM Country WHERE IndepYear > 1990 AND Continent = 'Europe';

SELECT * FROM Country WHERE IndepYear > 1990 AND Continent = 'Europe';
SELECT * FROM Country WHERE IndepYear > 1990;

-- ## INSERT INTO ##
-- database: 'test' is used for following queries

INSERT INTO customer (name, address, city, state, zip)
    VALUES ('Fred Flintstone,', '123 Cobblestone Rd', 'Bedrock', 'CA', '91234');
    
INSERT INTO customer (name, city, state)
    VALUES ('Jimi Hendricks', 'Renton', 'WA');

-- ## UPDATE ##
-- database: 'test' is used for following queries

UPDATE customer SET address = '221B Baker Street London', zip = '90099' WHERE id = 5;
UPDATE customer SET zip = '11111' WHERE id = 5;
UPDATE customer SET zip = 22222 WHERE id = 5;
UPDATE customer SET state = 'CA'; -- set zip = 8888 in all rows of table
UPDATE customer SET zip = NULL where id = 7;
UPDATE customer SET zip = NULL;

-- ## DELETE ##
 -- database: 'test' is used for following queries

DELETE FROM customer WHERE id = 7;
DELETE FROM customer WHERE name = 'Mary Smith';