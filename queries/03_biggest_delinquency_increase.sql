-- Q3: Which credit unions showed the biggest delinquency increase over the period?

SELECT
    d.cu_name,
    early.total_delinquency AS delinquency_2024_q1,
    late.total_delinquency AS delinquency_2025_q4,
    (late.total_delinquency - early.total_delinquency) AS absolute_increase,
    ROUND((late.total_delinquency - early.total_delinquency) / NULLIF(early.total_delinquency, 0) * 100, 2) AS pct_increase
FROM (SELECT 
		cu_number,
        new_vehicle_delinquency + used_vehicle_delinquency) AS total_delinquency
   		FROM auto_loans
    WHERE cycle_date = '2024-03') AS early
JOIN (SELECT 
		cu_number,
       (new_vehicle_delinquency + used_vehicle_delinquency) AS total_delinquency
    	FROM auto_loans
    WHERE cycle_date = '2025-12') AS late
ON early.cu_number = late.cu_number
JOIN cu_directory AS d
ON early.cu_number = d.cu_number
WHERE late.total_delinquency > early.total_delinquency
ORDER BY absolute_increase DESC
LIMIT 25;
