{{ config(materialized='table') }}

with staged_data as (

    select * from {{ ref('aeroplanes_staging') }}

)

select *
from staged_data
