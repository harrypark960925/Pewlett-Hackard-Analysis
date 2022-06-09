-- retirement eligibility 
select emp_no,first_name,last_name into retirement_info from employees
where (birth_date between '1952-01-01' and '1955-12-31') and (hire_date between '1985-01-01' and '1988-12-31');



-- joining departments and dept_manager tables 
select d.dept_name, dm.emp_no, dm.from_date, dm.to_date 
from departments as d inner join dept_manager as dm
on d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no, ri.first_name, ri.last_name, de.to_date
from retirement_info as ri left join dept_emp as de
on ri.emp_no = de.emp_no;


SELECT ri.emp_no, ri.first_name, ri.last_name, de.to_date into current_emp 
from retirement_info as ri left join dept_emp as de
on ri.emp_no = de.emp_no where de.to_date = '9999-01-01';

select * from current_emp;

-- employees count by department number 
select count(ce.emp_no), de.dept_no 
from current_emp as ce left join dept_emp as de 
on ce.emp_no = de.emp_no
group by de.dept_no order by de.dept_no;

-- employee information 
select e.emp_no, e.first_name, e.last_name, e.gender, s.salary, de.to_date
into emp_info from employees as e 
inner join salaries as s on (e.emp_no = s.emp_no)
inner join dept_emp as de on (e.emp_no = de.emp_no) 
where (birth_date between '1952-01-01' and '1955-12-31') 
and (hire_date between '1985-01-01' and '1988-12-31')
and (de.to_date = '9999-01-01');

-- list of managers per department 
select dm.dept_no, d.dept_name, dm.emp_no, ce.last_name, ce.first_name, dm.from_date, dm.to_date
into manager_info from dept_manager as dm 
inner join departments as d on (dm.dept_no = d.dept_no)
inner join current_emp as ce on (dm.emp_no = ce.emp_no);

-- department retirees 
select ce.emp_no, ce.first_name, ce.last_name, d.dept_name
into dept_info from current_emp as ce 
inner join dept_emp as de on (ce.emp_no = de.emp_no)
inner join departments as d on (de.dept_no = d.dept_no);


-- retirement from sales department and development department 
select e.emp_no,e.first_name,e.last_name, d.dept_name
into retirement_info_sd
from employees as e 
inner join dept_info as di on (e.emp_no = di.emp_no)
inner join departments as d on (di.dept_name = d.dept_name)
where (birth_date between '1952-01-01' and '1955-12-31') and (hire_date between '1985-01-01' and '1988-12-31')
and (di.dept_name = 'Sales' or di.dept_name = 'Development');



