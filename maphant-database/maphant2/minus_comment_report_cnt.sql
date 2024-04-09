create definer = root@`%` trigger minus_comment_report_cnt
    after delete
    on comment_report
    for each row
BEGIN 
	UPDATE comment
	SET report_cnt = report_cnt - 1 WHERE id = OLD.comment_id AND report_cnt > 0;
END;

