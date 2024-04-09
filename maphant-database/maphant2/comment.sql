create table comment
(
    id           int auto_increment constraint `PRIMARY`
			primary key,
    user_id      int                                not null,
    parent_id    int                                null,
    board_id     int                                not null,
    body         text                               not null,
    is_anonymous tinyint                            not null,
    created_at   datetime default CURRENT_TIMESTAMP not null,
    like_cnt     int      default 0                 not null,
    report_cnt   int      default 0                 not null,
    state        tinyint  default 0                 not null comment '0 = 유지, 1 = 삭제, 차단(신고 누적) = 2, 유저 제재 시 블락 = 3',
    modified_at  datetime                           null
);

create index board_id
    on comment (board_id);

create index parent_id
    on comment (parent_id);

alter table comment
    add constraint comment_FK
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

alter table comment
    add constraint comment_ibfk_1
        foreign key (parent_id) references comment (id)
            on update cascade on delete cascade;

alter table comment
    add constraint comment_ibfk_2
        foreign key (board_id) references board (id)
            on update cascade on delete cascade;

