{% macro currency_to_usd(currency_column, amount_column) %}
case when {{currency_column}} = 'USD' then {{amount_column}}
     when {{currency_column}} = 'INR' then {{amount_column}} * 0.012
     when {{currency_column}} = 'EUR' then {{amount_column}} * 1.1
     when {{currency_column}} = 'GBP' then {{amount_column}} * 1.3
     else null end
{% endmacro %}