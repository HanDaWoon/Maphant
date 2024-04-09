create table user_report
(
    id              int auto_increment constraint `PRIMARY`
			primary key,
    deadline_at     datetime     not null comment '제재 기한',
    sanction_reason varchar(100) not null comment '제재 사유',
    user_id         int          not null comment '제재 대상'
);

alter table user_report
    add constraint user_report_FK
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

