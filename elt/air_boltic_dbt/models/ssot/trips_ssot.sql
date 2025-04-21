{{ config(materialized='table') }}

with staged_data as (

    select * from {{ ref('trips_staging') }} as trips
    left join {{ ref('aeroplanes_staging') }} as aeroplane
        on
            trips.airplane_id = aeroplane.airplane_id

)

select *
from staged_data
