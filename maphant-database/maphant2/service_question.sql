create table service_question
(
    id           int auto_increment constraint `PRIMARY`
			primary key,
    user_id      int          not null,
    title        varchar(100) not null,
    content      text         null,
    created_at   datetime     not null,
    answer_email varchar(255) not null,
    images_url   text         null,
    status       char         null
);

alter table service_question
    add constraint service_question_FK
        foreign key (user_id) references user (id);

