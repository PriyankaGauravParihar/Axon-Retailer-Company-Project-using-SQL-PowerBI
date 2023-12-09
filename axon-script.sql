use Axon;
/********************* Home Page************************/
-- KPI

Select  SUM(quantityOrdered * priceEach) AS Revenue from orderdetails;

select count(customerName) as Total_Customers from customers;

select sum(quantityOrdered) as Total_Quantity from orderdetails;

select count(employeeNumber) as Total_Employees from employees;

select count(orderNumber) as Total_Orders from orders;

select count(productCode)as Total_Products from products;

select SUM(quantityOrdered * priceEach)as Total_Revenue from orderdetails;

select (SUM(quantityOrdered * priceEach) -  sum(quantityOrdered * buyPrice))as Profit
from orderdetails JOIN products
ON orderdetails.productCode = products.productCode;

-- monthly trend chart

SELECT MONTHNAME(orderDate) AS monthwise,
       SUM(quantityOrdered * priceEach) AS totalValue
FROM orders
JOIN orderDetails ON orders.orderNumber = orderDetails.orderNumber
GROUP BY MONTHNAME(orderDate) order by totalValue desc;

-- top 10 products by revenue
Select  SUM(quantityOrdered * priceEach) AS Revenue, productName 
	from products join orderdetails
	on products.productCode = orderdetails.productCode 
	group by productName order by Revenue desc limit 10;
    
    -- total revenue by product line
  Select  SUM(quantityOrdered)as Total_Orders, productLine from 
  orderdetails join products
  on products.productCode = orderdetails.productCode 
  group by productLine;
  
  -- yearwise profit
  select year(orderDate)as Yearwise, (SUM(quantityOrdered * priceEach) - sum(quantityOrdered * buyPrice))as Profit
  from orderdetails join orders
  on orderdetails.orderNumber = orders.orderNumber
  join products 
  on products.productCode = orderdetails.productCode 
  group by Yearwise;
 
 -- total revenue by productline
 select SUM(quantityOrdered * priceEach) as Revenue,productline
  from orderdetails join products 
  on products.productCode = orderdetails.productCode 
  group by productline;
