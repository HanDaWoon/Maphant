create table log_upload
(
    id          int auto_increment constraint `PRIMARY`
			primary key,
    user_id     int          not null,
    file_size   int          not null,
    url         varchar(255) not null,
    upload_date datetime     not null
);

alter table log_upload
    add constraint log_upload_FK
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

