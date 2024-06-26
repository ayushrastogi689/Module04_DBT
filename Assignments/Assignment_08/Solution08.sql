/* Assignment 8

Formatting Query output.
1) Assume each salesperson has a 12% commission. Write a query on the orders table that will produce the order number, the salesperson number, and the amount of the salesperson’s commission for that order.
*/
 Select onum,snum,amt*0.12 as Comm from orders;

/*
+------+------+---------+
| onum | snum | Comm    |
+------+------+---------+
| 3001 | 1007 |    2.24 |
| 3003 | 1001 |   92.06 |
| 3002 | 1004 |  228.01 |
| 3005 | 1002 |  619.25 |
| 3006 | 1007 |  131.78 |
| 3009 | 1003 |  205.59 |
| 3007 | 1002 |    9.09 |
| 3008 | 1001 |  566.76 |
| 3010 | 1002 |  157.19 |
| 3011 | 1001 | 1187.03 |
+------+------+---------+
10 rows in set (0.00 sec)


2) Write a query on the Customers table that will find the highest rating in each city. Put the output in this form:
For the city (city), the highest rating is : (rating).
*/

Select distinct city as 'For the city',max(rating) as 'the highest is:' from customer group by city;

/*
+--------------+-----------------+
| For the city | the highest is: |
+--------------+-----------------+
| London       |             100 |
| Rome         |             200 |
| San Jose     |             300 |
| Berlin       |             300 |
+--------------+-----------------+
4 rows in set (0.00 sec)

3) Write a query that lists customers in descending order of rating. Output the rating field first, followed by the customer’s name and number.
*/

Select rating,cname,cnum from customer order by rating desc;

/*
+--------+----------+------+
| rating | cname    | cnum |
+--------+----------+------+
|    300 | Grass    | 2004 |
|    300 | Cisneros | 2008 |
|    200 | Giovanni | 2002 |
|    200 | Liu      | 2003 |
|    100 | Hoffman  | 2001 |
|    100 | Clemens  | 2006 |
|    100 | Pereira  | 2007 |
+--------+----------+------+
7 rows in set (0.00 sec)


4) Write a query that totals the orders for each day and places the results in descending order.
*/

Select distinct odate,sum(amt) as Total_amt from orders group by odate order by Total_amt desc;

/*
+------------+-----------+
| odate      | Total_amt |
+------------+-----------+
| 1990-10-06 |  11201.83 |
| 1990-10-03 |   8944.59 |
| 1990-10-05 |   4723.00 |
| 1990-10-04 |   1788.98 |
+------------+-----------+
4 rows in set (0.23 sec)

*/