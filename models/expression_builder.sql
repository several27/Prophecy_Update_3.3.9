

{% set env_flag = 'development' %}

WITH customers_update AS (

  SELECT * 
  
  FROM {{ ref('customers_update')}}

),

customers_raw AS (

  SELECT * 
  
  FROM {{ ref('customers_raw')}}

),

by_customer_id_first_name AS (

  {#Combines raw customer data with updates to maintain accurate customer records.#}
  SELECT 
    customers_raw.customer_id AS customer_id,
    customers_raw.first_name AS first_name,
    customers_raw.last_name AS last_name,
    customers_raw.updated_at AS updated_at
  
  FROM customers_raw
  INNER JOIN customers_update
     ON customers_update.customer_id = customers_raw.customer_id

),

customer_info_with_env AS (

  {#Compiles customer information with their full names and environment flags for better tracking.#}
  SELECT 
    customer_id AS customer_id,
    concat(first_name, ' ', last_name) AS full_name,
    updated_at AS updated_at,
    '{{ env_flag }}' AS env
  
  FROM by_customer_id_first_name AS in0

),

customers_above_id_3 AS (

  {#Filters customer information to focus on customers with IDs greater than 3.#}
  SELECT * 
  
  FROM customer_info_with_env AS in0
  
  WHERE customer_id > 3

)

SELECT *

FROM customers_above_id_3
