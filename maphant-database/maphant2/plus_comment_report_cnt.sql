create definer = root@`%` trigger plus_comment_report_cnt
    after insert
    on comment_report
    for each row
BEGIN 
    DECLARE cnt INT;

    UPDATE comment
    SET report_cnt = report_cnt + 1
    WHERE id = NEW.comment_id;
   
    SELECT report_cnt INTO cnt FROM comment WHERE id = NEW.comment_id;

    IF cnt >= 10 THEN
        UPDATE comment
        SET state = 2
        WHERE id = NEW.comment_id;

    END IF;
END;

