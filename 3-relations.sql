-- ## JOIN ##
-- test.db

CREATE TABLE left ( id INTEGER, description TEXT );
CREATE TABLE right ( id INTEGER, description TEXT );

INSERT INTO left VALUES ( 1, 'left 01' );
INSERT INTO left VALUES ( 2, 'left 02' );
INSERT INTO left VALUES ( 3, 'left 03' );
INSERT INTO left VALUES ( 4, 'left 04' );
INSERT INTO left VALUES ( 5, 'left 05' );
INSERT INTO left VALUES ( 6, 'left 06' );
INSERT INTO left VALUES ( 7, 'left 07' );
INSERT INTO left VALUES ( 8, 'left 08' );
INSERT INTO left VALUES ( 9, 'left 09' );

INSERT INTO right VALUES ( 6, 'right 06' );
INSERT INTO right VALUES ( 7, 'right 07' );
INSERT INTO right VALUES ( 8, 'right 08' );
INSERT INTO right VALUES ( 9, 'right 09' );
INSERT INTO right VALUES ( 10, 'right 10' );
INSERT INTO right VALUES ( 11, 'right 11' );
INSERT INTO right VALUES ( 11, 'right 12' );
INSERT INTO right VALUES ( 11, 'right 13' );
INSERT INTO right VALUES ( 11, 'right 14' );

SELECT * FROM left;
SELECT * FROM right;

-- INNER JOIN

SELECT l.id AS leftID, l.description AS left, r.id AS rightID, r.description AS right 
    FROM left AS l JOIN right AS r ON l.id = r.id;

-- OUTER JOIN

SELECT l.id AS leftID, l.description AS left, r.id AS rightID, r.description AS right 
    FROM left AS l LEFT JOIN right AS r ON l.id = r.id;

SELECT s.id, i.name, i.description, s.quantity, s.date, s.price 
    FROM sale AS s JOIN item AS i ON s.item_id = i.id;

SELECT s.id AS saleID, i.name AS 'Item Name', i.description as 'Item Description', s.quantity, s.date, s.price
    FROM sale AS s JOIN item AS i ON s.item_id = i.id;

SELECT s.id, i.name AS 'Item Name', i.description, s.quantity, s.date, c.name AS 'Customer Name' ,s.price
    FROM sale AS s 
    JOIN item AS i ON s.item_id = i.id
    JOIN customer AS c ON s.customer_id = c.id;

-- ###

INSERT INTO customer (name) VALUES ('Jane Smith');
SELECT * FROM customer;

SELECT c.name AS Customer, c.zip, i.name AS Item, i.description, s.quantity, s.price
    FROM customer AS c
    LEFT JOIN sale AS s ON s.customer_id = c.id
    LEFT JOIN item AS i ON s.item_id = i.id
    ORDER BY Customer, Item;