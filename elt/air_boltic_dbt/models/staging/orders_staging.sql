{{ config(materialized='view') }}

with source_data as (

    select
        "Order ID" as order_id,
        "Customer ID" as customer_id,
        "Trip ID" as trip_id,
        "Price (EUR)" as price_in_euro,
        "Seat No" as seat_number,
        status
    from orders

)

select *
from source_data
