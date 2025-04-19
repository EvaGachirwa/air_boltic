{{ config(materialized='table') }}

with staged_data as (

    select * from {{ ref('trips_staging') }}

)

select *
from staged_data
