create definer = root@`%` trigger plus_comment_like_cnt
    after insert
    on comment_like
    for each row
BEGIN 
	UPDATE comment
	SET like_cnt = like_cnt + 1 WHERE id = NEW.comment_id;
END;

