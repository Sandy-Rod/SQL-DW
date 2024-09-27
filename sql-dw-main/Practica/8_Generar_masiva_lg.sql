SELECT ivr_d.calls_ivr_id
      , ivr_d.module_name
      , CASE 
         WHEN ivr_d.module_name = 'AVERIA_MASIVA'
         THEN 1
         ELSE 0 
       END AS masiva_lg
FROM keepcoding.ivr_detail ivr_d;




