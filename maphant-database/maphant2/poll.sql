create table poll
(
    id          int auto_increment constraint `PRIMARY`
			primary key,
    board_id    int         null,
    title       varchar(63) null,
    expire_date datetime    null,
    state       int         not null
);

alter table poll
    add constraint poll_FK
        foreign key (board_id) references board (id);

