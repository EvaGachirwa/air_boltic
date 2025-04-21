{{ config(materialized='view') }}

with source_data as (

    select ID as id
    , Type as type
    , Name as name
    , "Registry Number" as registry_number
    from customer_groups

)

select *
from source_data
