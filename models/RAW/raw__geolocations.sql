select
    *
from {{ source('RAW', 'geolocations') }} 