SELECT ivr_d.calls_ivr_id
      ,ivr_d.customer_phone AS customer_phone
    FROM 
        keepcoding.ivr_detail ivr_d
    QUALIFY ROW_NUMBER() OVER(PARTITION BY customer_phone ORDER BY customer_phone DESC)=1 AND ivr_d.customer_phone != 'UNKNOWN';


