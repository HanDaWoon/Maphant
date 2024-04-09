create table user
(
    id              int auto_increment constraint `PRIMARY`
			primary key,
    univ_id         int          null,
    email           varchar(255) null,
    password        char(60)     not null,
    nickname        varchar(15)  null,
    name            varchar(31)  not null,
    sno             varchar(31)  not null,
    ph_num          char(13)     null,
    state           int          not null comment '0 = 미인증, 1 = 인증, 2 = 제재, 3 = 탈퇴',
    role            char(7)      not null,
    agreed_at       datetime     null,
    created_at      datetime     not null,
    lastmodified_at datetime     null,
    withdraw_at     datetime     null
);

create index univ_id
    on user (univ_id);

alter table user
    add constraint nickname
        unique (nickname);

alter table user
    add constraint user_FK
        foreign key (univ_id) references univ (id)
            on update cascade on delete cascade;

