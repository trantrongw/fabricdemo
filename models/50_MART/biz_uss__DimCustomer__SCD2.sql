select 
    {{ dbt_utils.generate_surrogate_key(['DV_HUB_CUSTOMER_HK', 'DV_LOAD_DATE']) }}  
        as [_KEY_CUSTOMER]
    , CONCAT(Title, ' ',[GivenName], ' ', [Surname]) as CustomerName
    , Age
    , DV_LOAD_DATE as [DV_START_DATE]
    , DV_END_DATE as [DV_END_DATE]
from {{ ref('biz_sat__hub__customer__current') }} 