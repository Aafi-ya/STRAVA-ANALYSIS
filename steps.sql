SELECT 
    COUNT(*) as total_rows,
    COUNT(id) as id_count,
    COUNT(activity_day) as date_count,
    COUNT(step_total) as steps_count
FROM 
    daily_steps;
-- Insight: No Null values, daily_steps is clean

-- Check for duplicate user/date combinations in daily_steps
SELECT 
    id, activity_day, 
    COUNT(*) as duplicate_count
FROM 
    daily_steps
GROUP BY 
    id, activity_day
HAVING 
    COUNT(*) > 1;
-- Insight: No duplicates found

-- Check step ranges and date span for daily_steps
SELECT 
    MIN(step_total) as min_steps,
    MAX(step_total) as max_steps,
    AVG(step_total) as avg_steps,
    MIN(activity_day) as first_date,
    MAX(activity_day) as last_date,
    COUNT(DISTINCT activity_day) as unique_dates
FROM 
    daily_steps;
-- Insight: Daily steps perfectly matches daily_activity step data - same ranges (0-36,019, avg 7,638) and date coverage, confirming excellent data consistency across daily tables.

-- Check unique users and consistency for daily_steps
SELECT 
    COUNT(DISTINCT id) as unique_users,
    COUNT(*) as total_records,
    ROUND(COUNT(*)/ COUNT(DISTINCT id), 1) as avg_days_per_user
FROM 
    daily_steps;
    
   
-- Insight: Daily steps shows identical user engagement pattern - 33 users with 28.5 avg tracking days, confirming perfect consistency across all daily-level tables.
