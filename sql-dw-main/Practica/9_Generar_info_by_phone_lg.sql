SELECT ivr_d.calls_ivr_id
      , ivr_d.step_name
      , ivr_d.step_result
      , CASE
          WHEN ivr_d.step_name = 'CUSTOMERINFOBYPHONE.TX' 
               AND ivr_d.step_result = 'OK'
          THEN 1
          ELSE 0
        END AS info_by_phone_lg
     FROM 
          keepcoding.ivr_detail ivr_d;
