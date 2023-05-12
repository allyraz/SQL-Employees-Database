## Cleaning and Summarizing Data

# Checking for duplicates in employees table

select *, count(*)
from employees
group by emp_no, first_name, last_name, gender, hire_date
Having count(*)>1;
-- No Duplicates found

# Checking for duplicates with same name
select *, count(*)
from employees
group by first_name, last_name
Having count(*)>1;
-- 19683 have same first name and last name

# Exploring details of the duplicated names
select *
from employees
where first_name='Hugo' and last_name='Rosis';
-- assume these are different people with same names since their birthdates are different

# Checking for duplicates with same name and birthdates
select *, count(*)
from employees
group by first_name, last_name, birth_date
Having count(*)>1;
-- 6 ppl have same first_name, last_name and birth_date

# Checking for duplicates with same name and birthdates. Workaround by manually input emp_no
select *
from employees
where emp_no in (94844,99791,100278,106602,280722,289866)
#group by emp_no, birth_date, first_name, last_name,gender, hire_date
;

# Individual check on duplicate records. Only hire dates and emp_no is different
select *
from employees
where (first_name='Shim' and last_name='Gide')
		or (first_name='Sarita' and last_name='Ghalwash')
        or (first_name='Holgard' and last_name='Negoita')
        or (first_name='Tonny' and last_name='Cromarty')
order by last_name
		;

# Checking for duplicates in the departments table
select *, count(*)
from departments
group by dept_no, dept_name
having count(*)>1;
-- No Duplicates

# Checking for duplicates in the dept_emp table
select *, count(*)
from dept_emp
group by emp_no, dept_no, from_date, to_date
having count(*)>1;
-- No duplicates found

select *, count(*)
from dept_emp
group by emp_no
having count(*)>1
;
-- 31579 have more than 1 dept

# Checking duplicates in dept_manager table
select *, count(*)
from dept_manager
group by emp_no, dept_no, from_date, to_date
having count(*)>1;
-- No duplicates found

# Checking duplicates in emp_manager
select *, count(*)
from emp_manager
group by emp_no, dept_no, manager_no
having count(*)>1;
-- no duplicates found

# Checking salaries table for duplicates
select *, count(*)
from salaries
group by emp_no, salary, from_date, to_date
having count(*)>1;
-- no duplicates found

# Checking titles table for duplicates
select *, count(*)
from titles
group by emp_no, title, from_date, to_date
having count(*)>1;
-- no duplicates found
