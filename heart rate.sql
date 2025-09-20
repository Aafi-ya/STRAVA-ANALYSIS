 -- Check for NULL values in heartrate_seconds
SELECT 
    COUNT(*) as total_rows,
    COUNT(id) as id_count,
    COUNT(time) as time_count,
    COUNT(value) as heartrate_count
FROM 
    heartrate_seconds;
-- Insight: No Null values, heartrate_seconds is clean

-- Check for duplicate user/time combinations in heartrate_seconds
SELECT 
    id, time, 
    COUNT(*) as duplicate_count
FROM 
    heartrate_seconds
GROUP BY 
    id, time
HAVING 
    COUNT(*) > 1;
-- Insight: No duplicates found

-- Check heart rate ranges and patterns
SELECT 
    MIN(value) as min_heartrate,
    MAX(value) as max_heartrate,
    ROUND(AVG(value), 1) as avg_heartrate,
    MIN(time) as first_timestamp,
    MAX(time) as last_timestamp,
    COUNT(DISTINCT DATE(time)) as unique_dates,
    COUNT(DISTINCT id) as unique_users
FROM 
    heartrate_seconds;
-- Insight: Heart rate data covers realistic ranges (36-203 BPM, avg 77.3) but only 14 of 33 users have heart rate tracking, revealing significant opportunity for Strava to increase wearable device adoption and premium heart rate analytics features.
