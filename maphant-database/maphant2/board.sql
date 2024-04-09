create table board
(
    id           int auto_increment constraint `PRIMARY`
			primary key,
    parent_id    int               null comment 'Q&A 답변글에서 질문글 가리킴',
    category_id  int               not null comment '속한 계열',
    user_id      int               not null comment '작성자',
    type_id      int               not null comment '게시판 종류',
    title        varchar(127)      not null,
    body         text              not null,
    state        int               not null comment '0 = 유지, 1 = 삭제, 차단(신고 누적) = 2, 유저 제재 시 블락 = 3',
    is_hide      tinyint default 0 not null comment '다른 유저에게 숨김(1), 보임(0)',
    is_complete  tinyint default 0 not null comment 'Q&A 답글에서 채택 여부(1: 채택, 0: 아직 안함)',
    is_anonymous tinyint default 0 not null comment '익명 여부 (1: 익명, 0: 공개)',
    created_at   datetime          not null,
    modified_at  datetime          null,
    comment_cnt  int               not null,
    like_cnt     int               not null,
    report_cnt   int               not null,
    images_url   text              null
);

create index category_id
    on board (category_id);

create index parent_id
    on board (parent_id);

create index type_id
    on board (type_id);

create index user_id
    on board (user_id);

alter table board
    add constraint board_ibfk_1
        foreign key (parent_id) references board (id)
            on update cascade on delete cascade;

alter table board
    add constraint board_ibfk_2
        foreign key (category_id) references category (id)
            on update cascade on delete cascade;

alter table board
    add constraint board_ibfk_3
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

alter table board
    add constraint board_ibfk_4
        foreign key (type_id) references board_type (id)
            on update cascade on delete cascade;

