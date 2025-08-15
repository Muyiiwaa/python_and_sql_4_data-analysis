-- begin --
use northwind;
-- write a query that returns the employees
-- in UK
select firstname, lastname, Country
from employees
where country = "UK";

-- MULTIPLE CONDITIONS AND LOGICAL OPERATORS
-- write a query that returns the sales representatives 
-- in the UK.
select firstname, lastname, Title, Country
from employees
where Title = "Sales Representative" AND
    Country = "UK";

-- write a query that returns orderid, country
-- and freight cost of orders that were not sent 
-- france and canada.
select orderid, shipcountry, freight
from orders
where ShipCountry != "France" AND ShipCountry != "Canada";

-- method 2
select orderid, shipcountry, freight
from orders
where not (ShipCountry="France" or ShipCountry= "Canada");

-- method 3
select orderid, shipcountry, freight
from orders
where not ShipCountry in ("France","Canada");

-- Date Ranges 

-- write a query that returns the orders 
-- sold in january 1997
select orderid, orderDate, ShipCountry
from orders
WHERE orderDate BETWEEN "1997-01-01" AND "1997-01-31";

-- write a query that returns orders sold on third of january
select orderid, orderdate, shipcountry
from orders
where orderDate = "1997-01-03";

-- FILTERING NUMBERS --
-- write a query that returns orderid, frieght cost and
-- order date of all orders sent to  Canada with freight
-- cost above $100

select orderid, freight, orderdate,shipcountry
from orders
where ShipCountry = "Canada" AND freight > 100;


-- SORTING AND AGGREGATION --
-- return the first name and lastname of our employees.
-- arranged in descending order of salary
select firstname, lastname, Salary
from employees
ORDER BY Salary DESC;

-- return the orderid, customerid, freight cost of
-- the top 5 most expensive orders (freight) sent to Germany.
SELECT orderid, customerid, freight, shipcountry
from orders
where ShipCountry = "Germany"
ORDER BY Freight DESC
LIMIT 5;

-- AGGREGATE FUNCTION & ALIAS --
-- write a query that returns the average salary of employees
select avg(salary) as average_salary
from employees;

-- write a query that returns the number of orders sent 
-- to Norway.
select count(OrderID) as no_of_norway_order
from orders
where ShipCountry = "Norway";

-- GROUP BY --
-- write a query that returns the total number
-- of orders sent to each country.
select ShipCountry, count(orderid) as no_of_orders
from orders
GROUP BY ShipCountry
ORDER BY no_of_orders;

-- write a query that returns the top 5 most expensive
-- cities to ship to in the USA and the number of
-- orders sent to those cities

select shipcity, count(orderid) as no_of_orders,
    avg(freight) as average_freight
from orders
WHERE ShipCountry = "USA"
GROUP BY ShipCity
ORDER BY average_freight DESC
limit 5;

-- HAVING --
-- write a query that returns the average freight
-- of cities where we have sent at least 40 orders;
select shipcity, avg(freight) as average_freight,
    count(orderid) as no_of_orders
from orders
GROUP BY ShipCity
HAVING count(orderid) >= 30;








/*
EXERCISE
1. return the firstname, lastname and country of the top
three highest paid sales representatives.

2. write a query that returns the number of customers we 
have in each country for countries where we have at least
10 customers

*/


