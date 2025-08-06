drop table if exists zepto;

create table zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,	
quantity INTEGER
);

select count(*) from zepto;

--sample data
SELECT * FROM zepto
LIMIT 20;

--checking null value
SELECT * FROM zepto
WHERE name IS NULL
OR
Category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

--types of categorries
SELECT DISTINCT Category
FROM zepto
ORDER BY Category;

--products that are out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

-- product names present multiple times
SELECT name, COUNT(sku_id) as "Number of SKUs"
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;

--Data cleaning
SELECT * FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;
DELETE FROM zepto
WHERE mrp = 0;

--convert to rupees
UPDATE zepto
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

SELECT mrp, discountedSellingPrice FROM zepto;

--data analysis

--Find the top 10 best-value products based on discount percentage
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;


--Estimate potential revenue for each product category
SELECT Category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY Category
ORDER BY total_revenue;

--Filtere expensive products (MRP > ₹500) with minimal discount
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

--Rank top 5 categories offering highest average discounts
SELECT Category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto
GROUP BY Category
ORDER BY avg_discount DESC
LIMIT 5;

--Identifi high-MRP products that are currently out of stock
SELECT DISTINCT name,mrp
FROM zepto
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;

--Calculate price per gram to identify value-for-money products
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;


-- Measure total inventory weight per product category
SELECT 
  category,
  SUM(weightInGms * availableQuantity) AS total_weight
FROM 
  zepto
GROUP BY 
  category
ORDER BY 
  total_weight;


--Group products based on weight into Low, Medium, and Bulk categories
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	 WHEN weightInGms < 5000 THEN 'Medium'
	 ELSE 'Bulk'
	 END AS weight_in_category
FROM zepto;
