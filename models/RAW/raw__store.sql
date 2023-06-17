select
    *
from {{ source('RAW', 'orders') }} 