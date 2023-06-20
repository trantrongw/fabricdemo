select
    *
from {{ source('RAW', 'currencyexchange') }} 