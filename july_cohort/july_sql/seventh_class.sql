-- CTEs --
use northwind;

-- write a query that returns the monthly revenue,
-- no of orders and quantity sold in each month of 
-- 1997 for months where we sold more than 90 orders sold

with cte_one as (
    select monthname(o.orderdate) as months,
    count(o.orderid) as no_of_orders,
    sum((od.unitprice * od. quantity) - discount) as revenue,
    sum(od.quantity) as total_quantity
    from orders as o
    join `order details` as od on od.OrderID = o.OrderID
    where year(o.orderDate) = 1997
    GROUP BY months
)
select *
from cte_one
where no_of_orders > 90;

-- write a query that returns the numbers of customers and
-- suppliers that we have in each country.

with customer_cte as (
    select country, count(CustomerID) as no_of_customers
    from customers
    where not country is null
    GROUP BY country
),supplier_cte as (
    select country, count(supplierid) as no_of_suppliers
    from suppliers
    GROUP BY Country
)
select c.country, c.no_of_customers, s.no_of_suppliers
from customer_cte as c
left join supplier_cte as s on s.country = c.country
union
select s.country, c.no_of_customers, s.no_of_suppliers
from customer_cte as c
right join supplier_cte as s on s.country = c.country;


-- CONDITIONALS --
-- WRITE A QUERY THAT FLAGS LATE, SAME-DAY AND EARLY ORDERS
-- ALSO RETURN THE COUNTRY AND ORDERID OF THAT ORDER.

select requiredDate, shippedDate,shipcountry,OrderID,
    datediff(requiredDate, shippedDate) as no_of_days,
    CASE
        when requiredDate > shippedDate THEN "early"
        WHEN requiredDate = shippedDate THEN "same-day"
        ELSE "late"
    END as delivery_remark
from orders
;

