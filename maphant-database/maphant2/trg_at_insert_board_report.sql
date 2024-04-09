create definer = root@`%` trigger trg_at_insert_board_report
    after insert
    on board_report
    for each row
BEGIN 
    DECLARE cnt INT;

    UPDATE board
    SET report_cnt = report_cnt + 1
    WHERE id = NEW.board_id;
   
       SELECT report_cnt INTO cnt FROM board WHERE id = NEW.board_id;

    IF cnt >= 10 THEN
        UPDATE board
        SET state = 2
        WHERE id = NEW.board_id;
    END IF;
END;

