{%- macro default__type_binary() -%}
    {%- if var('hash', 'MD5') | lower == 'md5' -%}
        CHAR(32)
    {%- elif var('hash', 'MD5') | lower == 'sha' -%}
        CHAR(64)
    {%- else -%}
        CHAR(32)
    {%- endif -%}
{%- endmacro -%}