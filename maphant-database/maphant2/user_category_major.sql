create table user_category_major
(
    user_id     int not null,
    category_id int not null,
    major_id    int not null
);

create index user_id
    on user_category_major (user_id);

alter table user_category_major
    add constraint `PRIMARY`
        primary key (user_id, category_id, major_id);

alter table user_category_major
    add constraint FK_user_category_major_category
        foreign key (category_id) references category (id)
            on update cascade on delete cascade;

alter table user_category_major
    add constraint FK_user_category_major_major
        foreign key (major_id) references major (id)
            on update cascade on delete cascade;

alter table user_category_major
    add constraint user_category_major_ibfk_1
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

