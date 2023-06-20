SELECT  
	E.DV_HUB_CUSTOMER_HK as [_KEY_CUSTOMER]
	, F.[OrderDate]
	,F.[DeliveryDate]
	,G.[Quantity]*G.[UnitPrice] as [Amount]
  FROM {{ ref('raw_link__orderrows') }}  A
	inner join {{ ref('raw_hub__order') }} B ON A.DV_HUB_ORDER_HK = B.DV_HUB_ORDER_HK
	inner join {{ ref('raw_link__order') }} D on D.DV_HUB_ORDER_HK = B.DV_HUB_ORDER_HK
	inner join {{ ref('raw_hub__customer') }} E ON E.DV_HUB_CUSTOMER_HK = D.DV_HUB_CUSTOMER_HK
	inner join {{ ref('biz_sat__hub__order__current') }} F ON D.DV_HUB_ORDER_HK = F.DV_HUB_ORDER_HK
	inner join {{ ref('biz_sat__link__orderrows__current') }} G ON A.[DV_LNK_ORDERROWS_HK] = G.[DV_LNK_ORDERROWS_HK]
 WHERE F.[DV_END_DATE] = '9999-12-31' and G.[DV_END_DATE] = '9999-12-31' 