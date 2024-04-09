create table category
(
    id       int         not null,
    name     varchar(63) not null,
    user_cnt int         not null
);

alter table category
    add constraint `PRIMARY`
        primary key (id);

alter table category
    add constraint category_UN
        unique (name);

