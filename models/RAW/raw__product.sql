select
    *
from {{ source('RAW', 'product') }} 