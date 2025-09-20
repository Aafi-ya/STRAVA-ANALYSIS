SELECT 
    COUNT(*) as total_rows,
    COUNT(id) as id_count,
    COUNT(activity_day) as date_count,
    COUNT(calories) as calories_count
FROM 
    daily_calories;
-- Insight: No Null values, daily_calories is clean

-- Check for duplicate user/date combinations in daily_calories
SELECT 
    id, activity_day, 
    COUNT(*) as duplicate_count
FROM 
    daily_calories
GROUP BY 
    id, activity_day
HAVING 
    COUNT(*) > 1;
-- Insight: No duplicates found

-- Check calorie ranges and date span for daily_calories
SELECT 
    MIN(calories) as min_calories,
    MAX(calories) as max_calories,
    AVG(calories) as avg_calories,
    MIN(activity_day) as first_date,
    MAX(activity_day) as last_date,
    COUNT(DISTINCT activity_day) as unique_dates
FROM 
    daily_calories;
    
SELECT 
    COUNT(*) as total_rows,
    COUNT(id) as id_count,
    COUNT(activity_hour) as hour_count,
    COUNT(calories) as calories_count
FROM 
    hourly_calories;
-- Insight: No Null values, hourly_calories is clean

-- Check for duplicate user/hour combinations in hourly_calories
SELECT 
    id, activity_hour, 
    COUNT(*) as duplicate_count
FROM 
    hourly_calories
GROUP BY 
    id, activity_hour
HAVING 
    COUNT(*) > 1;
-- Insight: No duplicates found

-- Check hourly calorie ranges and time span
SELECT 
    MIN(calories) AS min_calories,
    MAX(calories) AS max_calories,
    ROUND(AVG(calories)) AS avg_calories,   -- use ROUND or CAST in MySQL
    MIN(activity_hour) AS first_hour,
    MAX(activity_hour) AS last_hour,
    COUNT(DISTINCT DATE(activity_hour)) AS unique_dates,
    COUNT(DISTINCT id) AS unique_users
FROM 
    hourly_calories;

-- Insight: Hourly calories shows realistic hourly burn rates (42-948, avg 97 cal/hour) with 33 users tracked across 31 days, indicating granular tracking capability that could enable premium time-based analytics features for Strava.
