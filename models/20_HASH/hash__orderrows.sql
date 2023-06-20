{%- set yaml_metadata -%}
source_model: raw__orderrows
derived_columns:
  DV_RECORD_SOURCE: '!contoso_dbo_orderrows'
  DV_LOAD_DATE: CONVERT(DATETIME2(6), '{{ var('load_date') }}')
  ORDER_ID: OrderKey
  PRODUCT_ID: ProductKey
  DV_TENANT_ID: '!default'
  DV_BKEY_CODE: '!default'
hashed_columns: 
    DV_HUB_ORDER_HK:
    - DV_TENANT_ID
    - DV_BKEY_CODE
    - ORDER_ID
    DV_HUB_PRODUCT_HK:
    - DV_TENANT_ID
    - DV_BKEY_CODE
    - PRODUCT_ID
    DV_LNK_ORDERROWS_HK:
    - DV_TENANT_ID
    - DV_BKEY_CODE
    - ORDER_ID  
    - PRODUCT_ID
    - LineNumber  
    DV_SAT__LNK__ORDERROWS_HASHDIFF:
      is_hashdiff: true
      columns:
        - Quantity
        - UnitPrice
        - NetPrice
        - UnitCost
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}