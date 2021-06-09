use world;

create table date_table (
	id int primary key auto_increment,
	dt datetime default current_timestamp
);

desc date_table;

insert into date_table(dt) values
	('2021-01-31 12:34:34'), ('2042-11-21 16:32:54'),
	('2013-04-11 02:05:36'), ('2002-10-05 03:39:24');
	
insert into date_table(dt) values(default);

select date_format(dt, '%y%m%d') from date_table;
select date_format(dt, '%y-%m-%d') from date_table;
select date_format(dt, '%h:%i:%s') from date_table;
select date_format(dt, '%h:%i:%s(%p)') from date_table;

select now(), curdate(), curtime();
select date_add(now(), interval 2 month);
select date_sub(now(), interval 2 month);

select to_days('2021-11-18') - to_days(curdate());
select dayofweek(now());

select * from date_table;