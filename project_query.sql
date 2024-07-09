create database coffee_shop_sels;
use coffee_shop_sels;
create table coffee_shop; 

select * from coffee_shop_sales;
-- #######################
--    1 Total Revenue per Store:
SELECT store_location, SUM(transaction_qty * unit_price) AS total_revenue
FROM coffee_shop_sales
GROUP BY store_location;

--   2 Top 10 Product Categories:
SELECT store_location, product_category, SUM(transaction_qty) AS total_quantity,
 SUM(transaction_qty * unit_price) AS total_revenue
FROM coffee_shop_sales
GROUP BY store_location, product_category
ORDER BY total_quantity DESC limit 10;

-- 3Average Transaction Value
SELECT store_location, AVG(transaction_qty * unit_price) AS avg_transaction_value
FROM coffee_shop_sales
GROUP BY store_location;


-- 4 Top- 5 Selling Products

SELECT store_location, product_detail, SUM(transaction_qty) AS total_quantity
FROM coffee_shop_sales
GROUP BY store_location, product_detail
ORDER BY store_location, total_quantity DESC
LIMIT 5;

--   5 Revenue by Product Type

SELECT store_location, product_category, product_type, SUM(transaction_qty * unit_price) AS total_revenue
FROM coffee_shop_sales
GROUP BY store_location, product_category, product_type
ORDER BY store_location, total_revenue DESC limit 10;

-- 6 Sales Trend Analysis:
SELECT store_location, product_category, DATE(transaction_date) AS date,
 SUM(transaction_qty * unit_price) AS total_revenue
FROM coffee_shop_sales
GROUP BY store_location, product_category, DATE(transaction_date)
ORDER BY store_location, date;

select * from coffee_shop_sales;

-- 6  top 10 Product Pricing Analysis:
SELECT store_location, product_category, product_type, AVG(unit_price) AS avg_price
FROM coffee_shop_sales
GROUP BY store_location, product_category, product_type
ORDER BY product_category, product_type limit 1-0;

-- 7 Detailed Product Sales:
SELECT store_location, product_detail, SUM(transaction_qty * unit_price) AS total_revenue
FROM coffee_shop_sales
GROUP BY store_location, product_detail limit 10;

-- 8  Bakery Items Performance:

SELECT store_location, product_detail, SUM(transaction_qty) AS total_quantity, SUM(transaction_qty * unit_price) AS total_revenue
FROM coffee_shop_sales
WHERE product_category = 'Bakery'
GROUP BY store_location, product_detail
ORDER BY store_location, total_revenue DESC;


-- 8 Time-Based Sales Patterns:

SELECT store_location, product_type, EXTRACT(HOUR FROM transaction_time) AS hour, SUM(transaction_qty) AS total_quantity
FROM coffee_shop_sales
GROUP BY store_location, product_type, EXTRACT(HOUR FROM transaction_time) limit 10;


-- 9 Store Performance Comparison:

SELECT store_location, COUNT(DISTINCT transaction_id) AS total_transactions,
 SUM(transaction_qty * unit_price) AS total_revenue, AVG(transaction_qty * unit_price) 
 AS avg_transaction_value
FROM coffee_shop_sales
GROUP BY store_location


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'coffee_shop_sales';


CREATE TABLE coffee (
    transaction_id SERIAL PRIMARY KEY,
    transaction_date DATE,
    transaction_time TIME,
    transaction_qty INTEGER,
    store_id INTEGER,
    store_location TEXT,
    product_id INTEGER,
    unit_price DECIMAL(10,2),
    product_category TEXT,
    product_type TEXT,
    product_detail TEXT
);
















 





