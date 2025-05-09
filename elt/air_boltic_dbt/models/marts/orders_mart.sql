{{ config(materialized='table') }}

with order_data as (

    select
        destination_city,
        origin_city,
        phone_number,
        email,
        name,
        status,
        seat_number,
        price_in_euro,
        order_id,
        date(start_time) as trip_start_date,
        date(end_time) as trip_end_date
    from {{ ref('orders_ssot') }}

)

select *
from order_data
