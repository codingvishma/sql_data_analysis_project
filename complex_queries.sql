-- Total sales by region
SELECT C.Region, SUM(P.UnitPrice * S.Quantity) AS TotalSales
FROM Sales S
JOIN Customers C ON S.CustomerID = C.CustomerID
JOIN Products P ON S.ProductID = P.ProductID
GROUP BY C.Region;

-- Customer with the highest number of purchases
SELECT C.CustomerName, SUM(S.Quantity) AS TotalPurchases
FROM Sales S
JOIN Customers C ON S.CustomerID = C.CustomerID
GROUP BY C.CustomerName
ORDER BY TotalPurchases DESC
LIMIT 1;

-- Most popular product by quantity sold
SELECT P.ProductName, SUM(S.Quantity) AS TotalSold
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY TotalSold DESC
LIMIT 1;

-- Average age of customers who bought 'Product A'
SELECT AVG(C.Age) AS AvgAge
FROM Sales S
JOIN Customers C ON S.CustomerID = C.CustomerID
JOIN Products P ON S.ProductID = P.ProductID
WHERE P.ProductName = 'Product A';

-- Sales breakdown by product category
SELECT P.Category, SUM(P.UnitPrice * S.Quantity) AS TotalSales
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
GROUP BY P.Category;

-- Customers who have purchased more than a certain quantity of products
SELECT c.customer_name, SUM(s.quantity) AS total_quantity_purchased
FROM Sales s
JOIN Customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_name
HAVING SUM(s.quantity) > 5;

COPY (
    SELECT C.Region, SUM(P.UnitPrice * S.Quantity) AS TotalSales
    FROM Sales S
    JOIN Customers C ON S.CustomerID = C.CustomerID
    JOIN Products P ON S.ProductID = P.ProductID
    GROUP BY C.Region
) TO 'data/total_sales_by_region.csv' DELIMITER ',' CSV HEADER;

COPY (
    SELECT C.CustomerName, SUM(S.Quantity) AS TotalPurchases
    FROM Sales S
    JOIN Customers C ON S.CustomerID = C.CustomerID
    GROUP BY C.CustomerName
    ORDER BY TotalPurchases DESC
    LIMIT 1
) TO 'data/highest_purchases_customer.csv' DELIMITER ',' CSV HEADER;

COPY (
    SELECT P.ProductName, SUM(S.Quantity) AS TotalSold
    FROM Sales S
    JOIN Products P ON S.ProductID = P.ProductID
    GROUP BY P.ProductName
    ORDER BY TotalSold DESC
    LIMIT 1
) TO 'data/most_popular_product.csv' DELIMITER ',' CSV HEADER;

COPY (
    SELECT AVG(C.Age) AS AvgAge
    FROM Sales S
    JOIN Customers C ON S.CustomerID = C.CustomerID
    JOIN Products P ON S.ProductID = P.ProductID
    WHERE P.ProductName = 'Product A'
) TO 'data/average_age_product_a.csv' DELIMITER ',' CSV HEADER;

COPY (
    SELECT P.Category, SUM(P.UnitPrice * S.Quantity) AS TotalSales
    FROM Sales S
    JOIN Products P ON S.ProductID = P.ProductID
    GROUP BY P.Category
) TO 'data/sales_by_category.csv' DELIMITER ',' CSV HEADER;

COPY (
    SELECT c.customer_name, SUM(s.quantity) AS total_quantity_purchased
    FROM Sales s
    JOIN Customers c ON s.customer_id = c.customer_id
    GROUP BY c.customer_name
    HAVING SUM(s.quantity) > 5
) TO 'data/customers_more_than_5_purchases.csv' DELIMITER ',' CSV HEADER;
