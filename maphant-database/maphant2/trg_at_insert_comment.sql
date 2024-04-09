create definer = root@`%` trigger trg_at_insert_comment
    after insert
    on comment
    for each row
BEGIN
	DECLARE rowcount INT;
	
	SELECT count(*) into rowcount FROM user_count WHERE user_id = NEW.user_id;
	
	IF (NEW.state = 0) THEN
		IF (rowcount > 0) THEN
			IF (NEW.is_anonymous = 1) THEN
				UPDATE user_count
				SET comment_cnt = comment_cnt + 1, comment_anonymous_cnt = comment_anonymous_cnt + 1 WHERE user_id = NEW.user_id;
			ELSE
				UPDATE user_count
				SET comment_cnt = comment_cnt + 1 WHERE user_id = NEW.user_id;
			END IF;
		ELSE
			IF (NEW.is_anonymous = 1) THEN
				INSERT INTO user_count(user_id, comment_cnt, comment_anonymous_cnt) VALUES (NEW.user_id, 1, 1);
			ELSE
				INSERT INTO user_count(user_id, comment_cnt) VALUES (NEW.user_id, 1);
			END IF;
		END IF;
		UPDATE board
		SET comment_cnt = comment_cnt + 1 WHERE id = NEW.board_id;
	END IF;
END;

