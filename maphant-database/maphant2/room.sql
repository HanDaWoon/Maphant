create table room
(
    id                    int auto_increment constraint `PRIMARY`
			primary key,
    last_content          text              null,
    sender_id             int               null,
    receiver_id           int               null,
    time                  datetime          not null,
    sender_is_deleted     tinyint default 0 not null,
    receiver_is_deleted   tinyint default 0 not null,
    sender_unread_count   int     default 0 not null,
    receiver_unread_count int     default 0 not null,
    sender_dm_cursor      int     default 0 null,
    receiver_dm_cursor    int     default 0 null
);

create index receiver_id
    on room (receiver_id);

create index sender_id
    on room (sender_id);

alter table room
    add constraint sender_id_2
        unique (sender_id, receiver_id);

alter table room
    add constraint fk_room_receiver
        foreign key (receiver_id) references user (id);

alter table room
    add constraint fk_room_sender
        foreign key (sender_id) references user (id);

alter table room
    add constraint room_ibfk_1
        foreign key (sender_id) references user (id)
            on update cascade on delete cascade;

alter table room
    add constraint room_ibfk_2
        foreign key (receiver_id) references user (id)
            on update cascade on delete cascade;

