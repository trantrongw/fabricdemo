{%- set yaml_metadata -%}
source_model: raw__orders
derived_columns:
  DV_RECORD_SOURCE: '!contoso_dbo_order'
  DV_LOAD_DATE: CONVERT(DATETIME2(6), '{{ var('load_date') }}')
  ORDER_ID: OrderKey
  CUSTOMER_ID: CustomerKey
  STORE_ID: StoreKey
  DV_TENANT_ID: '!default'
  DV_BKEY_CODE: '!default'
hashed_columns: 
    DV_HUB_ORDER_HK:
    - DV_TENANT_ID
    - DV_BKEY_CODE
    - ORDER_ID
    DV_HUB_CUSTOMER_HK:
    - DV_TENANT_ID
    - DV_BKEY_CODE
    - CUSTOMER_ID
    DV_HUB_STORE_HK:
    - DV_TENANT_ID
    - DV_BKEY_CODE
    - STORE_ID
    DV_LNK_ORDER_HK:
    - DV_TENANT_ID
    - DV_BKEY_CODE
    - OrderKey  
    - CustomerKey
    - StoreKey  
    DV_SAT__HUB__ORDER_HASHDIFF:
      is_hashdiff: true
      columns:
        - OrderDate
        - DeliveryDate
        - CurrencyCode
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}