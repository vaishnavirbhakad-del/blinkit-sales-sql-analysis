-- =====================================================
-- BLINKIT SALES ANALYSIS
-- SQL Project
-- =====================================================


-- =====================================================
-- 1. DATA CLEANING
-- =====================================================

-- Check different values in Item_Fat_Content

SELECT DISTINCT Item_Fat_Content
FROM blinkit;


-- Standardize Low Fat labels

UPDATE blinkit
SET Item_Fat_Content = 'Low Fat'
WHERE Item_Fat_Content IN ('LF', 'low fat');


-- Standardize Regular labels

UPDATE blinkit
SET Item_Fat_Content = 'Regular'
WHERE Item_Fat_Content = 'reg';


-- Check standardized values

SELECT DISTINCT Item_Fat_Content
FROM blinkit;


-- =====================================================
-- 2. HANDLE MISSING ITEM WEIGHT
-- =====================================================

-- Check missing Item_Weight values

SELECT COUNT(*) AS missing_item_weight
FROM blinkit
WHERE Item_Weight IS NULL;


-- Replace missing weight with average weight
-- for the same Item_Type

UPDATE blinkit
SET Item_Weight = (
    SELECT AVG(b2.Item_Weight)
    FROM blinkit b2
    WHERE b2.Item_Type = blinkit.Item_Type
)
WHERE Item_Weight IS NULL;


-- Verify missing values

SELECT COUNT(*) AS remaining_missing_weight
FROM blinkit
WHERE Item_Weight IS NULL;


-- =====================================================
-- 3. BASIC KPI ANALYSIS
-- =====================================================

-- KPI 1: Total Sales Revenue

SELECT ROUND(SUM(Item_Outlet_Sales), 2) AS total_sales
FROM blinkit;


-- KPI 2: Average Sales per Item

SELECT ROUND(AVG(Item_Outlet_Sales), 2) AS average_sales
FROM blinkit;


-- KPI 3: Total Number of Items

SELECT COUNT(*) AS total_items
FROM blinkit;


-- KPI 4: Average MRP

SELECT ROUND(AVG(Item_MRP), 2) AS average_mrp
FROM blinkit;


-- =====================================================
-- 4. SALES BY FAT CONTENT
-- =====================================================

SELECT
    Item_Fat_Content,
    ROUND(SUM(Item_Outlet_Sales), 2) AS total_sales,
    COUNT(*) AS item_count,
    ROUND(AVG(Item_Outlet_Sales), 2) AS average_sales
FROM blinkit
GROUP BY Item_Fat_Content
ORDER BY total_sales DESC;


-- =====================================================
-- 5. SALES BY ITEM TYPE
-- =====================================================

SELECT
    Item_Type,
    ROUND(SUM(Item_Outlet_Sales), 2) AS total_sales,
    COUNT(*) AS item_count,
    ROUND(AVG(Item_Outlet_Sales), 2) AS average_sales
FROM blinkit
GROUP BY Item_Type
ORDER BY total_sales DESC;


-- =====================================================
-- 6. SALES BY OUTLET SIZE
-- =====================================================

SELECT
    Outlet_Size,
    ROUND(SUM(Item_Outlet_Sales), 2) AS total_sales,
    COUNT(*) AS item_count,
    ROUND(AVG(Item_Outlet_Sales), 2) AS average_sales
FROM blinkit
GROUP BY Outlet_Size
ORDER BY total_sales DESC;


-- =====================================================
-- 7. SALES BY LOCATION TIER
-- =====================================================

SELECT
    Outlet_Location_Type,
    ROUND(SUM(Item_Outlet_Sales), 2) AS total_sales,
    COUNT(*) AS item_count,
    ROUND(AVG(Item_Outlet_Sales), 2) AS average_sales
FROM blinkit
GROUP BY Outlet_Location_Type
ORDER BY total_sales DESC;


-- =====================================================
-- 8. SALES BY OUTLET TYPE
-- =====================================================

SELECT
    Outlet_Type,
    ROUND(SUM(Item_Outlet_Sales), 2) AS total_sales,
    COUNT(*) AS item_count,
    ROUND(AVG(Item_Outlet_Sales), 2) AS average_sales
FROM blinkit
GROUP BY Outlet_Type
ORDER BY total_sales DESC;


-- =====================================================
-- 9. SALES BY MRP PRICE RANGE
-- =====================================================

SELECT
    CASE
        WHEN Item_MRP < 50 THEN 'Budget (Under 50)'
        WHEN Item_MRP BETWEEN 50 AND 100 THEN 'Mid (50-100)'
        WHEN Item_MRP BETWEEN 100 AND 200 THEN 'Premium (100-200)'
        ELSE 'Luxury (200+)'
    END AS price_range,

    COUNT(*) AS item_count,

    ROUND(SUM(Item_Outlet_Sales), 2) AS total_sales,

    ROUND(AVG(Item_Outlet_Sales), 2) AS average_sales

FROM blinkit

GROUP BY price_range

ORDER BY total_sales DESC;


-- =====================================================
-- 10. OUTLET TYPE + LOCATION ANALYSIS
-- =====================================================

SELECT
    Outlet_Type,
    Outlet_Location_Type,

    ROUND(SUM(Item_Outlet_Sales), 2) AS total_sales,

    COUNT(*) AS item_count

FROM blinkit

GROUP BY
    Outlet_Type,
    Outlet_Location_Type

ORDER BY total_sales DESC;


-- =====================================================
-- 11. TOP 10 ITEMS BY SALES
-- =====================================================

SELECT
    Item_Identifier,
    Item_Type,
    Item_MRP,
    Outlet_Identifier,
    ROUND(Item_Outlet_Sales, 2) AS sales

FROM blinkit

ORDER BY Item_Outlet_Sales DESC

LIMIT 10;


-- =====================================================
-- 12. OUTLET PERFORMANCE
-- =====================================================

SELECT
    Outlet_Identifier,
    Outlet_Size,
    Outlet_Location_Type,
    Outlet_Type,

    ROUND(SUM(Item_Outlet_Sales), 2) AS total_sales

FROM blinkit

GROUP BY
    Outlet_Identifier,
    Outlet_Size,
    Outlet_Location_Type,
    Outlet_Type

ORDER BY total_sales DESC;


-- =====================================================
-- END OF PROJECT
-- =====================================================