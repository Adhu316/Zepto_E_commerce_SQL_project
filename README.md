# Zepto_E_commerce_SQL_project

🛒 Zepto SQL Data Analysis Project
This project showcases end-to-end data exploration, cleaning, and analysis using SQL on a sample dataset inspired by Zepto, a rapid grocery delivery startup. The dataset simulates inventory-level product information such as pricing, discounts, weights, stock status, and categories.

📌 Objectives
Explore product inventory data from a structured SQL table

Clean inconsistent, missing, or zero-value records

Derive meaningful insights from available stock, pricing, and weight data

Perform analytical queries to support operational and business decisions

🧩 Dataset Structure
Table: zepto
Key fields:

sku_id: Unique product identifier

name: Product name

category: Product category (e.g., Dairy, Snacks, etc.)

mrp: Maximum retail price (in ₹)

discountPercent: % discount on MRP

discountedSellingPrice: Price after discount

weightInGms: Product weight

availableQuantity: Current stock available

outOfStock: Boolean indicating stock status

🔧 Key SQL Operations
✅ Data Cleaning
Removed records with MRP = 0 or selling price = 0

Converted price fields from paise to rupees

Handled missing/null values

Removed duplicate product entries

📊 Exploratory Queries
Identified top discount products

Filtered premium products with low discounts

Listed out-of-stock high-value products

Counted product duplicates

Listed unique categories and null-checks

📈 Analysis & Business Insights
Ranked top categories by average discount

Estimated potential revenue per category

Calculated total inventory weight per category

Analyzed price per gram to find best-value products

Grouped products into Low, Medium, and Bulk weight segments

