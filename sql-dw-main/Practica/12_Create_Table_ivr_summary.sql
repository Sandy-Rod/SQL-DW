CREATE OR REPLACE TABLE keepcoding.ivr_summary AS
WITH ranked_phone AS (
    SELECT 
        ivr_d.*,
        ROW_NUMBER() OVER (PARTITION BY ivr_d.customer_phone ORDER BY ivr_d.customer_phone DESC) AS rn_phone
    FROM 
        keepcoding.ivr_detail ivr_d
    WHERE 
        ivr_d.customer_phone != 'UNKNOWN'
),
ranked_billing AS (
    SELECT 
        ivr_d.*,
        ROW_NUMBER() OVER (PARTITION BY ivr_d.billing_account_id ORDER BY ivr_d.billing_account_id DESC) AS rn_billing
    FROM 
        keepcoding.ivr_detail ivr_d
    WHERE 
        ivr_d.billing_account_id != 'UNKNOWN'
)

SELECT 
    ivr_d.calls_ivr_id,
    ivr_d.calls_phone_number,
    ivr_d.calls_ivr_result,
    ivr_d.calls_start_date,
    ivr_d.calls_end_date,
    ivr_d.calls_total_duration,
    ivr_d.calls_customer_segment,
    ivr_d.calls_ivr_language,
    ivr_d.calls_steps_module,
    ivr_d.calls_module_aggregation,
    NULL AS vdn_aggregation,
    NULL AS document_type,
    NULL AS document_identification,
    NULL AS customer_phone,
    NULL AS billing_account_id,
    NULL AS masiva_lg,
    NULL AS info_by_phone_lg,
    NULL AS info_by_dni_lg,
    NULL AS repeated_phone_24H,
    NULL AS cause_recall_phone_24H
FROM 
    keepcoding.ivr_detail ivr_d

UNION ALL

SELECT 
    ivr_d.calls_ivr_id,
    NULL AS calls_phone_number,
    NULL AS calls_ivr_result,
    NULL AS calls_start_date,
    NULL AS calls_end_date,
    NULL AS calls_total_duration,
    NULL AS calls_customer_segment,
    NULL AS calls_ivr_language,
    NULL AS calls_steps_module,
    NULL AS calls_module_aggregation,
    CASE 
        WHEN ivr_d.calls_vdn_label LIKE 'ATC%' THEN 'FRONT'
        WHEN ivr_d.calls_vdn_label LIKE 'TECH%' THEN 'TECH'
        WHEN ivr_d.calls_vdn_label LIKE 'ABSORPTION%' THEN 'ABSORPTION'    
        ELSE 'RESTO'            
    END AS vdn_aggregation,
    NULL AS document_type,
    NULL AS document_identification,
    NULL AS customer_phone,
    NULL AS billing_account_id,
    NULL AS masiva_lg,
    NULL AS info_by_phone_lg,
    NULL AS info_by_dni_lg,
    NULL AS repeated_phone_24H,
    NULL AS cause_recall_phone_24H
FROM 
    keepcoding.ivr_detail ivr_d

UNION ALL

SELECT 
    ivr_d.calls_ivr_id,
    NULL AS calls_phone_number,
    NULL AS calls_ivr_result,
    NULL AS calls_start_date,
    NULL AS calls_end_date,
    NULL AS calls_total_duration,
    NULL AS calls_customer_segment,
    NULL AS calls_ivr_language,
    NULL AS calls_steps_module,
    NULL AS calls_module_aggregation,
    NULL AS vdn_aggregation,
    IF(ivr_s.document_type = 'UNKNOWN', NULL, ivr_s.document_type) AS document_type,
    IF(ivr_s.document_identification = 'UNKNOWN', NULL, ivr_s.document_identification) AS document_identification,
    NULL AS customer_phone,
    NULL AS billing_account_id,
    NULL AS masiva_lg,
    NULL AS info_by_phone_lg,
    NULL AS info_by_dni_lg,
    NULL AS repeated_phone_24H,
    NULL AS cause_recall_phone_24H
FROM 
    keepcoding.ivr_detail ivr_d
JOIN 
    keepcoding.ivr_steps ivr_s ON ivr_d.calls_ivr_id = ivr_s.ivr_id 
WHERE 
    ivr_s.document_identification != 'UNKNOWN'  
    AND ivr_s.customer_phone != 'UNKNOWN' 
    AND ivr_d.customer_phone != 'UNKNOWN'

UNION ALL

SELECT 
    ivr_d.calls_ivr_id,
    ivr_d.customer_phone,
    NULL AS calls_ivr_result,
    NULL AS calls_start_date,
    NULL AS calls_end_date,
    NULL AS calls_total_duration,
    NULL AS calls_customer_segment,
    NULL AS calls_ivr_language,
    NULL AS calls_steps_module,
    NULL AS calls_module_aggregation,
    NULL AS vdn_aggregation,
    NULL AS document_type,
    NULL AS document_identification,
    ivr_d.customer_phone AS customer_phone,
    NULL AS billing_account_id,
    NULL AS masiva_lg,
    NULL AS info_by_phone_lg,
    NULL AS info_by_dni_lg,
    NULL AS repeated_phone_24H,
    NULL AS cause_recall_phone_24H
FROM 
    ranked_phone ivr_d
WHERE 
    rn_phone = 1 

UNION ALL

