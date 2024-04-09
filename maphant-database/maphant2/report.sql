create table report
(
    id   int auto_increment constraint `PRIMARY`
			primary key,
    name varchar(100) not null comment '신고 항목 이름'
)
    comment '신고 항목';

