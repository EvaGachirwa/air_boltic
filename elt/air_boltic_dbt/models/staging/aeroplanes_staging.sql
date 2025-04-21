{{ config(materialized='view') }}

with source_data as (

    select
        "Airplane ID" as airplane_id,
        "Airplane Model" as airplane_model,
        manufacturer
    from aeroplanes

)

select *
from source_data
