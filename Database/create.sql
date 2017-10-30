drop table if exists freelancingDB.assigned_tasks;
drop table if exists freelancingDB.has_tags;
drop table if exists freelancingDB.bid;
drop table if exists freelancingDB.tasks;
drop table if exists freelancingDB.user;
drop table if exists freelancingDB.has_skills;
drop table if exists freelancingDB.freelancer;
drop table if exists freelancingDB.tag;

drop schema freelancingDB;

CREATE SCHEMA freelancingDB
  AUTHORIZATION suyash;

GRANT ALL ON SCHEMA freelancingDB TO suyash;
COMMENT ON SCHEMA freelancingDB
  IS 'Schema for Freelancing Website';

create table freelancingDB.user(
	uid		varchar(10),
	password varchar(20),
	fName	varchar(30),
	mName	varchar(30),
	lName	varchar(30),
	email	varchar(50),
	primary key (uid)
);

create table freelancingDB.freelancer(
	fid			varchar(10),
	password 	varchar(20),
	fName		varchar(30),
	mName		varchar(30),
	lName		varchar(30),
	email		varchar(50),
	rating		numeric(3, 2),
	primary key (fid)
);

create table freelancingDB.tasks(
	taskid		varchar(10),
	uid			varchar(10),
	subject		varchar(50),
	text		varchar(500),
	post_ts		timestamp,
	comp_ts		timestamp,
	min_pay		varchar(10),
	max_pay		varchar(10),
	primary key (taskid),
	foreign key (uid) references freelancingDB.user (uid)
		on delete cascade
);

create table freelancingDB.assigned_tasks(
	taskid	varchar(10),
	fid		varchar(10),
	comp_ts timestamp,
	status	varchar(10),
	primary key (taskid),
	foreign key (taskid) references freelancingDB.tasks (taskid)
		on delete cascade,
	foreign key (fid) references freelancingDB.freelancer (fid)
		on delete cascade
);

create table freelancingDB.bid(
	taskid		varchar(10),
	fid			varchar(10),
	comp_ts		timestamp,
	amount		varchar(10),
	primary key (taskid, fid),
	foreign key (taskid) references freelancingDB.tasks (taskid)
		on delete cascade,
	foreign key (fid) references freelancingDB.freelancer (fid)
		on delete cascade
);

create table freelancingDB.tag(
	tagid		varchar(10),
	name		varchar(50),
	primary key (tagid)
);

create table freelancingDB.has_tags(
	taskid		varchar(10),
	tagid		varchar(10),
	primary key (taskid, tagid),
	foreign key (taskid) references freelancingDB.tasks (taskid)
		on delete cascade,
	foreign key (tagid) references freelancingDB.tag (tagid)
		on delete cascade
);

create table freelancingDB.has_skills(
	fid			varchar(10),
	tagid		varchar(10),
	primary key (fid, tagid),
	foreign key (fid) references freelancingDB.freelancer (fid)
		on delete cascade,
	foreign key (tagid) references freelancingDB.tag (tagid)
		on delete cascade
);