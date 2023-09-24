with base_results as (

  select * from {{ ref('mrt_results') }}
  
), 

pit_stops as (

  select * from {{ ref('fct_pit_stops') }}
  
),

pit_stops_joined as (

    select 
        base_results.race_id,
        race_year,
        base_results.driver_id,
        constructor_id,
        constructor_name,
        stop_number,
        lap, 
        pit_stop_time,
        pit_stop_duration_seconds, 
        pit_stop_milliseconds,
        total_pit_stops_per_race
    from base_results
    leftjoin pit_stops
        on base_results.race_id=pit_stops.race_id and base_results.driver_id=pit_stops.driver_id
)
select * from pit_stops_joined
