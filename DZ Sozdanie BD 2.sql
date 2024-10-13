create table if not exists ZHANR (
	id serial primary key,
	name varchar (60) not null
);

create table if not exists EXECUTOR (
	id serial primary key,
	name varchar(40) not null
);

create table if not exists ALBOM (
	id serial primary key,
	name varchar(40) not null,
	data_release data not null
);

create table if not exists TREK (
	id serial primary key,
	name varchar(40) not null,
	timing_trek decimal(3, 2),
	ALBOM_ID  integer not null REFERENCES ALBOM(ID)
);

create table if not exists ZHANR_EXECUTOR (
	zhanr_id integer references ZHANR(id),
	executor_id integer references EXECUTOR(id),
	constraint pk primary key (zhanr_id, exrcutor_id)
);

create table if not exists ALBOM_EXECUTOR (
	albom_id integer references ALBOM(id),
	executor_id integer references EXECUTOR(id),
	constraint pk primary key (albom_id, exrcutor_id)
);

create table if not exists ALBOM_TREK (
	albom_id integer references ALBOM(id),
	trek_id integer references TREK(id),
	constraint pk primary key (albom_id, trek_id)
);

create table if not exists COLLECTION (
	id serial primary key,
	ALBOM_TREK_id integer not null references ALBOM_TREK(id),
	data_collection data not null,
	description text not null
);
	
	
	
	