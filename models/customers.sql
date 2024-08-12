{{
  config({    
    "materialized": "view"
  })
}}

WITH customers_raw AS (

  SELECT * 
  
  FROM {{ ref('customers_raw')}}

)

SELECT *

FROM customers_raw
