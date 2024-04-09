create table tag
(
    id          int auto_increment constraint `PRIMARY`
			primary key,
    name        varchar(15)   not null,
    category_id int           not null,
    cnt         int default 0 not null
);

alter table tag
    add constraint tag_UN
        unique (category_id, name);

alter table tag
    add constraint tag_FK
        foreign key (category_id) references category (id)
            on update cascade on delete cascade;

