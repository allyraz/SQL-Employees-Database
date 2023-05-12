# Number of active employees by year
select year_date,
       (select count(*)
        from dept_emp
        where year(from_date) <= year_date and
              (year(to_date) >= year_date)) AS active_employees
from (select year(from_date) as year_date
	from dept_emp de
	group by year_date
     ) as y
order by year_date;

# Find Current active employees post 2022 since the above code queries year_date from from_date which does not include the max_date
select max(to_date) as year_date,
		count(a.emp_no) AS active_employees
from employees a
	    join dept_emp b on a.emp_no = b.emp_no
where b.to_date = (select max(b.to_date)
					from dept_emp b);

#Union both data for active employees
(select year_date,
       (select count(*)
        from dept_emp
        where year(from_date) <= year_date and
              (year(to_date) >= year_date)) AS active_employees
from (select year(from_date) as year_date
	from dept_emp de
	group by year_date
     ) as y
order by year_date)
union
# Find Current active post 2022
(select year(max(to_date)) as year_date,
		count(a.emp_no) AS active_employees
from employees a
	    join dept_emp b on a.emp_no = b.emp_no
where b.to_date = (select max(b.to_date)
					from dept_emp b));
