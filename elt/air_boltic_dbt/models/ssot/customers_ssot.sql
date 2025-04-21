{{ config(materialized='table') }}

with staged_data as (

    select * from {{ ref('customers_staging') }} as customer
    left join {{ ref('customer_groups_staging') }} as cust_group
        on
            customer.customer_group_id = cust_group.id

)

select *
from staged_data
