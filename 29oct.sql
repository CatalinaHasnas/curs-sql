Select *
From employees;


Insert Into retired_emps
Select 2015,'TJ Olson','ST_CLERK',100,'10-APR-15','17-AUG-15',2100,null,80 
From dual;

Select First_name||' '||last_name as Name,
     job_id,
     hire_date,
     salary
From employees
Union all
Select ename,
     job,
     hiredate,
     sal
From retired_emps;

Create table locations_old as
Select *
from locations;


Insert Into departments(department_id, department_name, manager_id, location_id)
Values ('280','Public Relationship',100,1700);

Select *
From departments; 


Insert Into departments
Values ('281','Public Relationship',100,1700);

Insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
Values (207, 'Hasnas', 'Catalina', 'catalinahasnas@yahoo.com', '123456789', sysdate, 'IT_PROG', 6000, 0.5, 100, 60);

Insert into departments
Values ('283', 'Name_1', null, null);

Insert into departments
Values (&department_id, &'department_name', null, null);

Create table sales_reps
(ID NUMBER(6) ,
NAME VARCHAR2(25),
SALARY NUMBER(8,2),
COMMISSION_PCT NUMBER(2,2));

Insert into sales_reps
(Select employee_id
,last_name
,salary
,commission_pct
From employees);

Select *
From sales_reps;


Update employees
Set department_id = 50, first_name = 'Luisa'
Where employee_id = 113;

Select *
From employees
WHere employee_id=103;

Update employees
Set (job_id, salary) = (Select job_id, salary
From employees
Where employee_id=205)
WHere employee_id=103;

Update employees
Set job_id='AC_MGR', salary=12008
WHere employee_id=113;

Insert into copy_emp
Select *
From employees;

Update copy_emp
Set department_id=(Select department_id
                   From employees
                   Where employee_id=100)
Where job_id=(Select job_id
              From employees
              Where employee_id=130);
              
Delete From copy_emp
Where empno>206;

Delete from departments
Where department_id in(280,281,282,283,70);

Delete from employees
Where department_id in (Select department_id
                        From departments
                        Where lower(department_name)like '%public%');
                        
Truncate table copy_emp;

Start transaction
Delete from copy_emp
Where department_id in(280,281,282,283,70)

Delete from copy_emp
Where department_id in(280,281,282,283,70);

rollback;

Select*
From employees;

Insert into copy_emp
Values (103,	'Alexande','Hunold','AHUNOLD','590.423.4567','03-JAN-14', 'IT_PROG', 9000	, 102, 60);
