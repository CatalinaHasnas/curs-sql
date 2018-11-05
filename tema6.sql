-------------1oct

Select student_id, no_of_days_off
From ad_student_attendance
Where no_of_days_off>15;

Select course_name, department_id
From ad_course_details
Where course_id = 199;

Select student_id, marks
From ad_exam_results
Where marks NOT Between 65 AND 90;

Select student_id, first_name, student_reg_year
From ad_student_details 
Where first_name IN ('NINA' , 'ROBERT')
Order by first_name ASC;

Select course_name, department_id
From ad_course_details
Where department_id IN (20, 40)
Order by course_name ASC;

Select student_id AS "Student #", marks AS "Semester Marks"
From ad_exam_results
Where marks BETWEEN 65 and 90
AND course_id IN (199, 198);

Select first_name, student_reg_year
From ad_student_details
--Where student_reg_year LIKE '%14%';
Where student_reg_year BETWEEN '01-JAN-14' and '01-JAN-15';

Select first_name, parent_id
From ad_student_details
Where email_addr IS NULL;

Select first_name, student_reg_year, email_addr
From ad_student_details
Where email_addr IS NOT NULL
Order by 2, 3 DESC;

Select student_id, marks
From ad_exam_results
Where marks > &marks2;


Select course_id, course_name, session_id
From ad_course_details
Where department_id = &department_id_2
Order by &selected_column;

Select first_name
From ad_student_details
Where first_name LIKE '_O%' ;

Select first_name
From ad_student_details
Where first_name LIKE '%A%'
AND first_name LIKE '%N%';

Select course_id, course_name
From ad_course_details
Where department_id IN (10, 40)
AND session_id <> 200
AND session_id <> 300;

Select student_id AS "Student #", exam_id AS "Exam Code", course_id AS "Course Code", marks AS "Score"
From ad_exam_results
Where marks=70;

-------------------3oct

Create table String_Addreses as
Select 'MD-2002,or.Chisinau, str. Mihai Eminescu 12, ap.28' as address from dual
Union
Select '2010,or.Chisinau, str. Grigore Vieru 50, ap.3' as address from dual
Union
Select 'MD2015,or.Chisinau, str. Ion Creanga 4, ap.17'  as address from dual
Union
Select 'md-2030,Chisinau, st. Muncesti 8, ap.54'  as address from dual
Union
Select 'MD-2004,Chisineov, str-da. Bucuriei 2, ap.23'  as address from dual
Union
Select 'Md-2045,or Chisin., s. Ion Inculet 8, ap.50'  as address from dual
Union
Select 'Md2013,chisinau, str. Vasile Lupu 40, ap.20'  as address from dual
Union
Select 'MD2031,or.CHISINAU,'  as address from dual
Union
Select 'md2017,or.CH, str. , ap.28'  as address from dual;





Select Substr(address,1,instr(address,',',1,1)-1) as t1
     ,'MD-'||substr(Substr(address,1,instr(address,',',1,1)-1),-4) zip_code

From String_Addreses;

Select address
     ,instr(address,',',1,1) as t1
     ,substr(address,1,instr(address,',',1,1)-1) as t2
     ,substr(substr(address,1,instr(address,',',1,1)-1),-4,4)as t3
     ,'MD-'||substr(substr(address,1,instr(address,',',1,1)-1),-4,4) as adress
From String_Addreses;

Select salary, last_name
,lpad(salary, 10, '$')
,rpad(salary,6,'e')
,concat (concat (first_name,' '), last_name) as full_name
,Lower (concat (concat(first_name,' '), last_name) as full_name)) as full_name1
,Upper (concat (concat(first_name,' '), last_name) as full_name)) as full_name2
,Initcap (concat (concat(first_name,' '), last_name) as full_name)) as full_name2
From employees;

Select TRUNC (100.455321,2) as round_1
,TRUNC (100.455321, 0) as round_2
,TRUNC (100.455321) as round_3
,TRUNC (100.455321, -1)
from dual;

-------- 8 oct

select sysdate
From dual;

Select student_id, course_id, marks, ROUND(marks * 1.115, 0) AS "New Score"
From ad_exam_results;

Select student_id, course_id, marks, ROUND(marks * 1.115, 0) AS "New Score", ROUND(marks * 1.115, 0) - marks AS "Increase"
From ad_exam_results;

Select INITCAP(first_name) AS "Name", LENGTH(first_name) AS "Lenght"
From ad_student_details;
Where first_name LIKE 'J%'
OR first_name LIKE 'R%'
OR first_name LIKE 'M%'
Order by first_name;

Select INITCAP(first_name) AS "Name", LENGTH(first_name) AS "Lenght"
From ad_student_details 
Where first_name LIKE '&start_letter%'
Order by first_name;

Select INITCAP(first_name) AS "Name", LENGTH(first_name) AS "Lenght"
From ad_student_details 
Where first_name LIKE UPPER ('&start_letter%')
Order by first_name;

Select INITCAP(first_name), ROUND((SYSDATE-student_reg_year),0) AS "Months Completed"
From ad_student_details;

Select exam_name, LPAD (exam_type, 15, '*') AS Exam_Code
From ad_exam_type;

Select student_id, RPAD(' ', marks/10, '*') AS Students_and_their_marks
From ad_exam_results
Order by marks DESC;

Select first_name, TRUNC((SYSDATE-student_reg_year)/7) AS Weeks_Completed
From ad_student_details
Where email_addr is NULL
Order by Weeks_Completed DESC;

Select *
From emplyees
Where hire_date = '07-02-15'; to_date('07-02-15','DD-MM-YY);

Select hire_date, to_char (hire_date, 'DD-MM.YYYY') AS to_char
    , to_char(hire_date, 'Day-Month-YYYY HH24:MI:SS AM') as to_char
    , to_char (hire_date, 'DD "of" Month') AS month_of
    , to_char (hire_date,'Ddspth "of" Month, YYYY') month_of
From employees;


Select to_char(hire_date,'Ddspth "abc" Month, YYYY') AS Month_of
    ,to_char(hire_date,'Day.Month.YYYY') AS Month_of_1
    ,to_char(hire_date,'fmDay.Month.YYYY') AS to_char_fm
    ,to_char(employee_id, '$999.9999')
    ,to_char(salary, '99,999.999')
From employees;

Select to_number ('1740.20','99,999.000')
From employees;

Select *
From employees
Where hire_date = to_date('17-06-2011','DD.MM.YYYY');

Select months_between (sysdate,to_date('17-06-2011','DD-MM-YY')) as string_with_date
,sysdate
,to_date('17-06-2011','DD-MM-YY')
From employees;

Select salary
    ,commission_pct
    ,nvl (commission_pct,0) as subtitution_commision
    ,salary*commission_pct as full_salary
    ,salary * nvl(commission_pct,1) as full_salary
From employees;

Select nvl2(commission_pct,1,0)
From employees
Where nvl2(commission_pct,1,0) = 0;

Select commission_pct
,coalesce (commission_pct, manager_id, department_id, employee_id) as return_first_notnull
From employees
Where nvl2(commission_pct,1,0) = 0;

Select first_name ||' '|| last_name as FullName
, CASE job_id When 'ST_CLERK' THEN salary * 0.5
When 'AC_ACCOUNT' THEN salary*0.75
When 'ST_MAN' THEN salary*0.4
ELSE salary END
,Case When job_id = 'IT_PROG' and salary>6000 Then department_id
When job_id = 'SA_RET' and salary <8000 Then department_id
else manager_id
END
From employees;

-----10 0ct



