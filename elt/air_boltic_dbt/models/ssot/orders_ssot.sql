{{ config(materialized='table') }}

with source_data as (

    select * from orders

)

select *
from source_data
