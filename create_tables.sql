CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    age INT,
    region VARCHAR(100)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10, 2)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (CustomerID, CustomerName, Age, Gender, Region)
VALUES 
(1, 'John Doe', 28, 'Male', 'North'),
(2, 'Jane Smith', 34, 'Female', 'South'),
(3, 'Alice Johnson', 45, 'Female', 'East'),
(4, 'Bob Brown', 23, 'Male', 'West');

INSERT INTO Products (ProductID, ProductName, Category, UnitPrice)
VALUES 
(1, 'Product A', 'Category 1', 19.99),
(2, 'Product B', 'Category 2', 39.99),
(3, 'Product C', 'Category 1', 29.99),
(4, 'Product D', 'Category 3', 49.99);

INSERT INTO Sales (SaleID, CustomerID, ProductID, SaleDate, Quantity)
VALUES 
(1, 1, 1, '2023-01-10', 3),
(2, 2, 3, '2023-02-15', 1),
(3, 1, 2, '2023-03-05', 2),
(4, 3, 4, '2023-04-12', 4);
