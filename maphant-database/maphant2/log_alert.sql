create table log_alert
(
    id         int auto_increment constraint `PRIMARY`
			primary key,
    user_id    int          null,
    icon       varchar(255) null,
    title      varchar(127) not null,
    body       text         not null,
    etc        json         null,
    created_at datetime     not null,
    is_read    datetime     null
);

create index user_id
    on log_alert (user_id);

alter table log_alert
    add constraint log_alert_ibfk_1
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

