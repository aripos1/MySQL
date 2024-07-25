root 계정에서 할일
-------------------------------*/
-- book계정만들기
create user 'book'@'%' identified by '1234';
-- book권한부여
grant all privileges on book_db.* to 'book'@'%' ;
-- book_db만들기
create database book_db
    default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n'
;
show databases ;

/*-----------------------------
book 계정에서 할일
-------------------------------*/
-- 작가 테이블 만들기
use book_db;

create table author(
	author_id 	 integer		primary key auto_increment
	,author_name varchar(100) 	not null
    ,author_desc varchar(500)
    );
-- 책 테이블 만들기
create table book(
	book_id 	integer 		primary key auto_increment
    ,title 		varchar(100) 	not null
    ,pubs 		varchar(100)
    ,pub_date 	datetime
    ,author_id 	int
    ,constraint book_fk foreign key(author_id)
    references author(author_id)
);
-- 작가 등록(6개)
insert into author (author_name, author_desc)
value ('이문열'
	  ,'경북 영양'
);

insert into author 
value (null
	  ,'박경리'
	  ,'경상남도 통영'
);

insert into author (author_name, author_desc)
value ('유시민'
	  ,'17대 국회의원'
);

insert into author (author_name, author_desc)
value ('기안84'
	  ,'기안동에서 산 84년생'
);

insert into author (author_name, author_desc)
value ('강풀'
	  ,'온라인 만화가 1세대'
);

insert into author (author_name, author_desc)
value ('김영하'
	  ,'알뜰신잡'
);

select * from author;
-- 책등록(8개)
insert into book (title, pubs, pub_date)
value ('우리들의 일그러진 영웅 '
	  ,'다림'
      ,19980222
 );

update book 
set author_id = 1
where book_id = 1;
select * from book;

insert into book
value (null
	  ,'삼국지'
	  ,'민음사'
      ,20020301
      ,2
);
update book 
set author_id = 1
where book_id = 2;

insert into book (title, pubs, pub_date,author_id)
value ('토지'
	  ,'마로니에북스'
      ,20120815
      ,2
);

insert into book (title, pubs, pub_date,author_id)
value ('유시민의 글쓰기 특강'
	  ,'생각의길'
      ,20150401
      ,3
);

insert into book (title, pubs, pub_date,author_id)
value ('패션왕'
	  ,'중앙북스(books)'
      ,20120222
      ,4
);

insert into book (title, pubs, pub_date,author_id)
value ('순정만화'
	  ,'재미주의'
      ,20110803
      ,5
);

insert into book (title, pubs, pub_date,author_id)
value ('오직두사람'
	  ,'문학동네'
      ,20170504
      ,6
);

insert into book (title, pubs, pub_date,author_id)
value ('26년'
	  ,'재미주의'
      ,20120204
      ,5
);
-- 책+작가 리스트 출력
select book_id
		,title
        ,pubs
        ,date_format(pub_date, '%Y-%m-%d') 'pub_date'
        ,b.author_id
        ,author_name
        ,author_desc
from book b, author a
where b.author_id =  a.author_id
order by book_id asc
;
-- 강풀정보 변경
update author
set author_desc = '서울특별시'
where author_id = 5
;
-- 책+작가 리스트 출력
select book_id
		,title
        ,pubs
        ,date_format(pub_date, '%Y-%m-%d') 'pub_date'
        ,b.author_id
        ,author_name
        ,author_desc
from book b, author a
where b.author_id =  a.author_id
order by book_id asc
;
-- 기안84 작가 삭제
delete from author
where author_id = 4;
-- -->오류발생 이유 생각해보기
book 테이블과 fk로 연결 되어 있기 때문에 삭제가 되지 않음