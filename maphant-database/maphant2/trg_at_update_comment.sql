create definer = root@`%` trigger trg_at_update_comment
    after update
    on comment
    for each row
BEGIN 	
	IF (NEW.state != 0) THEN
		IF (OLD.is_anonymous = 0) THEN
			UPDATE user_count
			SET comment_cnt = comment_cnt - 1 WHERE user_id = NEW.user_id;
		ELSE
			UPDATE user_count
			SET comment_cnt = comment_cnt - 1, comment_anonymous_cnt = comment_anonymous_cnt - 1 WHERE user_id = NEW.user_id;
		END IF;
	
		UPDATE board
		SET comment_cnt = comment_cnt - 1 WHERE id = NEW.board_id;
	END IF;
END;

