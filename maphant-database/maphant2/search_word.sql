create table search_word
(
    id   int auto_increment constraint `PRIMARY`
			primary key,
    word char(2) null,
    df   int     null
);

alter table search_word
    add constraint word
        unique (word);

alter table search_word
    add constraint word_2
        unique (word);