SELECT 
    ivr_d.calls_ivr_id,
    NULL AS calls_phone_number,
    NULL AS calls_ivr_result,
    NULL AS calls_start_date,
    NULL AS calls_end_date,
    NULL AS calls_total_duration,
    NULL AS calls_customer_segment,
    NULL AS calls_ivr_language,
    NULL AS calls_steps_module,
    NULL AS calls_module_aggregation,
    NULL AS vdn_aggregation,
    NULL AS document_type,
    NULL AS document_identification,
    NULL AS customer_phone,
    ivr_d.billing_account_id AS billing_account_id,
    NULL AS masiva_lg,
    NULL AS info_by_phone_lg,
    NULL AS info_by_dni_lg,
    NULL AS repeated_phone_24H,
    NULL AS cause_recall_phone_24H
FROM 
    ranked_billing ivr_d
WHERE 
    rn_billing = 1 

UNION ALL

SELECT 
    ivr_d.calls_ivr_id,
    NULL AS calls_phone_number,
    NULL AS calls_ivr_result,
    NULL AS calls_start_date,
    NULL AS calls_end_date,
    NULL AS calls_total_duration,
    NULL AS calls_customer_segment,
    NULL AS calls_ivr_language,
    NULL AS calls_steps_module,
    NULL AS calls_module_aggregation,
    NULL AS vdn_aggregation,
    NULL AS document_type,
    NULL AS document_identification,
    NULL AS customer_phone,
    NULL AS billing_account_id,
    CASE 
        WHEN ivr_d.module_name = 'AVERIA_MASIVA' THEN 1
        ELSE 0 
    END AS masiva_lg,
    NULL AS info_by_phone_lg,
    NULL AS info_by_dni_lg,
    NULL AS repeated_phone_24H,
    NULL AS cause_recall_phone_24H
FROM 
    keepcoding.ivr_detail ivr_d

UNION ALL

SELECT 
    ivr_d.calls_ivr_id,
    NULL AS calls_phone_number,
    NULL AS calls_ivr_result,
    NULL AS calls_start_date,
    NULL AS calls_end_date,
    NULL AS calls_total_duration,
    NULL AS calls_customer_segment,
    NULL AS calls_ivr_language,
    NULL AS calls_steps_module,
    NULL AS calls_module_aggregation,
    NULL AS vdn_aggregation,
    NULL AS document_type,
    NULL AS document_identification,
    NULL AS customer_phone,
    NULL AS billing_account_id,
    NULL AS masiva_lg,
    CASE
        WHEN ivr_d.step_name = 'CUSTOMERINFOBYPHONE.TX' 
             AND ivr_d.step_result = 'OK' THEN 1
        ELSE 0
    END AS info_by_phone_lg,
    NULL AS info_by_dni_lg,
    NULL AS repeated_phone_24H,
    NULL AS cause_recall_phone_24H
FROM 
    keepcoding.ivr_detail ivr_d

UNION ALL

SELECT 
    ivr_d.calls_ivr_id,
    NULL AS calls_phone_number,
    NULL AS calls_ivr_result,
    NULL AS calls_start_date,
    NULL AS calls_end_date,
    NULL AS calls_total_duration,
    NULL AS calls_customer_segment,
    NULL AS calls_ivr_language,
    NULL AS calls_steps_module,
    NULL AS calls_module_aggregation,
    NULL AS vdn_aggregation,
    NULL AS document_type,
    NULL AS document_identification,
    NULL AS customer_phone,
    NULL AS billing_account_id,
    NULL AS masiva_lg,
    NULL AS info_by_phone_lg,
    CASE
        WHEN ivr_d.step_name = 'CUSTOMERINFOBYDNI.TX' 
             AND ivr_d.step_result = 'OK' THEN 1
        ELSE 0
    END AS info_by_dni_lg,
    NULL AS repeated_phone_24H,
    NULL AS cause_recall_phone_24H
FROM 
    keepcoding.ivr_detail ivr_d

UNION ALL

SELECT 
    ivr_d.calls_ivr_id,
    ivr_d.calls_phone_number,
    NULL AS calls_ivr_result,
    ivr_d.calls_start_date,
    ivr_d.calls_end_date,
    NULL AS calls_total_duration,
    NULL AS calls_customer_segment,
    NULL AS calls_ivr_language,
    NULL AS calls_steps_module,
    NULL AS calls_module_aggregation,
    NULL AS vdn_aggregation,
    NULL AS document_type,
    NULL AS document_identification,
    NULL AS customer_phone,
    NULL AS billing_account_id,
    NULL AS masiva_lg,
    NULL AS info_by_phone_lg,
    NULL AS info_by_dni_lg,
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM keepcoding.ivr_detail ivr_d2
            WHERE ivr_d2.calls_phone_number = ivr_d.calls_phone_number
            AND ivr_d2.calls_end_date BETWEEN ivr_d.calls_start_date - INTERVAL 24 HOUR
            AND ivr_d.calls_start_date
        ) THEN 1
        ELSE 0
    END AS repeated_phone_24H,
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM keepcoding.ivr_detail ivr_d3
            WHERE ivr_d3.calls_phone_number = ivr_d.calls_phone_number
            AND ivr_d3.calls_start_date BETWEEN ivr_d.calls_end_date 
            AND ivr_d.calls_end_date + INTERVAL 24 HOUR
        ) THEN 1
        ELSE 0
    END AS cause_recall_phone_24H
FROM 
    keepcoding.ivr_detail ivr_d;
