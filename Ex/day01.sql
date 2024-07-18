select * from employees;
select * from departments;
-- digh
/*
select 문(조회)
*/
-- select ~from 절
-- 테이블 전체 조회하기
select * from employees;
select * from departments;
select * from locations;

select * from employees;
select first_name from employees;
select * from employees;
select first_name, phone_number, hire_date,salary  from employees;
select * from employees;
select	first_name, 
		last_name, 
		salary,
		phone_number,
		email,
		hire_date
from employees;

-- * 컬럼명의 별명 사용하기, 공백, 특문이 있는 경우 ' ' 를 사용

select * from employees;
select	first_name as 이름
		, last_name as 성 
from employees;

select * from employees;
select	first_name as 이름
		,phone_number as 전화번호 
        ,hire_date as 입사일
        ,salary as 월급
 from employees;
 select	first_name 이름
		,phone_number 전화번호 
        ,hire_date 입사일
        ,salary '월 급'
 from employees;

-- 직원아이디, 이름, 월급을 출력하세요. 
-- 단 직원아이디는 empNO, 이름은 "f-name", 월급은 "월 급" 으로 컬럼명을 출력하세요
select * from employees;
select	employee_id empNO
		,first_name 'f-name'
        ,salary '월 급'
from employees;

-- 직원의 이름(fisrt_name)과 전화번호, 입사일, 월급 으로 표시되도록 출력하세요
select * from employees;
select	first_name '이름(fisrt_name)'
		,phone_number 전화번호
        ,hire_date 입사일
        ,salary 월급
from employees;

-- 직원의 직원아이디를 사 번, 이름(first_name), 성(last_name), 월급, 전화번호, 이메일, 입사일로 표시되도록 출력하세요
select * from employees;
select	employee_id '사 번'
		,first_name '이름(fisrt_name)'
        ,last_name '성(last_name)'
        ,salary 월급
		,phone_number 전화번호
        ,email 이메일
        ,hire_date 입사일
from employees;


select 	salary
		,salary*12 연봉
        ,salary-100 '월급-식대'
        ,salary*12+5000 '월급+보너스'
        ,salary/30 '일급'
        ,employee_id%3 '나머지'
from employees;

-- 컬럼 합치기
select job_id*12
from employees; -- 문자열은 0이 되므로 조심

select	first_name 
        ,last_name 
from employees;

select	concat(first_name,last_name) 
        ,concat(first_name,last_name) as 이름
        ,concat(first_name,' ',last_name) as 이름
        ,concat(first_name,' ',last_name, '입사일은 ' ,hire_date, '입니다.') 이름2
       
from employees;

select * from employees;
select  concat(first_name,'-',last_name) 성명
		,salary 월급
        ,salary*12 연봉
        ,salary*12+5000 보너스
        ,phone_number 전화번호
from employees;

select 	first_name
		,salary
        ,'(주)개발자' company
        ,3
        
from employees;

select * from employees;
select	first_name 이름
		, department_id 부서아이디
from employees
where department_id=10;

select	first_name 이름
		, salary  월급
from employees
where salary>=15000;

select	first_name 이름
		, hire_date 입사일
from employees
where hire_date>= 20070101;

select	first_name 이름
		, salary  월급
from employees
where binary first_name = 'Lex';

select * from employees;
select	first_name 사원
		,hire_date 입사일
from employees
where hire_date >= 040101 and hire_date < 051231;

select	first_name 이름
		, salary  월급
from employees
where salary between 14000 and 17000;


select 	first_name 이름
		,salary 월급
from employees
where salary = 2100 
or salary =  3100 
or salary =  4100 
or salary = 5100;

select 	first_name 이름
		,salary 월급
from employees
where salary in (2100, 3100, 4100,5100);

select 	first_name 이름
		,last_name 성
		,salary 월급
from employees
where first_name in('Neena', 'Lex', 'John');