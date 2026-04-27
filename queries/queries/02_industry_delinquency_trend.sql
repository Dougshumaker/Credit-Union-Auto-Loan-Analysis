select auto_loans.cycle_date , 
sum(new_vehicle_delinquency) as new_vehicle_delinquency,
sum(used_vehicle_delinquency) as used_vehicle_delinquency , 
sum(auto_loans.new_vehicle_delinquency) + sum(auto_loans.used_vehicle_delinquency) as total_delinquency from auto_loans
group by cycle_date
order by cycle_date desc
