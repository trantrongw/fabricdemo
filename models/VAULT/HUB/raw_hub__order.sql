{%- set yaml_metadata -%}
source_model: hash__order
src_pk: DV_HUB_ORDER_HK
src_nk: ORDER_ID
src_ldts: DV_LOAD_DATE
src_source: DV_RECORD_SOURCE
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.hub(src_pk=metadata_dict["src_pk"],
                   src_nk=metadata_dict["src_nk"], 
                   src_ldts=metadata_dict["src_ldts"],
                   src_source=metadata_dict["src_source"],
                   source_model=metadata_dict["source_model"]) }}