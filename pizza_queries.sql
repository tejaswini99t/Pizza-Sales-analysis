--Total Revenue
select sum(total_price) as Total_Revenue from pizza

--Average Order value
select round(sum(total_price)/count(distinct order_id),2) as Average_Order_value from pizza

--Total Sales
select sum(quantity) as Total_sales from pizza

--Total Orders
select count(distinct order_id) as Total_Orders from pizza

--Average number of pizzas per an order
select round(sum(quantity) /count(distinct order_id),1) as Avg_pizza_per_order from pizza


--Daily trend for total orders
select To_char(order_date, 'DAY') as order_day, count(distinct order_id) as Total_orders
from Pizza
Group by To_char(order_date, 'DAY')

--Monthly trend for total orders
select To_char(order_date, 'MONTH') as order_MONTH, count(distinct order_id) as Total_orders
from Pizza
Group by To_char(order_date, 'MONTH')

--Total sales by category
select pizza_category, round(sum(total_price) * 100 / (select sum(total_price) from pizza),2) as perent_of_total_sales from pizza group by pizza_category

--Total sales by size
select pizza_size, round(sum(total_price) * 100 / (select sum(total_price) from pizza),2) as perent_of_total_sales from pizza group by pizza_size

--Top 5 pizzas by revenue
select pizza_name, sum(total_price) as Total_Revenue from pizza 
group by pizza_name 
order by total_revenue desc 
FETCH FIRST 5 ROWS ONLY

--Bottom 5 pizzas by revenue
select pizza_name, sum(total_price) as Total_Revenue from pizza 
group by pizza_name 
order by total_revenue asc
FETCH FIRST 5 ROWS ONLY