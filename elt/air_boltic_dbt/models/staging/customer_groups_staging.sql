{{ config(materialized='view') }}

with source_data as (

    select
        id,
        type,
        name,
        "Registry Number" as registry_number
    from customer_groups

)

select *
from source_data
