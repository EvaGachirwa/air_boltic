{{ config(materialized='view') }}

with source_data as (

    select "Customer ID" as customer_id
    , Name as name
    , "Customer Group ID" as customer_group_id
    , Email as email
    , "Phone Number" as phone_number
    from customers

)

select *
from source_data
