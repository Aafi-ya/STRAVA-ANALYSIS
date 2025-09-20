SELECT 
    COUNT(*) as total_rows,
    COUNT(id) as id_count,
    COUNT(activity_date) as date_count,
    COUNT(total_steps) as steps_count,
    COUNT(total_distance) as distance_count,
    COUNT(tracker_distance) as tracker_distance_count,
    COUNT(logged_activities_distance) as logged_activities_count,
    COUNT(very_active_distance) as very_active_distance_count,
    COUNT(moderately_active_distance) as moderately_active_distance_count,
    COUNT(light_active_distance) as light_active_distance_count,
    COUNT(sedentary_active_distance) as sedentary_active_distance_count,
    COUNT(very_active_minutes) as very_active_minutes_count,
    COUNT(fairly_active_minutes) as fairly_active_minutes_count,
    COUNT(lightly_active_minutes) as lightly_active_minutes_count,
    COUNT(sedentary_minutes) as sedentary_minutes_count,
    COUNT(calories) as calories_count
FROM 
    daily_activity;
-- Insight: No NULL values - daily_activity is clean

-- Check for duplicate user/date combinations
SELECT 
    id, activity_date, 
    COUNT(*) as duplicate_count
FROM 
    daily_activity
GROUP BY 
    id, activity_date
HAVING 
    COUNT(*) > 1;
-- Insight: No duplicates found

-- Check for unrealistic values and date range
SELECT 
    MIN(total_steps) as min_steps,
    MAX(total_steps) as max_steps,
    AVG(total_steps) as avg_steps,
    MIN(calories) as min_calories,
    MAX(calories) as max_calories,
    AVG(calories) as avg_calories,
    MIN(total_distance) as min_distance,
    MAX(total_distance) as max_distance,
    MIN(activity_date) as first_date,
    MAX(activity_date) as last_date,
    COUNT(DISTINCT activity_date) as unique_dates
FROM 
    daily_activity;
-- Insight: Data spans exactly 31 days (April 12 - May 12, 2016) with realistic ranges - average user takes 7,638 steps and burns 2,304 calories daily, though some days show zero activity indicating device non-usage periods.

-- How many unique users and their activity patterns
SELECT 
    COUNT(DISTINCT id) as unique_users,
    COUNT(*) as total_records,
    ROUND(COUNT(*)/ COUNT(DISTINCT id), 1) as avg_days_per_user
FROM 
    daily_activity;
