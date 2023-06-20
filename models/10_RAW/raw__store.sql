select
    *
from {{ source('RAW', 'store') }} 