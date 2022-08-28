-- ## TABLES ##

-- INSERT INTO
CREATE TABLE IF NOT EXISTS word(id INTEGER, word TEXT);

INSERT INTO word VALUES (1, 'Bob');
INSERT INTO word VALUES (2, 'Cat');
INSERT INTO word VALUES (3, 'Bat');
INSERT INTO word VALUES (4, 'Man');
INSERT INTO word VALUES (5, NULL);
INSERT INTO word VALUES (NULL,'Woman');

DROP TABLE IF EXISTS word;

-- INSERT INTO

CREATE TABLE IF NOT EXISTS employee(Id INTEGER NOT NULL PRIMARY KEY, Name STRING, Experience INTEGER);

INSERT INTO employee VALUES (0, 'Alice', 2);
INSERT INTO employee (Id, Name) VALUES (1, 'Bob');
INSERT INTO employee (Name, Experience) VALUES ('Tuna', 10);
INSERT INTO employee (Experience) VALUES (99);
INSERT INTO employee DEFAULT VALUES;

INSERT INTO employee (Name) SELECT name from customer;
INSERT INTO employee (Name) SELECT name from customer  WHERE id = 1;

DROP TABLE IF EXISTS employee;

-- DELETE FROM

SELECT * FROM employee WHERE Id = 0;
DELETE FROM employee WHERE Id = 0;

SELECT * FROM employee WHERE Name = 'Bill Smith';
DELETE FROM employee WHERE Name = 'Bill Smith';

-- NULL

INSERT INTO employee (Name, Experience) VALUES (NULL, '');

SELECT * FROM employee WHERE Name IS NULL;
SELECT * FROM employee WHERE Name IS NOT NULL;

-- ## Constraining Columns ##

-- DEFAULT
DROP TABLE IF EXISTS test;
CREATE TABLE test (Id INTEGER, Value TEXT, Comment TEXT DEFAULT 'SQL is awsome');
INSERT INTO test (Id, Value) VALUES (0, 'test value');
INSERT INTO test (Id, Value, Comment) VALUES (1, 'Income', '25000');

-- UNIQUE
DROP TABLE IF EXISTS test;
CREATE TABLE test (Id INTEGER PRIMARY KEY, Value TEXT UNIQUE, Comment TEXT DEFAULT '- this is a placeholder -');
INSERT INTO test (Value) VALUES ('test value');
INSERT INTO test (Value, Comment) VALUES ('Income', '25000');
INSERT INTO test (Value) VALUES ('Income'); -- UNIQUE constraint failed!

-- ## ALTER TABLE ##
ALTER TABLE employee ADD City TEXT;
ALTER TABLE employee ADD Location TEXT DEFAULT 'middle of nowhere.';

-- ## ID COLUMNS ##
DROP TABLE IF EXISTS Transactions;
CREATE TABLE Transactions (Id INTEGER PRIMARY KEY UNIQUE NOT NULL, Amount INTEGER NOT NULL, Details TEXT);
INSERT INTO Transactions (Amount, Details) Values (250, 'Buying a tv.');
INSERT INTO Transactions (Amount, Details) Values (100, 'Lunch');
INSERT INTO Transactions (Amount) Values (25);
SELECT * FROM Transactions;

-- ## FILTERING DATA ##
SELECT Name, Continent, Population FROM Country WHERE Population < 100000 OR Population IS NULL ORDER BY Population DESC;
SELECT Name, Continent, Region, Population FROM Country WHERE Population > 1000000 AND Continent = 'North America' ORDER BY Name ASC;
SELECT Name, Continent, Population FROM Country WHERE Name LIKE '%island%' ORDER BY Population DESC;
SELECT Name, Continent, Population FROM Country WHERE Name LIKE '_a%' ORDER BY Population DESC;
SELECT Name, Continent, Population FROM Country WHERE Continent IN ('Europe', 'Asia');
