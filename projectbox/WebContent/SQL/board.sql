select * from tab;
select * from seq;
select * from generalboard;
select * from users;
drop table generalboard purge;

create table generalboard(
	id number primary key,
	userid varchar2(20) not null references users(id),
	password varchar2(20) not null,
	name varchar2(20),
	title varchar2(50),
	content varchar2(2000),
	readcount number default 0,
	registerdate date	
);

create sequence generalboard_seq;

insert into generalboard values
(generalboard_seq.nextval,'dev','1234','dev','게시판 연습','하하하',0,sysdate);


drop table generalboard purge;
