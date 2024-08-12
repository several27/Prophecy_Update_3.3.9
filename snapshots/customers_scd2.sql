{% snapshot customers_scd2 %}
{{
  config({    
    "strategy": "timestamp",
    "target_schema": "prophecy_update_3_3_9",
    "unique_key": "customer_id",
    "updated_at": "updated_at"
  })
}}

WITH customers_update AS (

  SELECT *
  
  FROM {{ ref('customers_update')}}

)

SELECT *

FROM customers_update

{% endsnapshot %}
