-- Q5: Does credit union size correlate with auto loan delinquency rate?

SELECT
d.cu_name,
(lb.new_vehicle_loans + lb.used_vehicle_loans) AS total_loan_balance,
(a.new_vehicle_delinquency + a.used_vehicle_delinquency) AS total_delinquency,
ROUND((a.new_vehicle_delinquency + a.used_vehicle_delinquency) / NULLIF((lb.new_vehicle_loans + lb.used_vehicle_loans), 0) * 100, 2) AS delinquency_rate_pct
FROM auto_loans AS a
JOIN loan_balances AS lb
ON a.cu_number = lb.cu_number
JOIN cu_directory AS d
ON a.cu_number = d.cu_number
WHERE a.cycle_date = (SELECT MAX(cycle_date) FROM auto_loans)
AND (lb.new_vehicle_loans + lb.used_vehicle_loans) > 0
ORDER BY delinquency_rate_pct desc
LIMIT 25;
