{{ config(materialized='view') }}

with source_data as (

    select * from customer_groups

)

select *
from source_data
