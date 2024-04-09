create table user_device
(
    id        int auto_increment constraint `PRIMARY`
			primary key,
    user_id   int          null,
    fcm_token varchar(256) null
);

create index user_id
    on user_device (user_id);

alter table user_device
    add constraint fcm_token
        unique (fcm_token);

alter table user_device
    add constraint user_device_ibfk_1
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

