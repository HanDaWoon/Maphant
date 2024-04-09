create table board_cnt_by_category
(
    id            int auto_increment constraint `PRIMARY`
			primary key,
    category_id   int           not null,
    board_type_id int           not null,
    cnt           int default 0 not null
);

alter table board_cnt_by_category
    add constraint board_cnt_by_category_UN
        unique (category_id, board_type_id);

alter table board_cnt_by_category
    add constraint board_cnt_by_category_FK
        foreign key (category_id) references category (id)
            on update cascade on delete cascade;

alter table board_cnt_by_category
    add constraint board_cnt_by_category_FK_1
        foreign key (board_type_id) references board_type (id)
            on update cascade on delete cascade;

