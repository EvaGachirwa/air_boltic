{{ config(materialized='table') }}

with staged_data as (

    select * from {{ ref('trips_staging') }} trips 
    LEFT JOIN {{ ref('aeroplanes_staging') }} as aeroplane
    ON
        trips.airplane_id = aeroplane.airplane_id

)

select *
from staged_data
