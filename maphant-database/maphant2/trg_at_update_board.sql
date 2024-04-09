create definer = root@`%` trigger trg_at_update_board
    after update
    on board
    for each row
BEGIN
	
	IF(NEW.state != 0) THEN
	
		CASE
			
			WHEN (OLD.state = 0 AND OLD.is_hide = 1 AND NEW.is_hide = 1) THEN
				
				UPDATE user_count 
				SET board_anonymous_hide_cnt = board_anonymous_hide_cnt WHERE user_id = NEW.user_id;
			
			WHEN (OLD.state = 0 AND OLD.is_anonymous = 1 AND NEW.is_anonymous = 1) THEN
					
				UPDATE user_count 
				SET board_cnt = board_cnt - 1 WHERE user_id = NEW.user_id;
			
				UPDATE board_cnt_by_category
				SET cnt = cnt - 1 WHERE category_id = NEW.category_id AND board_type_id = NEW.type_id;
			
				UPDATE board_type 
				SET post_cnt = post_cnt - 1 WHERE id = NEW.type_id;
			
			WHEN (OLD.state = 0) THEN
					
				UPDATE user_count 
				SET board_cnt = board_cnt - 1 WHERE user_id = NEW.user_id;
			
				UPDATE board_cnt_by_category
				SET cnt = cnt - 1 WHERE category_id = NEW.category_id AND board_type_id = NEW.type_id;
			
				UPDATE board_type 
				SET post_cnt = post_cnt - 1 WHERE id = NEW.type_id;
			
			WHEN (OLD.state != 0 AND OLD.is_hide = 0 AND NEW.is_hide = 1) THEN
				
				IF (OLD.is_anonymous = 0) THEN
					
					UPDATE user_count 
					SET board_anonymous_hide_cnt = board_anonymous_hide_cnt + 1 WHERE user_id = NEW.user_id;
				
				END IF;
			
			WHEN (OLD.state != 0 AND OLD.is_hide = 1 AND NEW.is_hide = 0) THEN
			
				IF (OLD.is_anonymous = 0) THEN
				
					UPDATE user_count 
					SET board_anonymous_hide_cnt = board_anonymous_hide_cnt - 1 WHERE user_id = NEW.user_id;
				
				END IF;
			
			WHEN (OLD.state != 0 AND OLD.is_anonymous = 0 AND NEW.is_anonymous = 1) THEN
			
				IF (OLD.is_hide = 0) THEN
				
					UPDATE user_count 
					SET board_anonymous_hide_cnt = board_anonymous_hide_cnt + 1 WHERE user_id = NEW.user_id;
				
				END IF;
			
			WHEN (OLD.state != 0 AND OLD.is_anonymous = 1 AND NEW.is_anonymous = 0) THEN
				
				IF (OLD.is_hide = 0) THEN
					
					UPDATE user_count 
					SET board_anonymous_hide_cnt = board_anonymous_hide_cnt - 1 WHERE user_id = NEW.user_id;
				
				END IF;
			
			ELSE
			
				UPDATE user_count 
				SET board_cnt = board_cnt WHERE user_id = NEW.user_id;
				
		END CASE;
	
	ELSEIF (NEW.state = 0) THEN
	
		CASE
			
			WHEN (OLD.state != 0 AND OLD.is_hide = 1 AND NEW.is_hide = 1) THEN 
			
					UPDATE user_count 
					SET board_cnt = board_cnt WHERE user_id = NEW.user_id;
			
			WHEN (OLD.is_hide = 0 AND NEW.is_hide = 1) THEN 
					
				IF (NEW.is_anonymous = 1) THEN
				
					UPDATE user_count 
					SET board_cnt = board_cnt - 1 WHERE user_id = NEW.user_id;
			
					UPDATE board_cnt_by_category
					SET cnt = cnt - 1 WHERE category_id = NEW.category_id AND board_type_id = NEW.type_id;
			
					UPDATE board_type 
					SET post_cnt = post_cnt - 1 WHERE id = NEW.type_id;
				
				ELSE 
				
					UPDATE user_count 
					SET board_cnt = board_cnt - 1, board_anonymous_hide_cnt = board_anonymous_hide_cnt + 1 WHERE user_id = NEW.user_id;
			
					UPDATE board_cnt_by_category
					SET cnt = cnt - 1 WHERE category_id = NEW.category_id AND board_type_id = NEW.type_id;
			
					UPDATE board_type 
					SET post_cnt = post_cnt - 1 WHERE id = NEW.type_id;
				
				END IF;
			
			WHEN (OLD.is_hide = 1 AND NEW.is_hide = 0) THEN 
					
				IF (NEW.is_anonymous = 0) THEN
				
					UPDATE user_count 
					SET board_cnt = board_cnt + 1, board_anonymous_hide_cnt = board_anonymous_hide_cnt - 1 WHERE user_id = NEW.user_id;
				
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
				
				END IF;
			
			WHEN (OLD.is_anonymous = 0 AND NEW.is_anonymous = 1) THEN
					
				IF (NEW.is_hide = 1) THEN
				
					UPDATE user_count 
					SET board_cnt = board_cnt WHERE user_id = NEW.user_id;
				
				ELSE
				
					UPDATE user_count 
					SET board_anonymous_hide_cnt = board_anonymous_hide_cnt + 1 WHERE user_id = NEW.user_id;
				
				END IF;
				
			WHEN (OLD.is_anonymous = 1 AND NEW.is_anonymous = 0) THEN
					
				IF (NEW.is_hide = 0) THEN
				
					UPDATE user_count 
					SET board_anonymous_hide_cnt = board_anonymous_hide_cnt - 1 WHERE user_id = NEW.user_id;
				
				ELSE
				
					UPDATE user_count 
					SET board_cnt = board_cnt WHERE user_id = NEW.user_id;
				
				END IF;
			
			WHEN (OLD.state != 0) THEN 
			
				UPDATE user_count 
				SET board_cnt = board_cnt + 1 WHERE user_id = NEW.user_id;
					
				UPDATE board_cnt_by_category 
				SET cnt = cnt + 1 WHERE category_id = NEW.category_id AND board_type_id = NEW.type_id;
				
				UPDATE board_type 
				SET post_cnt = post_cnt + 1 WHERE id = NEW.type_id;
			
			ELSE
			
				UPDATE user_count 
				SET board_cnt = board_cnt WHERE user_id = NEW.user_id;
				
		END CASE;

	END IF;
	
END;

