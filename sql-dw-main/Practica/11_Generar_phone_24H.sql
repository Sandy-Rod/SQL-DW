SELECT ivr_d.calls_ivr_id
      , ivr_d.calls_phone_number
      , ivr_d.calls_start_date
      , ivr_d.calls_end_date
      , CASE
          WHEN 
            EXISTS (
              SELECT 1
              FROM 
                  keepcoding.ivr_detail ivr_d2
              WHERE 
                  ivr_d2.calls_phone_number = ivr_d.calls_phone_number
                  AND ivr_d2.calls_end_date BETWEEN ivr_d.calls_start_date - INTERVAL 24 HOUR
                  AND ivr_d.calls_start_date
              GROUP BY 
                  ivr_d2.calls_phone_number
            ) 
            THEN 1
            ELSE 0
        END AS repeated_phone_24H
      , CASE
          WHEN 
            EXISTS (
              SELECT 1
              FROM 
                  keepcoding.ivr_detail ivr_d3
              WHERE 
                  ivr_d3.calls_phone_number = ivr_d.calls_phone_number
                  AND ivr_d3.calls_start_date BETWEEN ivr_d.calls_end_date 
                  AND ivr_d.calls_end_date + INTERVAL 24 HOUR
              GROUP BY 
                  ivr_d3.calls_phone_number
          ) THEN 1
          ELSE 0
        END AS cause_recall_phone_24H
  FROM 
      keepcoding.ivr_detail ivr_d;