{{ config(materialized='view') }}

with source_data as (

    select * from aeroplanes

)

select *
from source_data
