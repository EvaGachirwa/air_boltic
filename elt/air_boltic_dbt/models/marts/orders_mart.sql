{{ config(materialized='table') }}

with order_data as (

    select * from {{ ref('orders_ssot') }}

)

select *
from order_data
