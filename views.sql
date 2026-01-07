--reporting views
CREATE VIEW vw_MonthlySales AS
SELECT 
    DATE_FORMAT(o.OrderDate, '%Y-%m') AS Month,
    SUM(p.Price * od.Quantity) AS TotalRevenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY Month;
