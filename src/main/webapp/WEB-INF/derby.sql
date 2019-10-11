create table auth_role(
    id int generated always as identity,
    role_name varchar(200) not null,
    primary key(id)
);

insert into auth_role(role_name) values
('ADMIN'), ('USER');

select * from auth_role;
