{{ config(materialized='table') }}

with staged_data as (

    select * from {{ ref('aeroplanes_staging') }} as aeroplane
    left join {{ ref('aeroplane_models_staging') }} as aero_model
        on aeroplane.airplane_model = aero_model.series

)

select *
from staged_data
