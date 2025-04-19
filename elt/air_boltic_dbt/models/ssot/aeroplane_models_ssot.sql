{{ config(materialized='table') }}

with staged_data as (

    select * from {{ ref('aeroplane_models_staging') }}

)

select *
from staged_data
