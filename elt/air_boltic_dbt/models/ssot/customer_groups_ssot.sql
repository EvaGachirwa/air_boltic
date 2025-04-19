{{ config(materialized='table') }}

with staged_data as (

    select * from {{ ref('customer_groups_staging') }}

)

select *
from staged_data
