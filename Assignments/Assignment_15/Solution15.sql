-- Assignment  15
-- Using Subqueries with DML Commands.


-- 1) Assume there is a table called Multicust, with all of the same column definitions as Salespeople. Write a command that inserts all salespeople with more than one customer into this table.




-- 2) Write a command that deletes all customers with no current orders.

Select * from customer;

-- +------+----------+----------+--------+------+
-- | cnum | cname    | city     | rating | snum |
-- +------+----------+----------+--------+------+
-- | 2001 | Hoffman  | London   |    100 | 1001 |
-- | 2002 | Giovanni | Rome     |    300 | 1003 |
-- | 2003 | Liu      | San Jose |    200 | 1003 |
-- | 2004 | Grass    | Berlin   |    300 | 1003 |
-- | 2006 | Clemens  | London   |    100 | 1001 |
-- | 2008 | Cisneros | San Jose |    300 | 1007 |
-- | 2007 | Pereira  | Rome     |    200 | 1004 |
-- +------+----------+----------+--------+------+
-- 7 rows in set (0.00 sec)

delete customer from orders,customer where orders.odate != now();

-- Query OK, 7 rows affected (0.18 sec)


select * from customer;
-- Empty set (0.00 sec)



-- 3) Write a command that increases by twenty percent the commissions of all salespeople with total orders above Rs. 3,000.

Select * from salespeople;

-- +------+---------+-----------+------+
-- | snum | sname   | city      | comm |
-- +------+---------+-----------+------+
-- | 1002 | Serres  | San Jose  | 0.13 |
-- | 1003 | Motika  | London    | 0.13 |
-- | 1004 | Rifkin  | Barcelona | 0.14 |
-- | 1005 | Axelrod | New York  | 0.15 |
-- | 1001 | Peel    | London    | 0.12 |
-- +------+---------+-----------+------+
-- 5 rows in set (0.00 sec)

mysql> select * from orders;

-- +------+---------+------------+------+------+
-- | onum | amt     | odate      | cnum | snum |
-- +------+---------+------------+------+------+
-- | 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
-- | 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
-- | 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
-- | 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
-- | 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
-- | 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
-- | 3007 |   75.75 | 1990-10-04 | 2004 | 1002 |
-- | 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
-- +------+---------+------------+------+------+
-- 8 rows in set (0.00 sec)

mysql> update salespeople set comm = comm *1.20 where snum in (select snum from orders where amt>3000);
-- Query OK, 1 row affected (0.09 sec)
-- Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from salespeople;

-- +------+---------+-----------+------+
-- | snum | sname   | city      | comm |
-- +------+---------+-----------+------+
-- | 1002 | Serres  | San Jose  | 0.16 |
-- | 1003 | Motika  | London    | 0.13 |
-- | 1004 | Rifkin  | Barcelona | 0.14 |
-- | 1005 | Axelrod | New York  | 0.15 |
-- | 1001 | Peel    | London    | 0.12 |
-- +------+---------+-----------+------+
-- 5 rows in set (0.00 sec)