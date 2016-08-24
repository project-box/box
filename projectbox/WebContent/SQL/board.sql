select * from tab;
select * from seq;
select * from generalboard;

create table generalboard(
	id number primary key,
	userid varchar2(20) not null references users(id),	
	name varchar2(20),
	title varchar2(50),
	content varchar2(2000),
	readcount number default 0,
	registerdate date	
);

create sequence generalboard_seq;

insert into generalboard values
(generalboard_seq.nextval,'dev','dev','free','content',0,sysdate);


drop table generalboard purge;
