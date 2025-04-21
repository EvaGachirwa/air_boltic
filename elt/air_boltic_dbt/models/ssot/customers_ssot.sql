{{ config(materialized='table') }}

with staged_data as (

    select * from {{ ref('customers_staging') }} as customer
    LEFT JOIN {{ ref('customer_groups_staging') }} as cust_group
    ON
        customer.'Customer Group ID' = cust_group.ID

)

select *
from staged_data
