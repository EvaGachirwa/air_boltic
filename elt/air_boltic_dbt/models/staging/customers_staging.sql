{{ config(materialized='view') }}

with source_data as (

    select * from customers

)

select *
from source_data
