select distinct record_locator,haul_type, verbatim_text from customer_comments as cust inner join satisfaction_score as score
on cust.flight_number = score.flight_number
and cust.origin_station_code = score.origin_station_code
and cust.destination_station_code = score.destination_station_code
and cust.scheduled_departure_date = score.scheduled_departure_date
where driver_sub_group2 != 'comp' 
and satisfaction_type = 'Dissatisfied'  
-- AND LOWER(verbatim_text) IN ('good','excellent','great','wonderful','amazing',
-- 'love','happy','satisfied','outstanding','impressed','recommend',
-- 'thrilled','exceptional','pleased','poor','bad','terrible',
-- 'disappointed','frustrated','unhappy','avoid','worst','horrible',
-- 'annoyed','complaint','issue','problem')