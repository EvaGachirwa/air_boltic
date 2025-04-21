{{ config(materialized='table') }}

with order_data as (

    select "Start Timestamp"
, "End Timestamp"
, "Destination City"
, "Origin City"
, "Phone Number"
, email
, "Name"
, status
, "Seat No"
, "Price (Eur)"
, "Order ID" from {{ ref('orders_ssot') }}

)

select *
from order_data
