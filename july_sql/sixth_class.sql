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



