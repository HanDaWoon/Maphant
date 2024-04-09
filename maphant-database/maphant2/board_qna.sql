create table board_qna
(
    id          int auto_increment constraint `PRIMARY`
			primary key,
    question_id int      not null comment 'board의 질문 글 id',
    answer_id   int      not null comment 'board의 채택 글 id',
    complete_at datetime not null comment '채택 시간'
);

alter table board_qna
    add constraint board_qna_UN
        unique (question_id);

alter table board_qna
    add constraint board_qna_FK
        foreign key (question_id) references board (id)
            on update cascade on delete cascade;

alter table board_qna
    add constraint board_qna_FK_1
        foreign key (answer_id) references board (id)
            on update cascade on delete cascade;

