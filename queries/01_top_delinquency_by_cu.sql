-- Q1: Which credit unions have the highest total auto loan delinquency?
-- Looks at most recent quarter. Joins name from cu_directory.

SELECT
    d.cu_name,
    a.cycle_date,
    a.new_vehicle_delinquency,
    a.used_vehicle_delinquency,
    (a.new_vehicle_delinquency + a.used_vehicle_delinquency) AS total_delinquency
FROM auto_loans AS a
INNER JOIN cu_directory AS d
    ON a.cu_number = d.cu_number
WHERE a.cycle_date = (SELECT MAX(cycle_date) FROM auto_loans)
ORDER BY total_delinquency DESC
LIMIT 25;
 
