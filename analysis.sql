create database EcommerceDB;

use EcommerceDB;

-- E-commerce Data Analysis Project

-- 1. View Dataset

select * from orders;

-- 2. Overall Business Performance

-- Total Sales and Total Profit

select round(sum(Sales),1) as total_sales, round(sum(Profit),1) as total_profit from orders;

-- 3. Category Analysis

-- Sales by Category

select Category, round(sum(Sales),1) as total_sales from orders group by Category order by total_sales desc;

-- Profit by Category

select Category, round(sum(Profit),1) as total_profit from orders group by Category order by total_profit desc

-- Profit Margin by Category

select Category, round(sum(Profit),1) as total_profit, round(sum(Sales),1) as total_sales,
round((sum(Profit) / sum(Sales))*100, 2) as profit_margin from orders group by category order by profit_margin desc;

-- 4. Product Analysis

-- Loss-Making Products

select Product_Name, round(sum(Profit),0) as Loss from orders group by Product_Name having sum(Profit) < 0 order by Loss asc;

-- Top 10 Products by Sales

select top 10 Product_Name, round(sum(Sales),0) as Sales from orders group by Product_Name order by Sales desc;

-- Discount Impact on Products

select Product_Name, round(sum(Sales),0) as Sales, round(sum(Profit),0) as Profit, round(AVG(Discount),2) as Discount from orders
group by Product_Name order by Profit asc;

-- 5. Regional Analysis

-- Sales & Profit by Region

select Region, round(sum(Sales),0) as Total_Sales, round(sum(Profit),0) as Total_Profit from orders 
group by Region order by Total_Sales desc;

-- Discount Impact by Region

select Region, round(avg(Discount),2) as Discount, round(sum(Profit),0) as Total_Profit from orders 
group by Region order by Total_Profit desc;

-- 6. Customer Analysis

-- Top 5 Customers by Sales

select top 5 Customer_Name, round(sum(Sales),0) as Total_Sales, round(sum(Profit),0) as Total_Profit from orders
group by Customer_Name order by Total_Sales desc;