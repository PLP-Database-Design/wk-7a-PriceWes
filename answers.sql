-- Question ONE
WITH ProductDetail (OrderID, CustomerName, Products) AS (
    SELECT 101, 'John Doe', 'Laptop, Mouse' UNION ALL
    SELECT 102, 'Jane Smith', 'Tablet, Keyboard, Mouse' UNION ALL
    SELECT 103, 'Emily Clark', 'Phone'
),
SplitProducts AS (
    SELECT 
        OrderID,
        CustomerName,
        TRIM(value) AS Product
    FROM ProductDetail
    CROSS APPLY STRING_SPLIT(Products, ',')
)
SELECT * FROM SplitProducts;

-- Question TWO
-- Orders Table
SELECT DISTINCT OrderID, CustomerName
INTO Orders
FROM OrderDetails;

-- OrderItems Table
SELECT OrderID, Product, Quantity
INTO OrderItems
FROM OrderDetails;

