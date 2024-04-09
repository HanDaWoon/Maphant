create table poll_user
(
    user_id     int      not null,
    poll_id     int      not null,
    poll_option int      null,
    created_at  datetime not null
);

alter table poll_user
    add constraint `PRIMARY`
        primary key (user_id, poll_id);

alter table poll_user
    add constraint poll_user_ibfk_1
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

alter table poll_user
    add constraint poll_user_ibfk_2
        foreign key (poll_id) references poll (id)
            on update cascade on delete cascade;

alter table poll_user
    add constraint poll_user_ibfk_3
        foreign key (poll_option) references poll_option (id)
            on update cascade on delete cascade;

