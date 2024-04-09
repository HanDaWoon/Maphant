create table search_word_inverse
(
    board_id       int    not null,
    search_word_id int    not null,
    tf             int    null,
    idf            double null
);

alter table search_word_inverse
    add constraint `PRIMARY`
        primary key (board_id, search_word_id);

alter table search_word_inverse
    add constraint search_word_inverse_ibfk_1
        foreign key (board_id) references board (id)
            on update cascade on delete cascade;

alter table search_word_inverse
    add constraint search_word_inverse_ibfk_2
        foreign key (search_word_id) references search_word (id)
            on update cascade on delete cascade;

