{%- set yaml_metadata -%}
source_model: "hash__customer"
src_pk: "DV_HUB_CUSTOMER_HK"
src_hashdiff: 
  source_column: "DV_SAT_CUSTOMER_HASHDIFF"
  alias: "HASHDIFF"
src_payload:
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
src_ldts: "DV_LOAD_DATE"
src_source: "DV_RECORD_SOURCE"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.sat(src_pk=metadata_dict["src_pk"],
                   src_hashdiff=metadata_dict["src_hashdiff"],
                   src_payload=metadata_dict["src_payload"],
                   src_ldts=metadata_dict["src_ldts"],
                   src_source=metadata_dict["src_source"],
                   source_model=metadata_dict["source_model"])   }}