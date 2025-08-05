CREATE DATABASE pizza_sales;
use pizza_sales;

CREATE TABLE pizza_sales(
pizza_id INT,
order_id INT,
pizza_name_id varchar (100),
quantity INT,
order_date DATE,
order_time TIME,
unit_price DECIMAL(10,2),
total_price DECIMAL(10,2),
pizza_size varchar(10),
pizza_category varchar (50),
pizza_ingredients varchar(150),
pizza_name varchar (100)

)
SELECT * FROM pizza_sales LIMIT 50;
-- Total Revenue Generated
SELECT SUM(total_price) AS total_revenue FROM pizza_sales;
-- Total Pizzas solds
SELECT SUM(quantity) AS total_pizzas_sold FROM pizza_sales;
-- Total Orders (distinct order_id)
SELECT COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales;
-- Daily Sales Trend
SELECT order_date, SUM(total_price) AS daily_revenue
FROM pizza_sales
group by order_date
order by order_date;
-- Hourly Sales Trend
SELECT HOUR(order_time) AS hour_of_day, SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY hour_of_day
ORDER BY hour_of_day;
-- Best selling pizza by quantity
Select pizza_name, SUM(quantity) as total_quantity
FROM pizza_sales
group by pizza_name
order by total_quantity DESC
LIMIT 10;
-- Revenue by pizza category
select pizza_category, SUM(total_price) as category_revenue
From pizza_sales
group by pizza_category
order by category_revenue DESC;
-- Revenue by pizza size
select pizza_size, SUM(total_price) as size_revenue
From pizza_sales
group by pizza_size
order by size_revenue DESC;
-- Average order value 
SELECT 
round(SUM(total_price)/COUNT(DISTINCT order_id), 2) AS average_order_value
FROM pizza_sales;
-- Day of the week sales
select dayname(order_date) as weekday, SUM(total_price) as revenue
FROM pizza_sales
group by weekday
order by FIELD(weekday, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
-- Monthly revenue trend
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY month
ORDER BY month;
-- Top 3 Days with Highest Revenue
SELECT order_date, SUM(total_price) AS revenue
FROM pizza_sales
GROUP BY order_date
ORDER BY revenue DESC
LIMIT 3;
-- Customers who placed more than one order
SELECT order_id, COUNT(*) AS pizza_items_in_order
FROM pizza_sales
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY pizza_items_in_order DESC;
-- Order Frequency by Hour and Weekday
SELECT 
    DAYNAME(order_date) AS weekday,
    HOUR(order_time) AS hour,
    COUNT(order_id) AS total_orders
FROM pizza_sales
GROUP BY weekday, hour
ORDER BY FIELD(weekday, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'), hour;

































