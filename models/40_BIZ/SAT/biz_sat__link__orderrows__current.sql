SELECT *,coalesce(lead(T.DV_LOAD_DATE) 
  over (PARTITION BY T.DV_LNK_ORDERROWS_HK ORDER BY T.DV_LOAD_DATE DESC), cast('9999-12-31' 
  as DATE))as DV_END_DATE
FROM {{ ref('raw_sat__link__orderrows') }} AS T