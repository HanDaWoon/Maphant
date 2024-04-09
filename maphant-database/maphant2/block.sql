create table block
(
    blocker_id int       not null,
    blocked_id int       not null,
    created_at timestamp null
);

create index blocked_id
    on block (blocked_id);

alter table block
    add constraint `PRIMARY`
        primary key (blocker_id, blocked_id);

alter table block
    add constraint block_ibfk_1
        foreign key (blocker_id) references user (id);

alter table block
    add constraint block_ibfk_2
        foreign key (blocked_id) references user (id);

