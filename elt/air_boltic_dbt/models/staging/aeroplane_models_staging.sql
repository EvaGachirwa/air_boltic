{{ config(materialized='view') }}

with source_data as (

    select * from aeroplane_models

)

select *
from source_data
