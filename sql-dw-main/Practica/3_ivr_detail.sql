CREATE OR REPLACE TABLE keepcoding.ivr_detail AS
SELECT im.ivr_id AS calls_ivr_id
      , phone_number AS calls_phone_number
      , ivr_result AS calls_ivr_result
      , vdn_label AS calls_vdn_label
      , start_date AS calls_start_date
      , FORMAT_DATE('%Y%m%d', DATE(start_date)) AS calls_start_date_id     
      , end_date AS calls_end_date
      , FORMAT_DATE('%Y%m%d', DATE(end_date)) AS calls_end_date_id      
      , total_duration AS calls_total_duration
      , customer_segment AS calls_customer_segment
      , ivr_language AS calls_ivr_language
      , steps_module AS calls_steps_module
      , module_aggregation AS calls_module_aggregation
      , ist.module_sequece AS module_sequece
      , module_name AS module_name
      , module_duration AS module_duration
      , module_result AS module_result
      , step_sequence AS step_sequence
      , step_name AS step_name
      , step_result AS step_result
      , step_description_error AS step_description_error
      , document_type AS document_typecustomer_segment
      , document_identification AS document_identification
      , customer_phone AS customer_phone
      , billing_account_id AS billing_account_id
FROM `keepcoding.ivr_calls` ic
LEFT JOIN `keepcoding.ivr_modules` im
        ON  ic.ivr_id = im.ivr_id
LEFT JOIN `keepcoding.ivr_steps` ist
        ON im.ivr_id = ist.ivr_id AND ist.module_sequece = im.module_sequece;       