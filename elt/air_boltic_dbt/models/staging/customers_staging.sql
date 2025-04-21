{{ config(materialized='view') }}

with source_data as (

    select
        "Customer ID" as customer_id,
        name,
        "Customer Group ID" as customer_group_id,
        email,
        "Phone Number" as phone_number
    from customers

)

select *
from source_data
