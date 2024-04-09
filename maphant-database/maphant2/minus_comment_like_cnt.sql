create definer = root@`%` trigger minus_comment_like_cnt
    after delete
    on comment_like
    for each row
BEGIN 
	UPDATE comment
	SET like_cnt = like_cnt - 1 WHERE id = OLD.comment_id AND like_cnt > 0;
END;

