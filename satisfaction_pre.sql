-- select count(*) from pre_order
-- where meal_group = 'ENTREES HOT' and meal_category = 'BREAKFAST'

select distinct * from pre_order as pre inner join satisfaction_score as score
on pre.flight_number = score.flight_number
and pre.departure_station_code = score.origin_station_code
and pre.arrival_station_code = score.destination_station_code
and pre.scheduled_departure_dtl = score.scheduled_departure_date
and pre.record_locator = score.record_locator
where driver_sub_group2 != 'comp' 
