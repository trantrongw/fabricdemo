
-- Use the `ref` function to select from other models

select top 100 *
from {{ ref('my_first_dbt_model') }}

