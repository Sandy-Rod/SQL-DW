SELECT ivr_d.calls_ivr_id
      , ivr_d.billing_account_id AS billing_account_id
    FROM 
        keepcoding.ivr_detail ivr_d
    QUALIFY ROW_NUMBER() OVER(PARTITION BY billing_account_id ORDER BY billing_account_id DESC)=1 
        AND ivr_d.billing_account_id != 'UNKNOWN';

