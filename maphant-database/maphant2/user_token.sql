create table user_token
(
    id         int auto_increment constraint `PRIMARY`
			primary key,
    user_id    int      not null,
    public_key char(48) not null
);

alter table user_token
    add constraint user_token_UN
        unique (public_key);

alter table user_token
    add constraint user_token_FK
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

