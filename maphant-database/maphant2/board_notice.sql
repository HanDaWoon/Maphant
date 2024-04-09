create table board_notice
(
    id          int auto_increment constraint `PRIMARY`
			primary key,
    board_type  int          not null,
    title       varchar(100) not null,
    body        text         not null,
    images_url  text         null,
    created_at  datetime     not null,
    modified_at datetime     null
);

alter table board_notice
    add constraint board_notice_FK
        foreign key (board_type) references board_type (id)
            on update cascade on delete cascade;

