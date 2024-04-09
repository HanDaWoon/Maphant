create table major
(
    id   int          not null,
    name varchar(127) not null
);

alter table major
    add constraint `PRIMARY`
        primary key (id);

alter table major
    add constraint major_UN
        unique (name);

