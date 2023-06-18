{%- set yaml_metadata -%}
source_model: raw__currencyexchange
derived_columns:
  DV_RECORD_SOURCE: '!contoso_dbo_currencyexchange'
  DV_LOAD_DATE: CONVERT(DATETIME2(6), '{{ var('load_date') }}')
  CURRENCY_ID: ProductKey
  DV_TENANT_ID: '!default'
  DV_BKEY_CODE: '!default'
hashed_columns: 
    DV_CURRENCY_HASHKEY:
    - DV_TENANT_ID
    - DV_BKEY_CODE
    - PRODUCT_ID
    DV_PRODUCT_HASHDIFF:
      is_hashdiff: true
      columns:
        - ProductCode
        - ProductName  
        - [Manufacturer]
        - [Brand]

{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}