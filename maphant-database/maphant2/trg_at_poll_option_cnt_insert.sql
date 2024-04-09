create definer = root@`%` trigger trg_at_poll_option_cnt_insert
    after insert
    on poll_user
    for each row
BEGIN
		
		UPDATE poll_option
		SET option_cnt = option_cnt + 1 WHERE id = NEW.poll_option AND poll_id = NEW.poll_id;
		
END;

