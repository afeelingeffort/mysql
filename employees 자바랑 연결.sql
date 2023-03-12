SELECT * FROM titles;

-- Staff --> 결과집합으로 Staff 직원에 이력을 결과 집합으로 만들기

-- 1단계
SELECT *
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.title = 'Staff'
ORDER BY e.emp_no
limit 10;

-- 2단계
SELECT e.emp_no, e.first_name, e.last_name, t.title
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.title = 'Staff'
ORDER BY e.emp_no
limit 10;

DESC employees;

USE employees;
SELECT * FROM salaries;
SELECT * FROM employees;


