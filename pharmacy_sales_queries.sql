-- ==============================================================================
-- Project: Pharmaceutical Commercial Analytics
-- Description: SQL queries to analyze daily sales data of various drug categories.
-- Database: SQLite
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. Overall Drug Category Performance 
-- This query calculates the total sales volume for each therapeutic class to 
-- identify the top-performing drug categories.
-- ------------------------------------------------------------------------------
SELECT 
    SUM(M01AB) AS Anti_Inflammatory_M01AB,
    SUM(M01AE) AS Anti_Inflammatory_M01AE,
    SUM(N02BA) AS Analgesics_N02BA,
    SUM(N02BE) AS Analgesics_N02BE,
    SUM(N05B)  AS Psycholeptics_N05B,
    SUM(N05C)  AS Psycholeptics_N05C,
    SUM(R03)   AS Airway_Disease_R03,
    SUM(R06)   AS Antihistamines_R06
FROM sales_daily;

-- ------------------------------------------------------------------------------
-- 2. Monthly Sales Trends 
-- This query groups total sales by year and month to identify seasonal trends 
-- across the entire pharmaceutical portfolio.
-- ------------------------------------------------------------------------------
SELECT 
    Year, 
    Month, 
    SUM(M01AB + M01AE + N02BA + N02BE + N05B + N05C + R03 + R06) AS Total_Monthly_Sales
FROM sales_daily
GROUP BY Year, Month
ORDER BY Year, Month;

-- ------------------------------------------------------------------------------
-- 3. Day of the Week Performance 
-- This query aggregates sales by the day of the week to determine which days 
-- drive the highest volume, aiding in promotional timing and operational planning.
-- ------------------------------------------------------------------------------
SELECT 
    "Weekday Name", 
    SUM(M01AB + M01AE + N02BA + N02BE + N05B + N05C + R03 + R06) AS Total_Sales,
    COUNT(*) AS Number_Of_Days_Recorded
FROM sales_daily
GROUP BY "Weekday Name"
ORDER BY Total_Sales DESC;