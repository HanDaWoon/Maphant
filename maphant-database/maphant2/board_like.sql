create table board_like
(
    id       int auto_increment constraint `PRIMARY`
			primary key,
    board_id int not null,
    user_id  int not null
);

create index board_like_board_id_IDX
    on board_like (board_id);

create index user_id
    on board_like (user_id);

alter table board_like
    add constraint board_like_UN
        unique (board_id, user_id);

alter table board_like
    add constraint board_like_ibfk_1
        foreign key (board_id) references board (id)
            on update cascade on delete cascade;

alter table board_like
    add constraint board_like_ibfk_2
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

