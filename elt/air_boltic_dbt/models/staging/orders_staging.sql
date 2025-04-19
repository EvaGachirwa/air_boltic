{{ config(materialized='view') }}

with source_data as (

    select * from orders

)

select *
from source_data
