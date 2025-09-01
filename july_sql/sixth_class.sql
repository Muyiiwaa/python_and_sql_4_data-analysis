use northwind;

-- BUILT IN FUNCTIONS

-- best performing customers in second half of 1997
select c.companyname, count(o.orderid) as no_of_orders
from orders o 
join customers c on c.CustomerID = o.CustomerID
where (c.country = "Germany") and (YEAR(o.orderDate) = 1997)
    and (month(orderDate) > 6)
GROUP BY c.CompanyName;

-- concat, concat_ws
-- return the name of employees and the total revenue they have
-- generated for the company. sorted by revenue performance.

select concat_ws(" ",e.TitleOfCourtesy, e.firstname, e.lastname) as fullname,
sum((od.unitprice * od.quantity) - discount) as revenue
from employees as e
join orders as o on o.EmployeeID = e.EmployeeID
join `order details` od on od.OrderID = o.OrderID
GROUP BY fullname
order BY revenue DESC;

select sum((unitprice * quantity) - Discount)
from `order details`;

-- returns full name, number of orders shipped later than 
-- requireddate.

select concat(e.firstname, " ", e.lastname) as fullname,
    count(o.orderid) as no_of_late_orders
from orders as o
join employees as e on e.EmployeeID = o.EmployeeID
where o.shippedDate > o.requiredDate
GROUP BY fullname
order by no_of_late_orders desc;


-- write a query that returns the monthly revenue,
-- no of orders and quantity sold in each month of 
-- 1997.
select monthname(o.orderdate) as months,
    sum((od.unitprice * od.quantity) - discount) as revenue,
    count(o.OrderID) as no_of_orders, 
    sum(od.quantity) as total_quantity
from orders as o
join `order details` as od on od.OrderID = o.OrderID
WHERE year(orderdate) = 1997
GROUP BY months
ORDER BY revenue desc;

-- SUBQUERIES INNER QUERIES--

-- returns the names of employees earning above average salary.
-- and their salary
select concat_ws(" ", e.firstname, e.lastname) as fullname,
    salary
from employees as e
where salary > (
    select avg(salary)
    from employees);

-- returns the names of employees earning above average salary.
-- include their salary and the percentage with which it is higher
-- than average.

select concat_ws(" ", e.firstname, e.lastname) as fullname,
    salary,
    concat(round(((salary - (select avg(salary) from employees))/salary) * 100, 2),"%") as percent_change
from employees as e
where salary > (
    select avg(salary)
    from employees);



-- write a query that returns the monthly revenue,
-- no of orders and quantity sold in each month of 
-- 1997 for months where we sold more than 90 orders sold

select months, revenue, no_of_orders, total_quantity
from (
    select monthname(o.orderdate) as months,
        sum((od.unitprice * od.quantity) - discount) as revenue,
        count(o.OrderID) as no_of_orders, 
        sum(od.quantity) as total_quantity
    from orders as o
    join `order details` as od on od.OrderID = o.OrderID
    WHERE year(orderdate) = 1997
    GROUP BY months
    ORDER BY revenue desc
    ) as temp_table
where no_of_orders > 90;


select orderdate
from orders
where shipcountry = "germany"




