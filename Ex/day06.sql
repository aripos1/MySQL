-- db 만들기
drop database book_db;

create database book_db
    default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n'
;

use book_db;

show databases;

-- 테이블 만들기
create table book(
	book_id integer
    ,title varchar(50)
    ,author varchar(20)
    ,pub_date datetime
);

show tables;

-- 컬럼 추가
alter table book add pubs varchar(50);

-- 수정 : 글자수 늘리기
alter table book modify title varchar(100);

-- 수정 : 이름 변경
alter table book rename column title to subject;

-- 컬럼 삭세

alter table book drop author;

-- 테이블명 수정
rename table book to article;

-- 테이블명 삭제
drop table article;


create table author(
	author_id 	 integer		primary key auto_increment
	,author_name varchar(100) 	not null
    ,author_desc varchar(500)
    );

show tables;


create table book(
	book_id 	integer 		primary key auto_increment
    ,title 		varchar(100) 	not null
    ,pubs 		varchar(100)
    ,pub_date 	datetime
    ,author_id 	int
    ,constraint book_fk foreign key(author_id)
    references author(author_id)
);


-- 작가 테이블에 데이터 등록
insert into author
value(1
     ,'박경리'
     ,'토지작가'
);

select * from author;

insert into author
value(2
     ,'이문열'
     ,null
);

insert into author ( author_id, author_name )
value(3
     ,'기안84'
);

-- 작가 테이블에 데이터 수정
update author 
set author_name = '임현성'
	,author_desc = '학생'
where author_id = 1
;

-- 작가 테이블에 데이터 삭제
delete from author
where author_id = 1
;

alter table book modify book_id integer auto_increment primary key; 

drop table book;
drop table author;


create table author(
	author_id 	 integer		primary key auto_increment
	,author_name varchar(100) 	not null
    ,author_desc varchar(500)
    );


create table book(
	book_id 	integer 		primary key auto_increment
    ,title 		varchar(100) 	not null
    ,pubs 		varchar(100)
    ,pub_date 	datetime
    ,author_id 	int
    ,constraint book_fk foreign key(author_id)
    references author(author_id)
);


insert into author (author_name, author_desc)
value ('박경리'
	  ,'경상남도 통영'
);

-- 현재값을 조회할때
select last_insert_id();

-- 강제로 번호를 변경할때
alter table author auto_increment = 5;
select * from author;