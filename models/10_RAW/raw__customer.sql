select
    *
from {{ source('RAW', 'customer') }} 