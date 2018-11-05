-------------

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
















