select
    *
from {{ source('RAW', 'date') }} 