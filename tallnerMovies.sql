/* Ändringar
- Tog bort mellersta kolumnen. Den tillförde inget, utan jag har id i respektive tabell istället.
- Launch var konstig att göra en egen tabell till, den borde vara knuten till filmen kanske?
- Problem att hålla rätt på alla id --> id-tabell?
*/
drop database if exists movies;
create database if not exists movies;
use movies;

drop table if exists actor;
create table if not exists actor(
	actor_id int auto_increment,
    actor_name varchar(50) not null,
    age varchar(50) not null,
    skill varchar(50),
    primary key (actor_id)
);

drop table if exists director;
create table if not exists director(
	director_id int auto_increment,
    director_name varchar(50) not null,
    city varchar(50),
    primary key (director_id)
);

drop table if exists genre;
create table if not exists genre(
	genre_id int auto_increment,
    genre_name varchar(50) not null,
    primary key (genre_id)
);

drop table if exists launch;
create table if not exists launch(
	launch_id int auto_increment,
    launch_date date not null,
    country varchar(50) not null,
    primary key (launch_id)
);

drop table if exists movies;
create table if not exists movies(
	movie_id int auto_increment,
    movie_title varchar(50) not null,
    actor_id int,
    director_id int not null,
    genre_id int not null,
    launch_id int not null,
    primary key (movie_id),
    foreign key (actor_id) references actor (actor_id),
    foreign key (director_id) references director (director_id),
    foreign key (launch_id) references launch (launch_id),
    foreign key (genre_id) references genre (genre_id)
);

insert into actor (actor_name, age, skill) values ('Hedvig', '78', 'dancing');
insert into actor (actor_name, age, skill) values ('Johan', '43', 'singing');
insert into actor (actor_name, age) values ('Kim', '25');

insert into director (director_name, city) values ('JohnC', 'LA');
insert into director (director_name) values ('Sylvester');
insert into director (director_name, city) values ('Mike','NY');
insert into director (director_name) values ('Samantha');

insert into genre (genre_name) values ('comedy');
insert into genre (genre_name) values ('horror');
insert into genre (genre_name) values ('action');
insert into genre (genre_name) values ('drama');
insert into genre (genre_name) values ('splatter');

insert into launch (launch_date, country) values ('2022-08-15','sweden');
insert into launch (launch_date, country) values ('2021-08-15','usa');
insert into launch (launch_date, country) values ('2023-02-11','sweden');
insert into launch (launch_date, country) values ('2022-12-24','usa');

insert into movies 	(movie_title,	actor_id, 	director_id, 	genre_id, 	launch_id)
values 				('Film1', 		1, 			1, 				1, 			1);
insert into movies 	(movie_title,	actor_id, 	director_id, 	genre_id, 	launch_id)
values 				('Film2', 		2, 			2, 				2, 			2);
insert into movies 	(movie_title,	actor_id, 	director_id, 	genre_id, 	launch_id)
values 				('Film3', 		3, 			3, 				3, 			3);
insert into movies 	(movie_title,	actor_id, 	director_id, 	genre_id, 	launch_id)
values 				('Film4', 		1, 			4, 				4, 			4);
insert into movies 	(movie_title,	actor_id, 	director_id, 	genre_id, 	launch_id)
values 				('Film5', 		2, 			1, 				5, 			1);

/**/
-- Select * from movies
Select movies.movie_title, director.director_name, director.city,actor.actor_name,actor.age,actor.skill,genre.genre_name,launch.launch_date,launch.country
from movies
cross join director on director.director_id=movies.director_id
cross join actor on actor.actor_id=movies.actor_id
cross join genre on genre.genre_id=movies.genre_id
cross join launch on launch.launch_id=movies.launch_id
where actor.actor_name = 'Johan';
-- where director.director_name = 'JohnC';

/**/