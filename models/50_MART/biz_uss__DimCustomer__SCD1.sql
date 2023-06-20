select A.DV_HUB_CUSTOMER_HK as [_KEY_CUSTOMER]
    , CONCAT(B.Title, ' ',B.[GivenName], ' ', B.[Surname]) as CustomerName
    , B.Age
from {{ ref('raw_hub__customer') }} A 
inner join {{ ref('biz_sat__hub__customer__current') }} B 
ON A.DV_HUB_CUSTOMER_HK = B.DV_HUB_CUSTOMER_HK
WHERE B.[DV_END_DATE] = '9999-12-31'