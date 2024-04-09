create table log_login
(
    id      int auto_increment constraint `PRIMARY`
			primary key,
    user_id int          null,
    ip      varchar(127) not null,
    time    datetime     not null
);

create index user_id
    on log_login (user_id);

alter table log_login
    add constraint log_login_ibfk_1
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

