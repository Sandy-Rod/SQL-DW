SELECT ivr_d.calls_ivr_id
      , IF(ivr_s.document_type = 'UNKNOWN', NULL, ivr_s.document_type) AS document_type
      , IF(ivr_s.document_identification = 'UNKNOWN', NULL, ivr_s.document_identification) AS document_identification
  FROM 
      keepcoding.ivr_detail ivr_d
  JOIN 
      keepcoding.ivr_steps ivr_s
    ON 
      ivr_d.calls_ivr_id = ivr_s.ivr_id AND ivr_s.module_sequece = ivr_s.module_sequece       
  WHERE 
    ivr_s.document_identification != 'UNKNOWN'  AND ivr_s.customer_phone != 'UNKNOWN' AND ivr_d.customer_phone != 'UNKNOWN'
  ORDER BY 
    document_identification;