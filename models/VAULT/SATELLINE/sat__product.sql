{%- set yaml_metadata -%}
source_model: "hash__product"
src_pk: "DV_PRODUCT_HASHKEY"
src_hashdiff: 
  source_column: "DV_PRODUCT_HASHDIFF"
  alias: "HASHDIFF"
src_payload:
  - "Brand"
  - "Category"
  - "CategoryCode"
  - "Color"
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