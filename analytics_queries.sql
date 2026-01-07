--monthly sales revenue
SELECT 
    DATE_FORMAT(o.OrderDate, '%Y-%m') AS Month,
    SUM(p.Price * od.Quantity) AS TotalRevenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY Month
ORDER BY Month;

--top selling products
SELECT 
    p.ProductName,
    SUM(od.Quantity) AS UnitsSold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY UnitsSold DESC;

--revenue by region
SELECT 
    c.Region,
    SUM(p.Price * od.Quantity) AS Revenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.Region;

--customer purchase ranking
SELECT
    c.CustomerName,
    SUM(p.Price * od.Quantity) AS TotalSpent,
    RANK() OVER (ORDER BY SUM(p.Price * od.Quantity) DESC) AS RankBySpending
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerName;
