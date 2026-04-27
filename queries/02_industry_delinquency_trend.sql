-- Q2: How has auto loan delinquency trended industry-wide from 2024 to 2025?
-- Aggregates total delinquency across all credit unions by quarter.

SELECT
    cycle_date,
    SUM(new_vehicle_delinquency)                                    AS total_new_delinquency,
    SUM(used_vehicle_delinquency)                                   AS total_used_delinquency,
    SUM(new_vehicle_delinquency + used_vehicle_delinquency)         AS total_delinquency
FROM auto_loans
GROUP BY cycle_date
ORDER BY cycle_date ASC;
