create table log_user
(
    id          int auto_increment constraint `PRIMARY`
			primary key,
    email       varchar(255) not null,
    withdraw_at datetime     not null
);

