--10 Octombrie 

Select phone_number
,to_number(replace(phone_number,'.',','), '999,999,9999')
From employees
Where employee_id between 100 and 144;
---am schimbat nr. telefon (string) in number

Select last_name, job_id, salary,
DECODE (job_id, 'IT_PROG', salary*1.10,
                'ST_Clerk', salary*1.15,
                'SA_REP', salary *1.20, salary) as REVISED_SALARY
From employees;
                

Select sum(salary) as totalsalary
,min(salary) as min_salary
,max(salary) as max_salary
,AVG(salary) as avg_salary
,Count (employee_id) as count_employee_id
From employees;

Select distinct count(distinct job_id) as job_id_1
,count(job_id) as job_id_2
,sum(salary) as salary_2
,sum(distinct salary) as salary_1
,min(hire_date) as min_hire_date
,max(hire_date) as max_hire_date
,count(nvl(commission_pct, 0)) as count_employee_id
,count(*) as count_all
--deoarece doar 4 nu au null la commision_pct
From employees;
--Where job_id='SA_REP';

Select nvl (department_id,10)
,round (AVG(salary),2)
From employees
Group by nvl (department_id,10);

Select department_id, job_id, manager_id, sum(salary)
From employees
Where department_id between 50 and 100
---AND salary>=10000
---AND Max(salary)>=10000 da eroare
Group by department_id, job_id, manager_id
Having max(salary)>=10000
Order by 1;

---------------12 oct
--1
Select to_char(hire_date,'MM.YYYY'), max(salary)
From employees
Where phone_number LIKE '650%'
Group by to_char(hire_date,'MM.YYYY')
Order by max(salary) DESC;


Select *
From employees;

--2
Select INITCAP(job_id), count(employee_id)
From employees
Group by job_id;

--3a
Select to_char(hire_date,'MM.YYYY'), count(employee_id)
From employees
Group by to_char(hire_date,'MM.YYYY')
Order by 1 DESC;

--3b
Select to_char(hire_date,'MM.YYYY'), count(employee_id) AS COUNT_EMPLOYEE
From employees
Group by to_char(hire_date,'MM.YYYY')
Having count(employee_id)>1
Order by 1 DESC;

--4
Select manager_id, count(manager_id)
From employees
Group by manager_id
Having count(manager_id)>1;

--5
Select To_char(commission_pct) as char_commission, count(employee_id)
,NVL((To_char(commission_pct)),'Persoane fara comision') as situatia_comisioanelor
From employees
Group by To_char(commission_pct);

--6
Select employee_id, job_id, months_between(start_date, end_date);
From job_history;


----------------- tema 11

Select employee_id, first_name, job_id, job_title
From employees natural join jobs;


Select *
from employees
Natural join jobs
natural join departments
where employee_id=102;


Select employees.first_name
      ,employees.last_name
      ,jobs.job_title
from employees 
Natural join jobs;

Select *
from employees
join jobs using(job_id)
join departments using(manager_id);

Select distinct manager_id
from employees;
Minus
Select distinct manager_id
from departments;


Select t1.*
      ,t2.job_title
      ,t2.max_salary
      ,t2.min_salary
from employees t1
join jobs t2
on t1.job_id=t2.job_id;

