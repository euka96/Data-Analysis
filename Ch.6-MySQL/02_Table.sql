create table if not exists address_book (
	`no` int unsigned not null auto_increment,
	`name` varchar(10) not null,
	tel varchar(20),
	nickname varchar(20) default '별명',
	primary key(`no`)
) auto_increment = 10001;

desc address_book;

show tables;

drop table city2;	# drop | table or view 지우기
drop view metropolitan;
show tables;

rename table address_book to addr_book;
show tables;

DESC addr_book;

# Baseball team Kium

create table if not exists team (
	id int not null auto_increment,
	back_no int not null,
	`name` varchar(10),
	position varchar(10),
	salary int not null,
	primary key(id)
) auto_increment = 1;

desc team;

insert into team (back_no, `name`, position, salary)
	values
	(10, '문성현', '투수', 45000000 / 12),
	(26, '김정후', '투수', 32000000 / 12),
	(27, '박동원', '포수', 230000000 / 12),
	(32, '이지영', '포수', 300000000 / 12),
	(52, '박병호', '내야수', 1500000000 / 12),
	(62, '전병우', '내야수', 60000000 / 12),
	(51, '이정후', '외야수', 550000000 /12),
	(19, '이용규', '외야수', 100000000 / 12);

insert into team
	values (9, 39, '양현', '투수', 120000000 / 12),
	(10, 14, '서건창', '내야수', 225000000 / 12),
	(29, 23, '김철수', '포수', 91);
	
update team set salary = 45833334
	where id = 7;
	
delete from team
	where position = '포수' and `name` LIKE '김철%';

select * from team;