create definer = root@`%` trigger trg_at_poll_option_cnt_update
    after update
    on poll_user
    for each row
BEGIN
		
	IF OLD.user_id = NEW.user_id AND OLD.poll_id = NEW.poll_id THEN 
		
		UPDATE poll_option 
		SET option_cnt = option_cnt - 1 WHERE id = OLD.poll_option;
	
		UPDATE poll_option 
		SET option_cnt = option_cnt + 1 WHERE id = NEW.poll_option;
	
	END IF;
		
END;

