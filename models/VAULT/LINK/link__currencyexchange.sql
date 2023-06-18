{%- set yaml_metadata -%}
source_model: 
  - hash__currencyexchange
src_pk: DV_LNK_CURRENCYEXCHANGE_HK
src_fk: 
  - DV_FROMCURRENCY_HK
  - DV_TOCURRENCY_HK
  - Date
src_ldts: DV_LOAD_DATE
src_source: DV_RECORD_SOURCE
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.link(src_pk=metadata_dict["src_pk"],
                    src_fk=metadata_dict["src_fk"], 
                    src_ldts=metadata_dict["src_ldts"],
                    src_source=metadata_dict["src_source"], 
                    source_model=metadata_dict["source_model"]) }}