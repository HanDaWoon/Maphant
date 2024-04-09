create table board_type
(
    id       int auto_increment constraint `PRIMARY`
			primary key,
    name     varchar(31)   not null,
    post_cnt int default 0 not null
);

