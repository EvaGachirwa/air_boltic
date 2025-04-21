{{ config(materialized='view') }}

with source_data as (

    select * from trips

)

select *
from source_data
