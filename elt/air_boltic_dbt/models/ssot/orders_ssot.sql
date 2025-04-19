{{ config(materialized='table') }}

with staged_data as (

    select * from {{ ref('orders_staging') }}

)

select *
from staged_data
