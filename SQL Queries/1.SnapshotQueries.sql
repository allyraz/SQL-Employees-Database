#checking number of records
select count(*)
from employees
union
select count(*)
from dept_manager
union
select count(*)
from dept_emp
union
select count(*)
from departments
union
select count(*)
from salaries
union
select count(*)
from titles
;

# Finding the number of hires in a year
SELECT 
    YEAR(hire_date) AS year_date,
    COUNT(emp_no) AS num_of_employees_dept
FROM
    employees
GROUP BY year_date;
