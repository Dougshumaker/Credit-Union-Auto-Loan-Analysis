-- Q4: What is the ratio of used vs new vehicle delinquency by credit union?

SELECT
d.cu_name,
a.cycle_date,
a.new_vehicle_delinquency,
a.used_vehicle_delinquency,
ROUND(a.used_vehicle_delinquency / NULLIF(a.new_vehicle_delinquency, 0), 2) AS used_to_new_ratio
FROM auto_loans AS a
JOIN cu_directory AS d
ON a.cu_number = d.cu_number
WHERE a.cycle_date = (SELECT MAX(cycle_date) FROM auto_loans)
AND a.new_vehicle_delinquency > 0
AND a.used_vehicle_delinquency > 0
ORDER BY used_to_new_ratio DESC
LIMIT 25;
