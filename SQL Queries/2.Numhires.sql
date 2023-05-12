# Finding the number of hires in a year
SELECT 
    YEAR(hire_date) AS year_date,
    COUNT(emp_no) AS num_of_employees_dept
FROM
    employees
GROUP BY year_date;
