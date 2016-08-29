drop table generalboard purge;
drop table concertboard purge;
drop table preference purge;
drop table concert purge;
drop table music purge;
drop table users purge;

drop sequence music_seq;
drop sequence concert_seq;
drop sequence preference_seq;
drop sequence concertboard_seq;
drop sequence generalboard_seq;


-- 사용자 테이블
create table users(
  id varchar2(14) primary key, -- 아이디
  password varchar2(14) not null, -- 비밀번호
  name varchar2(20) not null, -- 이름
  email varchar2(30) not null, -- 이메일
  gender varchar2(10) not null, -- 성별
  phone varchar2(16) not null, -- 휴대폰
  age number not null, -- 나이
  logincont number not null, -- 로그인숫자
  status varchar2(10) -- 삭제여부
);

-- 음악 테이블
create table music (
  id number primary key, -- 아이디
  similarity number not null, -- 유사도
  genre varchar2(20) not null, -- 장르
  artist varchar2(30) not null, -- 아티스트
  title varchar2(40) not null, -- 곡제목
  album varchar2(40), -- 앨범
  lyrics varchar2(4000), -- 가사
  publishdate varchar2(30), -- 발매일
  albumcoverfilepath varchar2(40) -- 앨범커버 파일 경로
);

-- 공연 테이블
create table concert(
  id number primary key, -- 아이디
  place varchar2(20) not null, -- 장소
  startdate date not null, -- 공연 시작 날짜
  enddate date not null, -- 공연 종료 날짜
  showtime varchar2(20) not null, -- 공연 시간
  title varchar2(40) not null, -- 공연 제목
  posterfilepath varchar2(40), -- 포스터 파일 경로
  artist varchar2(40), -- 출연
  similarity number not null, -- 유사도
  locationx number,
  locationy number
);

-- 선호도 테이블
create table preference(
  id number primary key, -- 아이디
  musicid number references music(id), -- 음악아이디
  userid varchar2(14) references users(id), -- 유저아이디
  genre varchar2(20) not null, -- 장르
  artist varchar2(40) not null, -- 아티스트
  title varchar2(40) not null, -- 곡제목
  publishdate date, -- 발매일
  rate number not null, -- 평가지수
  similarity number not null -- 유사도
);

-- 공연(후기) 게시판 테이블
create table concertboard(
  id number primary key, -- 아이디
  concertid number references concert(id), -- 공연 아이디
  userid varchar2(14) references users(id), -- 유저아이디
  content varchar2(400), -- 게시물 내용
  registerdate date -- 게시물 등록날짜
);

select * from concertboard;

-- 일반 게시판
create table generalboard(
  id number primary key, -- 아이디
  title varchar2(30), -- 제목
  content varchar2(400), -- 게시글 내용
  registerdate date, -- 게시글 등록 날짜
  name varchar2(30), -- 등록자
  userid varchar2(14) references users(id)-- 유저아이디
);

-- 아이디 번호 채번을 위한 시퀀스

create sequence music_seq
start with 1
increment by 1
nocache;

create sequence concert_seq
start with 1
increment by 1
nocache;

create sequence preference_seq
start with 1
increment by 1
nocache;

create sequence concertboard_seq
start with 1
increment by 1
nocache;

create sequence generalboard_seq
start with 1
increment by 1
nocache;

select * from music;
select * from concert;
drop table music purge;

