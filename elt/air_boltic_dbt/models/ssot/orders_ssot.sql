{{ config(materialized='table') }}

with staged_data as (

    select * from {{ ref('orders_staging') }} orders
    LEFT JOIN {{ ref('customers_staging') }} as customer
    ON
        orders.customer_id = customer.customer_id
    LEFT JOIN {{ ref('trips_staging') }} trips
    ON
        orders.trip_id = trips.trip_id

)

select *
from staged_data
