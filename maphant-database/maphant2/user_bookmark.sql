create table user_bookmark
(
    id       int auto_increment constraint `PRIMARY`
			primary key,
    user_id  int not null,
    board_id int not null
);

alter table user_bookmark
    add constraint user_bookmark_UN
        unique (user_id, board_id);

alter table user_bookmark
    add constraint user_bookmark_FK
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

alter table user_bookmark
    add constraint user_bookmark_FK_1
        foreign key (board_id) references board (id)
            on update cascade on delete cascade;

