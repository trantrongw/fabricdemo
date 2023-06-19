{%- macro default__binary_ghost(alias, hash) -%}
    {%- if hash | lower == 'md5' -%}
        CAST(REPLICATE('0', 32) AS CHAR(32))
	{%- elif hash | lower == 'sha' -%}
        CAST(REPLICATE('0', 64) AS CHAR(64))
    {%- else -%}
        CAST(REPLICATE('0', 32) AS CHAR(32))
    {%- endif -%}

    {%- if alias %} AS {{ alias }} {%- endif -%}
{%- endmacro -%}