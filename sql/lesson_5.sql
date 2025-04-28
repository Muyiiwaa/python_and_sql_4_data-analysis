/*
GROUPING AND AGGREGATION

*/

-- return the names of the top five best performing
-- countries in terms of number of orders.

SELECT shipcountry, count(orderid) as no_of_orders
from salesorder
group by shipcountry
order by no_of_orders desc
limit 5;

-- return the top 3 cheapest cities in the US to send
-- orders to in terms of average freight cost.
select shipcity, avg(freight) as average_freight
from salesorder
where shipcountry = "USA"
GROUP BY shipCity
order by average_freight
limit 3;

-- return the number of orders sold per month to 
-- evaluate monthly order performance.
select monthname(orderDate) as months,
    count(orderid) as no_of_orders
from salesorder
GROUP BY months
ORDER BY no_of_orders;

-- EXERCISE.
-- write a query that returns the lowest 3 countries
-- to send orders to in terms of freight and the number
-- of orders sent to those countries.

SELECT shipcountry, avg(freight) as average_freight,
    count(orderid) as no_of_orders
from salesorder
GROUP BY shipCountry
ORDER BY average_freight ASC
limit 3;

-- FILTERING AGGREGATED OPERATIONS

-- return the countries and number of orders sold
-- in countries where we've sent atleast 70 orders.

select shipcountry, count(orderid) as no_of_orders
from salesorder
GROUP BY shipCountry
HAVING no_of_orders >=70;



