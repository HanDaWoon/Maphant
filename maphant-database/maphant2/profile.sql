create table profile
(
    user_id     int                                                                                        not null,
    body        text                                                                                       null,
    profile_img varchar(255) default 'https://upload.wikimedia.org/wikipedia/commons/2/2c/Default_pfp.svg' null comment '프로필 이미지 s3 url'
);

alter table profile
    add constraint `PRIMARY`
        primary key (user_id);

alter table profile
    add constraint profile_ibfk_1
        foreign key (user_id) references user (id)
            on update cascade on delete cascade;

