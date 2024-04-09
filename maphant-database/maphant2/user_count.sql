create table user_count
(
    user_id                  int           not null,
    board_cnt                int default 0 not null,
    board_anonymous_hide_cnt int default 0 not null,
    comment_cnt              int default 0 not null,
    comment_anonymous_cnt    int default 0 not null
);

alter table user_count
    add constraint `PRIMARY`
        primary key (user_id);

alter table user_count
    add constraint user_count_FK
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

