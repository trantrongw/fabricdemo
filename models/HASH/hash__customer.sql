{%- set yaml_metadata -%}
source_model: raw__customer
derived_columns:
  DV_RECORD_SOURCE: '!contoso_dbo_customer'
  DV_LOAD_DATE: CONVERT(DATETIME2(6), '{{ var('load_date') }}')
  CUSTOMER_ID: CustomerKey
  DV_TENANT_ID: '!default'
  DV_BKEY_CODE: '!default'
hashed_columns: 
    DV_HUB_CUSTOMER_HK:
    - DV_TENANT_ID
    - DV_BKEY_CODE
    - CUSTOMER_ID
    DV_SAT_CUSTOMER_HASHDIFF:
      is_hashdiff: true
      exclude_columns: true
      columns:
              - Gender
              - Title
              - GivenName
              - MiddleInitial
              - Surname
              - StreetAddress
              - City
              - State
              - StateFull
              - ZipCode
              - Country
              - CountryFull
              - Birthday
              - Age
              - Occupation
              - Company
              - Vehicle
              - Latitude
              - Longitude
              - Continent
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{{ automate_dv.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}