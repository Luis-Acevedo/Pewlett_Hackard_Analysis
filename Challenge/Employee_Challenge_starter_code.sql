--Start of Challange 
--Creation of Retirement Titles table
Select e.emp_no, e.first_name, e.last_name,
ti.title, ti.from_date, ti.to_date
INTO retirement_titles
From employees AS e
LEFT JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, 
first_name, 
last_name, 
title
INTO Unique_Titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--Employees by most recent job title about to retire
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;