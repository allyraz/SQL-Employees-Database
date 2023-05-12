# Creating Stored Procedure for Querying Employee

drop procedure if exists 'employee_details'

delimiter $$
create procedure employee_details(in p_emp_no integer)
begin	
		select a. emp_no, a.first_name, a.last_name, b.dept_no, c.dept_name,  d.title, b.from_date, b.to_date, count(d.title) AS num_of_employees
		from employees a
			join dept_emp b on a.emp_no = b.emp_no
			join departments c on c.dept_no = b.dept_no
			join titles d on a.emp_no = d.emp_no
		where a.emp_no = p.emp_no
		group by a. emp_no, a.first_name, a.last_name, b.dept_no, c.dept_name,  d.title, b.from_date, b.to_date;
end$$
delimiter ;