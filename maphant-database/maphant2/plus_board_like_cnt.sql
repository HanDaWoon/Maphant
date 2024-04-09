create definer = root@`%` trigger plus_board_like_cnt
    after insert
    on board_like
    for each row
BEGIN
	UPDATE board
	SET like_cnt = like_cnt + 1 WHERE id = NEW.board_id;
END;

