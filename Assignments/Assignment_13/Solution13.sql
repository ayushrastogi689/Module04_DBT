-- Assignment  13
-- Using the UNION clause.
-- 1) Create a union of two queries that shows the names, cities, and ratings of all customers. Those with rating of 200 or greater will also have the words “High Rating”, while the others will have the words “Low Rating”.

select cname,city,concat(rating,' - High Rating') from customer where rating >= 200 union select cname,city,concat(rating,' - Low Rating') from customer where rating < 200;
-- +----------+----------+---------------------------------+
-- | cname    | city     | concat(rating,' - High Rating') |
-- +----------+----------+---------------------------------+
-- | Giovanni | Rome     | 200 - High Rating               |
-- | Liu      | San Jose | 200 - High Rating               |
-- | Grass    | Berlin   | 300 - High Rating               |
-- | Cisneros | San Jose | 300 - High Rating               |
-- | Hoffman  | London   | 100 - Low Rating                |
-- | Clemens  | London   | 100 - Low Rating                |
-- | Pereira  | Rome     | 100 - Low Rating                |
-- +----------+----------+---------------------------------+
-- 7 rows in set (0.04 sec)


-- 2) Write a command that produces the name and number of each salesperson and each customer with more than one current order. Put the results in alphabetical order.
-- - 


-- 3) Form a union of three queries. Have the first select the snums of all salespeople in San Jose; the second, the cnums of all customers in San Jose; and the third the onums of all orders on October 3. Retain duplicates between the last two queries but eliminate any redundancies between either of them and the first.
-- (Note: in the sample tables as given, there would be no such redundancy. This is besides the point.)

- SELECT snum AS id
    -> FROM salespeople
    -> WHERE city = 'San Jose'
    ->
    -> UNION ALL
    ->
    -> SELECT cnum AS id
    -> FROM customer
    -> WHERE city = 'San Jose'
    ->
    -> UNION ALL
    ->
    -> SELECT onum AS id
    -> FROM orders
    -> WHERE odate = '1990-10-03';
-- +------+
-- | id   |
-- +------+
-- | 1002 |
-- | 2003 |
-- | 2008 |
-- | 3001 |
-- | 3003 |
-- | 3002 |
-- | 3005 |
-- | 3006 |
-- +------+
-- 8 rows in set (0.00 sec)
