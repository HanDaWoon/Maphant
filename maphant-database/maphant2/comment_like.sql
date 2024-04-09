create table comment_like
(
    comment_id int not null,
    user_id    int not null
);

create index comment_like_comment_id_IDX
    on comment_like (comment_id);

create index user_id
    on comment_like (user_id);

alter table comment_like
    add constraint `PRIMARY`
        primary key (comment_id, user_id);

alter table comment_like
    add constraint comment_like_ibfk_1
        foreign key (comment_id) references comment (id)
            on update cascade on delete cascade;

alter table comment_like
    add constraint comment_like_ibfk_2
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

