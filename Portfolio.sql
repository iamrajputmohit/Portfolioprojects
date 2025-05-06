-- DATASET
SELECT *
FROM ECOMMERCE_SALES

-- TOTAL SALES BY COUNTRY 
SELECT country, SUM(quantity * price) AS total_sales
FROM ecommerce_sales
GROUP BY country
ORDER BY total_sales asc

-- Top 5 customers by profit
SELECT customer_name,sum(profit) as total_proft
FROM ecommerce_sales
GROUP BY customer_name
order by total_proft asc
LIMIT 5;

-- Monthly sales trend
SELECT date_format(order_date,'%y-%m') as month, SUM(quantity * price) AS total_sales
FROM ecommerce_sales
GROUP BY month
ORDER BY month

-- Top 3 product categories by revenue
SELECT product_category, SUM(quantity * price) AS total_sales
FROM ecommerce_sales
GROUP BY product_category
ORDER BY total_sales desc
limit 3;

-- Sales trend over years
SELECT date_format(order_date,'%y') as YEAR, SUM(quantity * price) AS total_sales
FROM ecommerce_sales
GROUP BY YEAR
ORDER BY YEAR;

-- Discount impact on sales
SELECT discount,COUNT(*) AS NO_ODERS, SUM(quantity * price) AS total_sales
FROM ecommerce_sales
GROUP BY Discount
ORDER BY Discount;

-- Average order value per country
SELECT country, avg(quantity * price) AS AVG_sales
FROM ecommerce_sales
GROUP BY country
ORDER BY AVG_sales;

-- Best-selling products overall
SELECT product_name, SUM(quantity * price) AS TOTAL_sales
FROM ecommerce_sales
GROUP BY product_name
ORDER BY TOTAL_sales DESC
LIMIT 10;

-- Profit margin per category
SELECT product_category, SUM(PROFIT)/SUM(PRICE)*100 AS MARGIN
FROM ecommerce_sales
GROUP BY product_category
ORDER BY MARGIN desc

-- Year-over-year growth
SELECT YEAR(ORDER_DATE) as YEAR,
      SUM(quantity * price) AS total_sales,
      LAG(SUM(quantity * price)) OVER (ORDER BY YEAR (ORDER_DATE)) AS LAST_YEAR_SALES,
      (SUM(quantity * price) - LAG(SUM(quantity * price)) OVER (ORDER BY YEAR (ORDER_DATE))
      / LAG(SUM(quantity * price)) OVER (ORDER BY YEAR (ORDER_DATE)))*100 AS GROWTH_PERCENTAGE
FROM ecommerce_sales
GROUP BY YEAR
ORDER BY YEAR;
