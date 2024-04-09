create table banner
(
    id         int auto_increment constraint `PRIMARY`
			primary key,
    title      varchar(100) null,
    company    varchar(100) not null,
    images_url text         null,
    url        text         null,
    pay        int          not null
);

