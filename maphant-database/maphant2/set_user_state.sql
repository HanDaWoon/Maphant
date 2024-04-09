create
    definer = maphant@`%` procedure set_user_state()
BEGIN
	update board 
	set state = 0
	where user_id in (select a.id
						from (select id from user where state=2) as a
						    left join
						    (select sanctioned_user_ids.id
						     from (select id from user where state=2) as sanctioned_user_ids
						              join user_report on sanctioned_user_ids.id = user_report.id
						     where user_report.deadline_at > now()) as b
						on a.id = b.id)
    and report_cnt = 0;
   
	update user
	set state = 1
	where id in (select a.id
				from (select id from user where state=2) as a
				    left join
				    (select sanctioned_user_ids.id
				     from (select id from user where state=2) as sanctioned_user_ids
				              join user_report on sanctioned_user_ids.id = user_report.id
				     where user_report.deadline_at > now()) as b
				on a.id = b.id);
END;

