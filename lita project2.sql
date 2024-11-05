
-- retrieve the total number of customers from each region
SELECT * FROM new_schema.book1;
SELECT 
    Region, 
    COUNT(DISTINCT CustomerID) AS Total_Customers
FROM new_schema.book1
GROUP BY Region;

-- find the most popular subscription type by the number of customers
SELECT 
    SubscriptionType, 
    COUNT(DISTINCT CustomerID) AS Customer_Count
FROM new_schema.book1
GROUP BY 
    SubscriptionType
ORDER BY 
    Customer_Count DESC
LIMIT 1;

-- find customers who canceled their subscription within 6 months

SELECT 
    CustomerID,
    SubscriptionStart,
    SubscriptionEnd,
    DATEDIFF(SubscriptionEnd, SubscriptionStart) AS Subscription_Duration,
    Canceled
FROM new_schema.book1
WHERE Canceled = 'Yes' 
    AND DATEDIFF(SubscriptionEnd, SubscriptionStart) <= 180;

-- calculate the average subscription duration for all customers

SELECT 
    AVG(DATEDIFF(SubscriptionEnd, SubscriptionStart) / 30.0) AS Average_Subscription_Duration_Months
FROM new_schema.book1
WHERE SubscriptionEnd IS NOT NULL;
-- find customers with subscriptions longer than 12 months
SELECT 
    CustomerID,
    SubscriptionStart,
    SubscriptionEnd,
    DATEDIFF(SubscriptionEnd, SubscriptionStart) AS Subscription_Duration_Days
FROM new_schema.book1
WHERE 
    DATEDIFF(SubscriptionEnd, SubscriptionStart) > 365;  -- More than 12 months
    
    -- calculate total revenue by subscription type
    
    SELECT 
    SubscriptionType, 
    SUM(Revenue) AS Total_Revenue
FROM new_schema.book1
GROUP BY 
    SubscriptionType;
    -- find the top 3 regions by subscription cancellations
    SELECT 
    Region, 
    COUNT(*) AS Cancellation_Count
FROM new_schema.book1
WHERE 
    Canceled = 'True' 
GROUP BY 
    Region
ORDER BY 
    Cancellation_Count DESC
LIMIT 3;

-- find the total number of active and canceled subscriptions
SELECT 
    CASE 
        WHEN Canceled = 'Yes' THEN 'Canceled'
        ELSE 'Active'
    END AS Subscription_Status,
    COUNT(*) AS Total_Count
FROM new_schema.book1
GROUP BY 
    Subscription_Status;





