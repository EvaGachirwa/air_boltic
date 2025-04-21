{{ config(materialized='table') }}

with staged_data as (

    select * from {{ ref('orders_staging') }} as orders
    left join {{ ref('customers_staging') }} as customer
        on
            orders.customer_id = customer.customer_id
    left join {{ ref('trips_staging') }} as trips
        on
            orders.trip_id = trips.trip_id

)

select *
from staged_data
