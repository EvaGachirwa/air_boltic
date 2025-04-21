{{ config(materialized='table') }}

with staged_data as (

    select * from {{ ref('orders_staging') }} orders
    LEFT JOIN {{ ref('customers_staging') }} as customer
    ON
        orders.'customer ID' = customer.'Customer ID'
    LEFT JOIN {{ ref('trips_staging') }} trips
    ON
        orders.'Trip ID' = trips.'Trip ID'

)

select *
from staged_data
