select * from employees;
select first_name
		,salary
from employees;

-- 그룹 함수
select avg(salary) 
from employees;

select count(commission_pct)
		,count(*)
from employees;

select count(*)
		,count(manager_id)
from employees
where salary > 16000
;

select sum(salary) sum
		,avg(salary) avg
        ,count(*) count
from employees
where salary >5000
;


select count(*)
		,sum(salary)
        ,avg(ifnull(salary,0)) -- null 값을 0으로 변환하여 계산(null값을 포함)
from employees
;

select count(*)
		,max(salary)
        ,min(salary)
from employees
;

select department_id department
		,job_id
        ,sum(salary) sum
        ,avg(salary) avg
        ,count(ifnull(department_id,0)) count
from employees
group by department_id, job_id   -- 기준 정하기
order by department_id asc
;

select department_id 부서번호
		,count(*) 인원수
        ,sum(salary) 월급합계
        ,employee_id
from employees
group by department_id ,employee_id
having sum(salary) >= 20000
-- and department_id = 80
and employee_id >= 50
order by count(*) asc
;

select 	first_name
		,salary
        ,commission_pct
        ,ifnull(commission_pct,0) state1
        ,if(commission_pct is null , 0, 1) state2
from employees
order by state2 desc
;

select job_id
		,salary
        ,employee_id
    	,case WHEN job_id = 'ac_account' THEN salary + salary*0.1
		WHEN job_id = 'sa_rep'  THEN salary + salary*0.2
		WHEN job_id = 'sh_clerk' THEN salary + salary*0.3
		ELSE  salary
	END realsalary
from employees
;
select * from employees;
/*
[예제]
직원의 이름, 부서번호, 팀을 출력하세요
팀은 코드로 결정하며 부서코드가 
    10~50 이면 'A-TEAM'
    60~100이면 'B-TEAM'  
    110~150이면 'C-TEAM' 
    나머지는 '팀없음' 으로 
    출력하세요.
*/
select first_name
		,department_id
        ,case when department_id  between 10 and 50 then 'A-TEAM'
			  when department_id  between 60 and 100 then 'B-TEAM'
              when department_id  between 110 and 150 then 'C-TEAM'
              else '팀없음'
              end '팀'
from employees
order by 팀 asc;

/*
  JOIN
*/

select * from employees;
select * from departments;

select first_name
		,salary
        ,department_name
from employees em, departments de
where em.department_id = de.department_id
;

select first_name
		,salary
        ,department_name
from employees em inner join departments de
on em.department_id = de.department_id
;

select em.first_name 이름
		,de.department_name 부서명
        ,jo.job_title 업무명
        ,lo.city 도시
from employees em, departments de, jobs jo, locations lo
where em.department_id = de.department_id
and  em.job_id = jo.job_id
and de.location_id = lo.location_id 
;

select * from employees;
(select first_name
		,em.employee_id
   		,department_name
from employees em right join departments de
on em.department_id = de.department_id)
union
(select first_name
		,em.employee_id
   		,department_name
from employees em left join departments de
on em.department_id = de.department_id)
;

# 조인 연습
-- 직원아이디, 이름, 월급, 부서아이디, 부서명, 도시아이디, 도시명

select 	employee_id 직원아이디
		,em.first_name 이름
        ,em.salary 월급
        ,de.department_id 부서아이디
		,de.department_name 부서명
        ,lo.location_id 도시아이디
        ,lo.city 도시
from employees em, departments de, locations lo
where em.department_id = de.department_id
and de.location_id = lo.location_id 
;

select 	employee_id 직원아이디
		,em.first_name 이름
        ,em.salary 월급
        ,de.department_id 부서아이디
		,de.department_name 부서명
        ,lo.location_id 도시아이디
        ,lo.city 도시
from employees em 
inner join departments de 
inner join locations lo
on em.department_id = de.department_id
and de.location_id = lo.location_id 
;

-- 직원아이디, 이름, 월급, 부서아이디, 부서명, 도시아이디, 도시명, 나라아이디, 나라명
select 	employee_id 직원아이디
		,em.first_name 이름
        ,em.salary 월급
        ,de.department_id 부서아이디
		,de.department_name 부서명
        ,lo.location_id 도시아이디
        ,lo.city 도시
        ,co.country_id 나라아이디
        ,co.country_name 나라명
from employees em, departments de, locations lo, countries co
where em.department_id = de.department_id
and de.location_id = lo.location_id 
and lo.country_id = co.country_id
;
select 	employee_id 직원아이디
		,em.first_name 이름
        ,em.salary 월급
        ,de.department_id 부서아이디
		,de.department_name 부서명
        ,lo.location_id 도시아이디
        ,lo.city 도시
        ,co.country_id 나라아이디
        ,co.country_name 나라명
from employees em 
inner join departments de 
inner join locations lo 
inner join countries co
on em.department_id = de.department_id
and de.location_id = lo.location_id 
and lo.country_id = co.country_id
;

-- 직원아이디, 이름, 월급, 부서아이디, 부서명, 도시아이디, 도시명, 나라아이디, 나라명, 지역아이디, 지역명

select 	employee_id 직원아이디
		,em.first_name 이름
        ,em.salary 월급
        ,de.department_id 부서아이디
		,de.department_name 부서명
        ,lo.location_id 도시아이디
        ,lo.city 도시
        ,co.country_id 나라아이디
        ,co.country_name 나라명
        ,re.region_id 지역아이디
        ,re.region_name 지역명
from employees em, departments de, locations lo, countries co, regions re
where em.department_id = de.department_id
and de.location_id = lo.location_id 
and lo.country_id = co.country_id
and co.region_id = re.region_id
;

select 	employee_id 직원아이디
		,em.first_name 이름
        ,em.salary 월급
        ,de.department_id 부서아이디
		,de.department_name 부서명
        ,lo.location_id 도시아이디
        ,lo.city 도시
        ,co.country_id 나라아이디
        ,co.country_name 나라명
        ,re.region_id 지역아이디
        ,re.region_name 지역명
from employees em 
inner join departments de
inner join locations lo 
inner join countries co 
inner join regions re
on em.department_id = de.department_id
and de.location_id = lo.location_id 
and lo.country_id = co.country_id
and co.region_id = re.region_id
;

-- 직원아이디, 이름, 이메일, 관리자아이디, 관리자 이름, 관리자 이메일
select em.employee_id
		,em.first_name
        ,em.email
        ,de.manager_id
        ,eme.first_name
        ,eme.email
from employees em, employees eme, departments de
where em.department_id = de.department_id
and em.manager_id = eme.employee_id
;
select * from departments;
select * from employees;