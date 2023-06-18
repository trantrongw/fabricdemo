select
    *
from {{ source('RAW', 'orderrows') }} 