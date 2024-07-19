select * from employees;
/*
* 복습
*/
-- 기본 구조 select 절에는 select문, from문이 있다.
select * 
from employees;


-- 특수한 경우
select now() from dual; -- 가상의 테이블 dual
select now(); -- mysql에서만 가능

-- 4칙연산
select 	first_name 이름
		,salary 월급
		,salary*12 연봉
from employees;

-- 컬럼 합치기
select 	first_name 이름 
		,last_name 성
		,concat(first_name,' ', last_name) 성명
 from employees; 
 
 -- where 절
 
 select first_name
		,salary
 from employees
where salary >= 17000; 


/*
2일차
*/

select first_name
		,salary
from employees
where first_name='lex';

select first_name
		,salary
from employees
where first_name like ('l%'); -- l이 맨앞에 있는 모든 글자

select first_name
		,salary
from employees
where first_name like ('%l'); -- l이 마지막에 포함된 모든 글자

select first_name
		,salary
from employees
where first_name like ('%l%'); -- l 포함된 모든 글자

select first_name
		,salary
from employees
where first_name like ('l__'); -- 자리수

-- 이름에 am 을 포함한 사원의 이름과 월급을 출력하세요
select first_name 이름
		,salary 월급
from employees
where first_name like ('%am%'); 

-- 이름의 두번째 글자가 a 인 사원의 이름과 월급을 출력하세요
select first_name 이름
		,salary 월급
from employees
where first_name like ('_a%'); 

-- 이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name 이름
from employees
where first_name like ('___a%'); 

-- 이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name 이름
from employees
where first_name like ('__a_'); 

-- null
select *
from employees
where salary >= 13000
and salary <= 15000
;

 -- null은 계산 되지 않는다
select 	first_name
		,salary
        ,commission_pct
        , salary*commission_pct +200 수당
from employees
where salary between 13000 and 15000
;

 -- null이 아닌 값만 출력
select 	first_name
		,salary
        ,commission_pct
from employees
where commission_pct is not null
;

 -- null인 값만 출력
select 	first_name
		,salary
        ,commission_pct
from employees
where commission_pct is null
;

-- 커미션비율이 있는 사원의 이름과 월급 커미션비율을 출력하세요
select 	first_name 이름
		,salary 월급
        ,commission_pct 커미션
from employees
where commission_pct is not null
;

-- 담당매니저가 없고 커미션비율이 없는 직원의 이름과 매니저아이디 커미션 비율을 출력하세요
select 	first_name 이름
		,commission_pct 커미션
        ,manager_id
from employees
where commission_pct is  null and manager_id is null
;

-- 부서가 없는 직원의 이름과 월급을 출력하세요
select 	first_name 이름
		,salary 월급
from employees
where department_id is  null
;

-- order by 절
-- 직원의 이름과 월급이 많은 직원부터 출력하세요
select 	first_name
		,salary
from employees
order by salary asc; -- desc 내림차순 asc -- 오름차순

#월급이 9000이상인 직원의 이름과 월급이 많은 직원부터 출력하시오
select 	first_name
		,salary
from employees
where salary >= 9000
order by salary desc
; 

-- 부서번호를 오름차순으로 정렬하고 부서번호, 월급, 이름을 출력하세요
select 	department_id
		,first_name
		,salary
from employees
order by department_id asc
; 

-- 월급이 10000 이상인 직원의 이름 월급을 월급이 큰직원부터 출력하세요

select  first_name
		,salary
from employees
where salary >= 10000
order by  salary desc
; 

-- 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 월급이 높은 사람부터 부서번호 월급 이름을 출력하세요  
select 	department_id
		,salary
        ,first_name
from employees
order by department_id asc, salary desc
; 

-- 직원의 이름, 급여, 입사일을 이름의 알파벳 올림차순으로 출력하세요
select 	first_name
		,salary
        ,hire_date
from employees
order by first_name asc
; 

-- 직원의 이름, 급여, 입사일을 입사일이 빠른 사람 부터 출력하세요
select 	first_name
		,salary
        ,hire_date
from employees
order by hire_date asc
; 

/*
단일행 함수
*/

-- 단일행 함수
-- round() : 반올림
select 	round(127.123,1)
		,round(127.123,-1)
        ,round(127.123)
from dual
;

-- ceil :소수점 올림
select 	ceil(127)
		,ceil(127.92312321)
        ,ceil(127.1238794)
from dual
;
-- floor :소수점 버림
select 	floor(127.123)
		,floor(127.92312321)
        ,floor(127.1238794)
from dual
;

-- truncate() : 자리수 버림
select 	truncate(127.123,1)
		,truncate(127.123,-1)
        ,truncate(127.123,2)
from dual
;


--  POWER(숫자, n),  POW(숫자, n): 숫자의 n승
select  pow(12,2);

-- SQRT(숫자): 숫자의 제곱근  
select  sqrt(144);

-- SIGN(숫자): 숫자가 음수이면 -1, 0이면 0, 양수이면 1 
select 	sign(123)
		,sign(0)
        ,sign(-123)
;

-- ABS(숫자): 절대값  
select 	abs(123)
		,abs(0)
        ,abs(-123)
;

--  GREATEST(x, y, z, ...): 괄호안의 값중 가장 큰값  
select 	greatest(2, 0, -2) 		
		,greatest(4, 3.2, 5.25) 
        ,greatest('B', 'A', 'C', 'c')
;

