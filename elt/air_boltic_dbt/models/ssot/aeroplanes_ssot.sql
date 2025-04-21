{{ config(materialized='table') }}

with staged_data as (

    select * from {{ ref('aeroplanes_staging') }} as aeroplane
    left join {{ ref('aeroplane_models_staging') }} as aero_model
    on aero_model.series = aeroplane.airplane_model

)

select *
from staged_data
