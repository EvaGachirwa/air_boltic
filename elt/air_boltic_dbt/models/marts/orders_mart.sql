{{ config(materialized='table') }}

with order_data as (

    select date(start_time) as trip_start_date
, date(end_time) as trip_end_date
, destination_city
, origin_city
, phone_number
, email
, name
, status
, seat_number
, price_in_euro
, order_id 
from {{ ref('orders_ssot') }}

)

select *
from order_data
