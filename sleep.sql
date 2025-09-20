SELECT 
    COUNT(DISTINCT id) as sleep_tracking_users,
    (SELECT COUNT(DISTINCT id) FROM daily_activity) as total_users,
    ROUND(COUNT(DISTINCT id) * 100.0 / (SELECT COUNT(DISTINCT id) FROM daily_activity), 1) as sleep_adoption_percentage,
    ROUND(AVG(total_minutes_asleep)) as avg_minutes_asleep,
    ROUND(AVG(total_minutes_asleep) / 60.0, 1) as avg_hours_asleep,
    ROUND(AVG(total_time_in_bed)) as avg_minutes_in_bed,
    ROUND(AVG(total_time_in_bed) / 60.0, 1) as avg_hours_in_bed
FROM sleep_day;