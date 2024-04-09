create definer = root@`%` trigger minus_board_like_cnt
    after delete
    on board_like
    for each row
BEGIN
	UPDATE board
	SET like_cnt = like_cnt - 1 WHERE id = OLD.board_id AND like_cnt > 0;
END;

