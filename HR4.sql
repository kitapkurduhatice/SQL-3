--1. Personel->Department Name, Manager Name, Baðlý Personel sayýsý
/*
 select d.department_name as DEPARTMENT, e2.first_name as MANAGER, E.Employee_Id as EMPLOYEES
    from departments d, employees e, employees e2
    where e2.employee_id= d.manager_id
    and e.department_id=d.department_id
    group by d.department_name, e2.first_name,  E.Employee_Id;
    
*/

SELECT  d.department_name as Department,e.MANAGER_ID MANAGER, COUNT(*) FROM EMPLOYEES e, DEPARTMENTS d 
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID  
GROUP BY e.MANAGER_ID,d.department_name;

--2. Department Name, Yýllýk Toplam Maaþ Gideri

select d.department_name, sum(e.Salary)*12 as Yýllýk_Maas
from departments d, employees e
where d.department_Id=e.department_Id
group by d.department_Name;

--3. Location, Max Maaþ, Avg Maaþ

   select l.city , J.max_salary, round(avg(e.salary),1) as MAAS
    from locations l, employees e, jobs j, departments d
    where l.location_id = d.location_id
    and d.department_id= e.department_id
    and e.job_id= j.job_id
    group by l.city , J.max_salary;
    

--4. Department, Job Title ve Avg Maaþ

select d.department_name, j.job_title,  round(avg(e.salary),1) as MAAS
from departments d, jobs j, employees e
where d.department_Id= e.department_id and e.job_id= j.job_id
group by d.department_name, j.job_title;