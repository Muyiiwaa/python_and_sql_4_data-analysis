-- subqueries 

-- where
-- 1. returns the names, title and salaries of employees
-- earning above average salary.

select concat_ws(' ', firstname, lastname) as names,
    title, salary
from employees
where Salary > (
    select AVG(salary) as average_salary
    from employees);


-- select
-- write a query that returns the names, and salary
-- every employee and the percentage by which their
-- salary is above the average salary.

select concat_ws(' ', firstname, lastname) as names,
    round(((salary - (select avg(salary) from employees))/(select avg(salary) from employees)) * 100,2) as average_salary
from employees;


-- return the countries where we have sent 
-- more than 100 orders and the number of orders
-- sent to those countries.

select country, no_of_orders
from (
    select shipcountry as country, count(shipcountry) as no_of_orders
from orders
GROUP BY shipcountry
) as temp_table
where no_of_orders > 100;

-- exercise

-- return the shipcountry, city and freight cost
-- for orders with freight above average.

-- write a query that returns the customerid,
-- name and city of customers that have never
-- patronized us.

with id_of_interest as (
    select distinct customerid
    from orders
)
select companyname, city, customerid
from customers
where customerid not in (
    select customerid
    from id_of_interest
);

-- return the number of customers and suppliers
-- that we have in each country.

with customer_cte as (
select country, count(customerid) as no_of_customers
from customers
GROUP BY Country),
supplier_cte as (
    select country, count(supplierid) as no_of_suppliers
    from suppliers
    GROUP BY Country
)
select a.country, a.no_of_customers, b.no_of_suppliers
from customer_cte as a
left join supplier_cte as b on b.country = a.country
UNION
select b.country, a.no_of_customers, b.no_of_suppliers
from customer_cte as a
right join supplier_cte as b on b.country = a.country;












--
