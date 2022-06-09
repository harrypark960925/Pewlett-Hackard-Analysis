-- 1) 
select e.emp_no, e.first_name, e.last_name, 
	   t.title, t.from_date, t.to_date 
into retirement_titles from employees as e 
inner join titles as t on e.emp_no = t.emp_no 
where e.birth_date between '1952-01-01' and '1955-12-31'
order by e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
select distinct on (emp_no) emp_no, first_name, last_name, title 
into unique_titles from retirement_titles 
where to_date = '9999-01-01'
order by emp_no,to_date desc;

-- retrieve the number of employees by their most recent job title who are about to retire.
select count(title), title 
into retiring_titles from unique_titles
group by title
order by count(title) desc;


-- 2) 
select distinct on(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
	   de.from_date, de.to_date, t.title
into mentorship_eligibility from employees as e 
inner join dept_emp as de on (e.emp_no = de.emp_no)
inner join titles as t on (e.emp_no = t.emp_no)
where (de.to_date = '9999-01-01') and (e.birth_date between '1965-01-01' and '1965-12-31')
order by e.emp_no;


