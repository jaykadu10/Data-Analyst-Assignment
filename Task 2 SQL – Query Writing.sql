create database enigma_data ;
use enigma_data;


-- Drop table if exists
DROP TABLE IF EXISTS sales_data;


CREATE TABLE sales_data (
    order_date VARCHAR(50),
    platform VARCHAR(50),
    city VARCHAR(50),
    category VARCHAR(50),
    product_name VARCHAR(50),
    brand VARCHAR(50),
    quantity INT,
    mrp DECIMAL(10,2),
    discount_percent DECIMAL(5,2),
    returns_qty INT,
    selling_price DECIMAL(10,2),
    gross_sales DECIMAL(12,2),
    cogs DECIMAL(12,2),
    ad_spend DECIMAL(12,2),
    return_value DECIMAL(12,2),
    net_sales DECIMAL(12,2),
    asp DECIMAL(10,2),
    gross_margin DECIMAL(12,2)
);

## typecasting of date column 

UPDATE sales_data
SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y')
WHERE order_date IS NOT NULL;

ALTER TABLE sales_data
MODIFY COLUMN order_date DATE;

## checking type 

describe sales_data ;


SELECT order_date,STR_TO_DATE(order_date, '%d-%m-%Y') AS date FROM sales_data;

## drop colomn order_date 

ALTER TABLE sales_data
DROP COLUMN order_date;

## showing data 
SELECT * FROM sales_data ; 

## 1 .Total net sales and quantity sold by platform for the last 30 days

SELECT platform,SUM(net_sales) AS total_net_sales,SUM(quantity) AS total_quantity_sold
FROM sales_data
WHERE order_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY platform
ORDER BY total_net_sales DESC;

## 2 .Month-over-month sales growth by platform

SELECT platform, month, monthly_sales,LAG(monthly_sales) OVER (PARTITION BY platform ORDER BY month) AS prev_month_sales,
    ROUND((monthly_sales - LAG(monthly_sales) OVER (PARTITION BY platform ORDER BY month))/ LAG(monthly_sales) OVER (PARTITION BY platform ORDER BY month) * 100,2
    ) AS mom_growth_percent
FROM ( SELECT platform, DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(net_sales) AS monthly_sales FROM sales_data
GROUP BY platform, DATE_FORMAT(order_date, '%Y-%m')
) t
ORDER BY platform, month;

## 3.  Top 5 products by net sales within each category

SELECT * FROM (
    SELECT category,product_name,SUM(net_sales) AS total_net_sales,ROW_NUMBER() OVER (PARTITION BY category ORDER BY SUM(net_sales) DESC) AS rnk FROM sales_data
    GROUP BY category, product_name
) AS ranked_products
WHERE rnk <= 5
ORDER BY category, total_net_sales DESC;

## 4. ASP (Average Selling Price) by platform and category

SELECT platform,category,ROUND(SUM(selling_price * quantity) / SUM(quantity), 2) AS avg_selling_price FROM sales_data
GROUP BY platform, category
ORDER BY platform, category;

## 5 . Return rate (%) by platform

SELECT platform,ROUND(SUM(returns_qty) / SUM(quantity) * 100, 2) AS return_rate_percent FROM sales_data
GROUP BY platform
ORDER BY return_rate_percent DESC;







