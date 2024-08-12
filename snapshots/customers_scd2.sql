{% snapshot customers_scd2 %}
{{
  config({    
    "strategy": "timestamp",
    "target_schema": "prophecy_update_3_3_9",
    "unique_key": "customer_id",
    "updated_at": "updated_at"
  })
}}

WITH customers_raw AS (

  SELECT *
  
  FROM {{ ref('customers_raw')}}

)

SELECT *

FROM customers_raw

{% endsnapshot %}
