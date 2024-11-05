-- retrieve the total sales for each product category.

SELECT * FROM products.sqlcsv;

select product, sum(quantity*UnitPrice) as total_sales
FROM products.sqlcsv
group by product;

-- find the number of sales transactions in each region

SELECT * FROM products.sqlcsv;
select region,
count(orderid) as sales_transactions
from products.sqlcsv
GROUP BY region
ORDER BY sales_transactions DESC;

-- find the highest-selling product by total sales value
SELECT * FROM products.sqlcsv;
SELECT product,
    SUM(quantity*unitprice) AS total_sales_value
FROM  products.sqlcsv
GROUP BY product
ORDER BY total_sales_value DESC
LIMIT 1;

-- calculate total revenue per product
SELECT product,
    SUM(quantity*unitprice) AS total_revenue
FROM products.sqlcsv
GROUP BY product
ORDER BY total_revenue DESC;

-- calculate monthly sales totals for the current year
SELECT year(orderdate), month(orderdate), SUM(quantity*unitprice) AS monthly_sales_total
FROM products.sqlcsv
group by year(orderdate), month(orderdate);

-- find the top 5 customers by total purchase amount
SELECT * FROM products.sqlcsv;
SELECT Customer Id, sum(Quantity*UnitPrice) AS total_purchase_amount
FROM products.sqlcsv
group by Customer Id
ORDER BY total_purchase_amount DESC
LIMIT 5;

-- calculate the percentage of total sales contributed by each region
SELECT Region, sum(Quantity*UnitPrice) as per_total_sales,
sum(Quantity*UnitPrice)/
( select sum(Quantity*UnitPrice) from  products.sqlcsv) as percentage
from products.sqlcsv
group by Region;

-- identify products with no sales in the last quarter
SELECT * FROM products.sqlcsv
SELECT DISTINCT product
FROM products.sqlcsv
WHERE product NOT IN (
    SELECT DISTINCT product
    FROM products.sqlcsv
    WHERE orderdate >= DATE_TRUNC('quarter', CURRENT_DATE) - INTERVAL '3 months'
      AND orderdate < DATE_TRUNC('quarter', CURRENT_DATE)
)
ORDER BY product;





    






