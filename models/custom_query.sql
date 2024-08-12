{{
  config({    
    "materialized": "table"
  })
}}

{% set id_threshold = 3 %}

WITH customers_raw AS (

  SELECT * 
  
  FROM {{ ref('customers_raw')}}

)

SELECT *

FROM customers_raw

WHERE customer_id > {{id_threshold}}
