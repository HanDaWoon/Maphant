create definer = root@`%` trigger plus_category_cnt
    after insert
    on user_category_major
    for each row
BEGIN
	UPDATE category
	SET user_cnt = user_cnt + 1 WHERE id = NEW.category_id;
END;

