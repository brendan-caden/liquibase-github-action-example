--liquibase formatted sql

--changeset your.name:1
--rollback DROP TABLE person;
create table person (
    id int primary key,
    name varchar(50) not null,
    address1 varchar(50),
    address2 varchar(50),
    city varchar(30)
)

--changeset your.name:2
--rollback DROP TABLE company;
create table company (
    id int primary key,
    name varchar(50) not null,
    address1 varchar(50),
    address2 varchar(50),
    city varchar(30)
)

--changeset other.dev:3
--rollback ALTER TABLE person DROP COLUMN country;
alter table person add column country varchar(2)

--changeset other.dev:4
--rollback ALTER TABLE person DROP COLUMN state;
alter table person add column state varchar(2)

--changeset other.dev:5
--rollback ALTER TABLE company DROP COLUMN country;
alter table company add column country varchar(2)

--changeset other.dev:6
--delete from company where id = 1;
insert into company (id, name, address1, address2, city) values (1,'Brendan Widdgets', 'Perry Lodge', 'Longnor', 'Shrewsbury');

--changeset brendan:1
--rollback DROP TABLE widgets;
CREATE TABLE widgets (
    id int primary key,
    name varchar(50) not null
)

--changeset brendan:2
--delete from widgets where id = 1;
insert into widgets values (1, 'Best Widget');
