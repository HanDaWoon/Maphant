create
    definer = root@`%` procedure USER_PROCEDURE(IN IN_UNIV_ID int, IN IN_EMAIL varchar(255), IN IN_PASSWORD char(60),
                                                IN IN_NICKNAME varchar(15), IN IN_NAME varchar(31),
                                                IN IN_SNO varchar(31), IN IN_STATE int, IN IN_ROLE char(7),
                                                IN IN_AGREED_AT datetime, IN IN_CREATED_AT datetime,
                                                IN IN_LASTMODIFIED_AT datetime, IN IN_WITHDRAW_AT datetime,
                                                INOUT OUT_ERROR_CODE tinyint(1), INOUT OUT_ERROR_MESSAGE varchar(50))
BEGIN
    DECLARE is_already_registered INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET OUT_ERROR_CODE = TRUE;
        SET OUT_ERROR_MESSAGE = 'FAILED';
    END;

    SELECT COUNT(*) INTO is_already_registered
    FROM `user`
    WHERE (state IN (1, 2) OR DATEDIFF(NOW(), withdraw_at) < 30)
    AND email = IN_EMAIL;

    IF is_already_registered = 0 THEN
        INSERT INTO `user` (`univ_id`, `email`, `password`, `nickname`, `name`, `sno`, `state`, `role`, `agreed_at`, `created_at`, `lastmodified_at`, `withdraw_at`) VALUES (IN_UNIV_ID, IN_EMAIL, IN_PASSWORD, IN_NICKNAME, IN_NAME, IN_SNO, IN_STATE, IN_ROLE, NOW(), NOW(), NOW(), IN_WITHDRAW_AT);
        SET OUT_ERROR_CODE = FALSE;
        SET OUT_ERROR_MESSAGE = 'SUCCESS';
    ELSE
        SET OUT_ERROR_CODE = TRUE;
        SET OUT_ERROR_MESSAGE = 'USER ALREADY EXISTS';
    END IF;
END;

