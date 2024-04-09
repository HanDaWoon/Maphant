create table poll_option
(
    id          int auto_increment constraint `PRIMARY`
			primary key,
    poll_id     int         null,
    option_name varchar(31) not null,
    option_cnt  int         not null
);

alter table poll_option
    add constraint poll_option_FK
        foreign key (poll_id) references poll (id)
            on update cascade on delete cascade;

