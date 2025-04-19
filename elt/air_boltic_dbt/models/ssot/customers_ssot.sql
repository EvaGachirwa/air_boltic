{{ config(materialized='table') }}

with staged_data as (

    select * from {{ ref('customers_staging') }}

)

select *
from staged_data
