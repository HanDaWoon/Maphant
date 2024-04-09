create definer = root@`%` trigger trg_at_update_type_qna
    before insert
    on board
    for each row
BEGIN
	
	IF NEW.parent_id IS NOT NULL THEN
	
		SET NEW.type_id = 7;
	
	END IF;
	
END;

