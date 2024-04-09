create definer = maphant@`%` trigger user_AFTER_INSERT
    after insert
    on user
    for each row
BEGIN
		INSERT INTO profile (user_id)
		VALUES (NEW.id);
END;

