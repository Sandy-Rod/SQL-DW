CREATE OR REPLACE FUNCTION keepcoding.clean_integer(p_integer INT64) RETURNS INT64 AS 
((SELECT CASE WHEN p_integer IS NULL THEN -999999 ELSE p_integer 
    END)
);