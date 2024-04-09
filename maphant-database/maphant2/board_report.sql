create table board_report
(
    id          int auto_increment constraint `PRIMARY`
			primary key,
    board_id    int           not null,
    user_id     int           not null comment '신고자',
    report_id   int           not null,
    reported_at datetime      not null,
    state       int default 0 not null comment '0: 처리전, 1: 처리 완료'
);

create index user_id
    on board_report (user_id);

alter table board_report
    add constraint board_report_FK
        foreign key (report_id) references report (id);

alter table board_report
    add constraint board_report_FK_1
        foreign key (board_id) references board (id)
            on update cascade on delete cascade;

alter table board_report
    add constraint board_report_FK_2
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