--  LEAST(x, y, z, ...): 괄호안의 값중 가장 작은값  
select 	least(2, 0, -2)
		,least(4, 3.2, 5.25)        
		,least('B', 'A', 'C', 'c')
;

  -- CONCAT(str1, str2, ..., strn): str1, str2, ..., strn을 연결 
  
select concat('안녕', '하세요');
select concat('안녕', '-', '하세요');
select concat(first_name, " ", last_name)
from employees;

-- CONCAT_WS(s, str1, str2, ..., strn): str1, str2, ..., strn을 연결할때 사이에 s 로 연결
select concat_ws('-','abc','123','가나다');
select concat_ws('-', first_name, last_name, salary)
from employees;

-- LCASE(str) 또는 LOWER(str): str의 모든 대문자를 소문자로 변환
select 	first_name
		,lcase(first_name)
        ,lower(first_name)
        ,lower('ABCabc!#$%')
        ,lower('가나다')
from employees;

-- UCASE(str) 또는 UPPER(str): str의 모든 소문자를 대문자로 변환
select 	first_name
		,ucase(first_name)
        ,upper(first_name)
        ,upper('ABCabc!#$%')
        ,upper('가나다')
from employees;

-- LENGTH(str): str의 길이를 바이트로 반환
select 	first_name,
	length(first_name),
	char_length(first_name),        	
    character_length(first_name)
from employees;

select 	
	length('유재석'), -- 바이트로 출력
	char_length('유재석'),  -- 문자 개수로 출력(글자수)
    character_length('유재석')
;

-- SUBSTRING(str, pos, len) 또는 SUBSTR(str, pos, len): 
select 	first_name
		,substr(first_name,1,3)
        ,substr(first_name,-3,2)
from employees
;

select 	substr('888888-1111111',8,1) --성별
        ,substr('888888-1050214',-7,1) --성별
;

-- LPAD(str, len, padstr): str 문자열 왼쪽에 padstr 문자열을 추가하여, 전체 문자열의 길이가 len이 되도록 만듬
select first_name 
       ,lpad(first_name,10,'*') 
       ,Rpad(first_name,10,'*') 
from employees;

-- TRIM(str): str의 양쪽에 있는 공백 문자를 제거
-- LTRIM(str): str의 왼쪽에 있는 공백 문자를 제거
-- RTRIM(str): str의 오른쪽에 있는 공백 문자를 제거
select 	concat('|',  '          안녕하세요             ',  '|' )
		,concat('|',  trim('          안녕하세요             '),  '|' )
        ,concat('|',  ltrim('          안녕하세요             '),  '|' )
        ,concat('|',  rtrim('          안녕하세요             '),  '|' )
;

 -- REPLACE(str, from_str, to_str): str에서 from_str을 to_str로 변경
 select first_name 
       ,replace(first_name, 'a', '*') 
       ,substr(first_name, 2,3)
       ,replace(first_name, substr(first_name, 2,3), '***') 
from employees;


--  단일행 함수-날짜 함수
select curdate() from dual;
select curtime() from dual;
select current_timestamp(), now() from dual;

-- ADDDATE() 또는 DATE_ADD(): 날짜 시간 더하기
-- SUBDATE() 또는 DATE_SUB(): 날짜 시간 빼기

select  adddate('2021-06-20 00:00:00', INTERVAL 1 YEAR),
		adddate('2021-06-20 00:00:00', INTERVAL 1 MONTH),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 WEEK),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 DAY),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 HOUR),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 MINUTE),  
		adddate('2021-06-20 00:00:00', INTERVAL 1 SECOND)
        ;
        
select 	subdate('2021-06-20 00:00:00', INTERVAL 1 YEAR),
		subdate('2021-06-20 00:00:00', INTERVAL 1 MONTH),  
		subdate('2021-06-20 00:00:00', INTERVAL 1 WEEK),  
		subdate('2021-06-20 00:00:00', INTERVAL 1 DAY),  
		subdate('2021-06-20 00:00:00', INTERVAL 1 HOUR),  
		subdate('2021-06-20 00:00:00', INTERVAL 1 MINUTE),  
		subdate('2021-06-20 00:00:00', INTERVAL 1 SECOND)
        ;
        
-- DATEDIFF(): 두 날짜간 일수차
-- TIMEDIFF(): 두 날짜시간 간 시간차

select	datediff('2021-06-21 01:05:05', '2021-06-21 01:00:00'),	
		timediff('2021-06-21 01:05:05', '2021-06-20 01:00:00')
;

select 	first_name
		,hire_date	
		,floor(datediff(now(), hire_date)/365)
from employees
order by hire_date asc;


  -- DATE_FORMAT(date, format): date를 format형식으로 변환
select	now(), 		
		date_format(now(), '%y-%m-%d %H:%i:%s'),
		date_format(now(), '%Y-%m-%d(%a) %H:%i:%s %p')
from dual
;

 -- FORMAT(숫자, p): 숫자에 콤마(,) 를 추가, 소수점 p자리까지 출력
 select format(1234874.89, 2) '숫자';
 
 select first_name
		,salary
        ,format(salary, 0) 급여
 from employees;
 
 -- IFNULL(컬럼명, null일때값): 컬럼의 값이 null일때 정해진값을 출력
select 	first_name 이름
		,salary 급여
		,commission_pct 커미션비율 
		,salary*ifnull(commission_pct, 0)+500 보너스
from employees;
 