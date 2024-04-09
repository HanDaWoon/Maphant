create table board_tag
(
    id       int auto_increment constraint `PRIMARY`
			primary key,
    board_id int not null,
    tag_id   int not null
);

alter table board_tag
    add constraint board_tag_FK
        foreign key (board_id) references board (id)
            on update cascade on delete cascade;

alter table board_tag
    add constraint board_tag_FK_1
        foreign key (tag_id) references tag (id)
            on update cascade on delete cascade;

