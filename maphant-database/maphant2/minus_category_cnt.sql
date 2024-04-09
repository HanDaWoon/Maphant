create definer = root@`%` trigger minus_category_cnt
    after delete
    on user_category_major
    for each row
BEGIN 
	UPDATE category
	SET user_cnt = user_cnt - 1 WHERE id = OLD.category_id;
END;

