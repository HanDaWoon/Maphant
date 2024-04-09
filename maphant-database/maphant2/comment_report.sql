create table comment_report
(
    comment_id  int           not null,
    user_id     int           not null,
    report_id   int           not null,
    id          int auto_increment constraint `PRIMARY`
			primary key,
    reported_at datetime      not null,
    state       int default 0 not null comment '0: 처리전, 1: 처리 완료'
);

create index user_id
    on comment_report (user_id);

alter table comment_report
    add constraint comment_report_FK
        foreign key (report_id) references report (id);

alter table comment_report
    add constraint comment_report_FK_1
        foreign key (comment_id) references comment (id)
            on update cascade on delete cascade;

alter table comment_report
    add constraint comment_report_FK_2
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

