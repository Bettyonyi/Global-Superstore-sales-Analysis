-- selecting a Database 
use ecommerce;

-- check all db tables
show tables;

-- selecting table
select * from global_superstore2;

-- Answering the Questions

-- 1
select 
Segment,
sum(Sales) AS Total_Sales,
SUM(profit) AS Total_Profit,
ROUND((sum(profit) / SUM(sales)) * 100, 3) AS Profit_Margin_Pct
from global_superstore2
Group by segment 
order by Total_Profit DESC;

-- 2
select
Region,
State,
sum(profit) AS Net_Profit,
Round(AVG(Discount), 4) AS Avg_Discount
from global_superstore2
group by Region, State
Having Net_Profit < 0
order by Net_Profit ASC;

-- 3
Select
`product Name` ,
sum(Sales) AS Total_Sales,
Sum(Profit) AS Total_profit,
Round((sum(Profit) / sum(Sales)) * 100, 2) AS Margin_pct
from global_superstore2
group by`Product Name`
order by Total_Sales DESC
LIMIT 10;

-- 4
select
   `Ship Mode`,
   ROUND(AVG(DATEDIFF(`Ship Date` , `Order Date`)), 2) AS Avg_Days_To_Ship,
   MAX(DATEDIFF(`Ship Date`, `Order Date`)) AS Max_Wait_Time
From global_superstore2
Group By `Ship Mode`
ORDER BY Avg_Days_To_Ship;

-- 5
-- checking for years in the dataset
SELECT
    MIN(YEAR(`Order Date`)) AS Start_Year,
    MAX(YEAR(`Order Date`)) AS End_year
    FROM global_superstore2;
    
    -- 5.
    -- Getting sales by month and years
    SELECT
         MONTH(`Order Date`) AS Order_Month,
         SUM(CASE WHEN YEAR(`Order Date`) = 2011 THEN Sales ELSE 0 END) AS Sales_2011,
         SUM(CASE WHEN YEAR(`Order Date`) = 2014 THEN Sales ELSE 0 END) AS Sales_2014
   from global_superstore2
   GROUP BY MONTH(`Order Date`)
   ORDER BY Order_Month;
   
   -- 6
   
   SELECT
       `Customer Name`,
       MAX(`Order Date`) AS Last_Purchase_Date,
       DATEDIFF(CURDATE(), MAX(`Order Date`)) AS Days_Since_Last_Purchase,
       SUM(Sales) AS Lifetime_Value
FROM global_superstore2
GROUP BY `Customer Name`
ORDER BY Lifetime_value DESC
LIMIT 20;       
       
         