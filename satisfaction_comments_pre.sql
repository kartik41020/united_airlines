-- select distinct satisfaction_type, meal_group, meal_category, cabin_code, score.fleet_usage, hub_spoke, international_domestic_indicator, cabin_code_desc, number_of_legs, score.arrival_delay_group, haul_type, verbatim_text
-- from customer_comments as cust inner join satisfaction_score as score
-- on cust.flight_number = score.flight_number
-- and cust.origin_station_code = score.origin_station_code
-- and cust.destination_station_code = score.destination_station_code
-- and cust.scheduled_departure_date = score.scheduled_departure_date
-- Inner join pre_order AS pre
-- on pre.flight_number = score.flight_number
-- and pre.departure_station_code = score.origin_station_code
-- and pre.arrival_station_code = score.destination_station_code
-- and pre.scheduled_departure_dtl = score.scheduled_departure_date
-- -- and pre.record_locator = score.record_locator
-- where driver_sub_group2 != 'comp' and satisfaction_type = 'Dissatisfied'


SELECT word, COUNT(*) as frequency
FROM (
    SELECT regexp_split_to_table(verbatim_text, E'\\s+') as word FROM
    customer_comments as cust inner join satisfaction_score as score
on cust.flight_number = score.flight_number
and cust.origin_station_code = score.origin_station_code
and cust.destination_station_code = score.destination_station_code
and cust.scheduled_departure_date = score.scheduled_departure_date
Inner join pre_order AS pre
on pre.flight_number = score.flight_number
and pre.departure_station_code = score.origin_station_code
and pre.arrival_station_code = score.destination_station_code
and pre.scheduled_departure_dtl = score.scheduled_departure_date
where driver_sub_group2 != 'comp' and satisfaction_type = 'Dissatisfied'
) AS words
GROUP BY word
ORDER BY frequency DESC
LIMIT 200