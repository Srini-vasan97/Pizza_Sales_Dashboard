USE [Pizza DB]
SELECT * FROM pizza_sales

/* Total_Revenue */
SELECT SUM(total_price) AS total_Revenue from pizza_sales

/* Average_order_value*/
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Average_order_value  from pizza_sales

/* Total_Pizzas_Sold*/
SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales

/* Total_orders */
SELECT COUNT(DISTINCT order_id) FROM pizza_sales

/* Average_Pizzas_Per_Order */
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order from pizza_sales


/* Daily-Trend-Total-Orders*/
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

/* Monthly_Trend_for_Orders*/
select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)

/* %_of_Sales_by_Pizza_Category*/
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

/* %_of_Sales_by_Pizza_Size*/
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

/*Total_Pizzas_Sold_by_Pizza_Category*/
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

/*Top_5_Pizzas_by_Revenue*/
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

/*Bottom_5_Pizzas_by_Revenue*/
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

/*Top 5 Pizzas by Quantity*/
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

/*Bottom 5 Pizzas by Quantity*/
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

/*Top 5 Pizzas by Total Orders*/
SELECT TOP 5 pizza_name, SUM(quantity) as Total_Orders
from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

/*Bottom 5 Pizzas by Total Orders*/
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC




















