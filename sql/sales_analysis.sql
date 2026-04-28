-- ============================================
-- SQL ANALYSIS: SUPERSTORE SALES PERFORMANCE
-- ============================================

-- Doanh thu theo danh mục sản phẩm
SELECT 
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Profit_Margin) AS Avg_Margin
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Top 5 bang có lợi nhuận cao nhất
SELECT 
    State,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY State
ORDER BY Total_Profit DESC
LIMIT 5;

-- Xu hướng doanh thu theo tháng
SELECT 
    strftime('%Y-%m', "Order Date") AS Month,
    SUM(Sales) AS Monthly_Sales
FROM superstore
GROUP BY Month
ORDER BY Month;

-- Doanh thu và lợi nhuận theo phân khúc khách hàng
SELECT 
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Profit_Margin) AS Avg_Margin
FROM superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- Phân tích tác động của Discount đến Profit
SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.2 THEN 'Low (1-20%)'
        WHEN Discount <= 0.4 THEN 'Medium (21-40%)'
        ELSE 'High (>40%)'
    END AS Discount_Level,
    COUNT(*) AS Order_Count,
    ROUND(AVG(Sales), 2) AS Avg_Sales,
    ROUND(AVG(Profit), 2) AS Avg_Profit,
    ROUND(AVG(Profit_Margin), 4) AS Avg_Margin
FROM superstore
GROUP BY Discount_Level
ORDER BY Avg_Profit DESC;

