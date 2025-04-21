{{ config(materialized='view') }}

with source_data as (

    select
        type,
        series,
        max_seats,
        max_weight,
        max_distance,
        engine_type
    from aeroplane_models

)

select *
from source_data
