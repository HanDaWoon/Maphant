create definer = root@`%` trigger trg_at_insert_board
    after insert
    on board
    for each row
BEGIN
	DECLARE rowcount INT;

	SELECT COUNT(*) INTO rowcount FROM user_count WHERE user_id =NEW.user_id ;

	IF (NEW.state = 0) THEN
		IF (rowcount > 0) THEN 
			CASE 
				
				WHEN (NEW.is_hide = 1) THEN 
					
					UPDATE user_count 
					SET board_cnt = board_cnt + 1, board_anonymous_hide_cnt = board_anonymous_hide_cnt + 1 WHERE user_id = NEW.user_id;
				
				WHEN (NEW.is_anonymous = 1) THEN
					
					UPDATE user_count 
					SET board_cnt = board_cnt + 1, board_anonymous_hide_cnt = board_anonymous_hide_cnt + 1 WHERE user_id = NEW.user_id;
					
					UPDATE board_cnt_by_category
					SET cnt = cnt + 1 WHERE category_id = NEW.category_id AND board_type_id = NEW.type_id;
				
					UPDATE board_type 
					SET post_cnt = post_cnt + 1 WHERE id = NEW.type_id;
				
				ELSE
					
					UPDATE user_count 
					SET board_cnt = board_cnt + 1 WHERE user_id = NEW.user_id;
					
					UPDATE board_cnt_by_category 
					SET cnt = cnt + 1 WHERE category_id = NEW.category_id AND board_type_id = NEW.type_id;
				
					UPDATE board_type 
					SET post_cnt = post_cnt + 1 WHERE id = NEW.type_id;
				
				END CASE;
				
		ELSE
		
			CASE
				
				WHEN (NEW.is_hide = 1) THEN
				
					INSERT INTO user_count (user_id, board_cnt, board_anonymous_hide_cnt) 
						VALUES (NEW.user_id, 1, 1);
				
				WHEN (NEW.is_anonymous = 1) THEN
				
					INSERT INTO user_count (user_id, board_cnt, board_anonymous_hide_cnt) 
						VALUES (NEW.user_id, 1, 1);
				
					UPDATE board_cnt_by_category
					SET cnt = cnt + 1 WHERE category_id = NEW.category_id AND board_type_id = NEW.type_id;
				
					UPDATE board_type 
					SET post_cnt = post_cnt + 1 WHERE id = NEW.type_id;
				
				ELSE
					
					INSERT INTO user_count (user_id, board_cnt) 
						VALUES (NEW.user_id, 1);
					
					UPDATE board_cnt_by_category 
					SET cnt = cnt + 1 WHERE category_id = NEW.category_id AND board_type_id = NEW.type_id;
				
					UPDATE board_type 
					SET post_cnt = post_cnt + 1 WHERE id = NEW.type_id;
			
				END CASE;
			
			END IF;
	
		END IF;
		
	END;

