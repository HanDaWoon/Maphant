create
    definer = root@`%` function hot(ups int, date_created datetime) returns float
BEGIN
    DECLARE s INT;
    DECLARE order_val FLOAT;
    DECLARE sign_val INT;
    DECLARE seconds FLOAT;
    DECLARE random_val FLOAT; 

    IF ups > 1 THEN
        SET order_val = LOG(ups, 10);
    ELSE
        SET order_val = 0;
    END IF;

    SET sign_val = CASE WHEN ups > 0 THEN 1 ELSE 0 END;
    SET seconds = UNIX_TIMESTAMP(date_created) - 1134028003;

    RETURN ROUND(sign_val * order_val + seconds / 45000, 7);
END;

