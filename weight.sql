-- Check for NULL values in weight_log_info
SELECT 
    COUNT(*) as total_rows,
    COUNT(id) as id_count,
    COUNT(date) as date_count,
    COUNT(weight_kg) as weight_kg_count,
    COUNT(weight_pounds) as weight_pounds_count,
    COUNT(fat) as fat_count,
    COUNT(bmi) as bmi_count,
    COUNT(is_manual_report) as manual_report_count,
    COUNT(logid) as logid_count
FROM 
    weight_log_info;
-- Insights: Insight: Weight log info shows complete data except fat percentage (only 2 of 67 records) - indicates most users don't have body composition scales, revealing opportunity for Strava to promote advanced fitness tracking devices.

-- Check for duplicate user/date/logid combinations in weight_log_info
SELECT 
    id, date, logid, 
    COUNT(*) as duplicate_count
FROM 
    weight_log_info
GROUP BY 
    id, date, logid
HAVING 
    COUNT(*) > 1;
-- Insight: No duplicates found

-- Check weight and body composition ranges and patterns
SELECT 
    MIN(weight_kg) as min_weight_kg,
    MAX(weight_kg) as max_weight_kg,
    ROUND(AVG(weight_kg), 2) as avg_weight_kg,
    MIN(weight_pounds) as min_weight_pounds,
    MAX(weight_pounds) as max_weight_pounds,
    ROUND(AVG(weight_pounds), 2) as avg_weight_pounds,
    MIN(bmi) as min_bmi,
    MAX(bmi) as max_bmi,
    ROUND(AVG(bmi), 2) as avg_bmi,
    MIN(date) as first_date,
    MAX(date) as last_date,
    COUNT(DISTINCT id) as unique_users,
    COUNT(fat) as users_with_fat_data
FROM 
    weight_log_info;
-- Insight: Weight data shows realistic ranges (avg 72kg, BMI 25.19) but only 8 of 33 users track weight (24% adoption) with just 2 tracking body fat - major opportunity for Strava to expand health tracking engagement and premium wellness features.