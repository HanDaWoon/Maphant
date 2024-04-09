create table config
(
    user_id int  not null,
    config  json null
);

alter table config
    add constraint `PRIMARY`
        primary key (user_id);

alter table config
    add constraint config_ibfk_1
        foreign key (user_id) references user (id);

