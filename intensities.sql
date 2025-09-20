SELECT 
    COUNT(*) as total_rows,
    COUNT(id) as id_count,
    COUNT(activity_day) as date_count,
    COUNT(sedentary_minutes) as sedentary_count,
    COUNT(lightly_active_minutes) as lightly_active_count,
    COUNT(fairly_active_minutes) as fairly_active_count,
    COUNT(very_active_minutes) as very_active_count
FROM 
    daily_intensities;
-- Insight: No Null values, daily_intensities is clean

-- Check for duplicate user/date combinations in daily_intensities
SELECT 
    id, activity_day,  
    COUNT(*) as duplicate_count
FROM 
    daily_intensities
GROUP BY 
    id, activity_day
HAVING 
    COUNT(*) > 1;
-- Insight: No duplicates found

-- Check activity intensity ranges and patterns
SELECT 
    MIN(sedentary_minutes) as min_sedentary,
    MAX(sedentary_minutes) as max_sedentary,
    AVG(sedentary_minutes) as avg_sedentary,
    MIN(very_active_minutes) as min_very_active,
    MAX(very_active_minutes) as max_very_active,
    AVG(very_active_minutes) as avg_very_active,
    MIN(activity_day) as first_date,
    MAX(activity_day) as last_date
FROM 
    daily_intensities;
    SELECT 
    COUNT(DISTINCT id) as unique_users,
    COUNT(*) as total_records,
    ROUND(COUNT(*) / COUNT(DISTINCT id), 1) as avg_days_per_user
FROM 
    daily_intensities;

SELECT 
    COUNT(*) as total_rows,
    COUNT(id) as id_count,
    COUNT(activity_hour) as hour_count,
    COUNT(total_intensity) as total_intensity_count,
    COUNT(average_intensity) as avg_intensity_count
FROM 
    hourly_intensities;
-- Insight: No Null values, hourly_intensities is clean

-- Check for duplicate user/hour combinations in hourly_intensities
SELECT 
    id, activity_hour, 
    COUNT(*) as duplicate_count
FROM 
    hourly_intensities
GROUP BY 
    id, activity_hour
HAVING 
    COUNT(*) > 1;
-- Insight: No duplicates found

-- Check hourly intensity ranges and patterns
SELECT 
    MIN(total_intensity) as min_total_intensity,
    MAX(total_intensity) as max_total_intensity,
    ROUND(AVG(total_intensity)) as avg_total_intensity,
    MIN(average_intensity) as min_avg_intensity,
    MAX(average_intensity) as max_avg_intensity,
    ROUND(AVG(average_intensity), 2) as avg_avg_intensity,
    MIN(activity_hour) as first_hour,
    MAX(activity_hour) as last_hour,
    COUNT(DISTINCT id) as unique_users
FROM 
    hourly_intensities;
-- Insight: Hourly intensities reveal low activity patterns (avg 12 total intensity, 0.20 average intensity) with significant variation (0-180 range), indicating most hours are sedentary with occasional high-intensity periods - valuable for Strava's activity optimization algorithms.
