create table dm
(
    id             int auto_increment constraint `PRIMARY`
			primary key,
    is_from_sender bit                                                                    null,
    content        text                                                                   not null,
    time           datetime                                                               not null,
    is_read        tinyint                                                 default 0      not null,
    room_id        int                                                                    null,
    visible        enum ('NOBODY', 'ONLY_SENDER', 'ONLY_RECEIVER', 'BOTH') default 'BOTH' not null
);

alter table dm
    add constraint fk_room_dm
        foreign key (room_id) references room (id);

