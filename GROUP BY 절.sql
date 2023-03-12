use employees;

SHOW TABLES;

-- 10번째부터 5개
SELECT * FROM salaries
LIMIT 10, 5;

-- emp_no, dept_no 둘 다 갖고 있는 중간 연결DB
SELECT * FROM dept_emp; 

-- GROUP BY 절에 조건절을 사용할 때는 HAVING 절을 사용
-- 1
SELECT *
FROM salaries
GROUP BY emp_no
HAVING emp_no = 10001;

SELECT * FROM salaries;
-- 2
SELECT *, COUNT(salary)
FROM salaries
GROUP BY emp_no;


-- 3
SELECT *, COUNT(salary) AS count, 
		MAX(salary) AS max, 
        MIN(salary) AS min,
        SUM(salary) AS sum,
        ROUND(AVG(salary), 2) AS avg
FROM salaries
GROUP BY emp_no;

-- 2문제 생성 직접 쿼리 출력
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM employees;
SELECT * FROM titles;
DESC employees;

SELECT *, COUNT(birth_date) AS birth_date
FROM employees
GROUP BY emp_no;

SELECT * FROM titles;
SELECT *, count(title)
FROM titles
WHERE title LIKE('%Staff')
GROUP BY emp_no;

SELECT * FROM titles;
SELECT * FROM salaries;
-- 1. emp_no로 그룹을 나누고 title table에서 title과 salaries table에서 salary를 출력하라. (join 사용)
SELECT s.salary
FROM title AS t
LEFT JOIN salaries AS s
ON t.emp_no = s.emp_no
GROUP BY emp_no;

-- 2. 위에서 출력한값에서 연봉이 65000원 이상인 사람만 출력하라. (몇명인지도 출력)

-- 3. Engineer(시니어, 어시스턴트, 일반 모두 포함)이라는 직책을 가진 사원들의 최고 연봉을 출력해라
SELECT * , MAX(salary)
FROM titles AS t
LEFT JOIN salaries s
ON t.emp_no = s.emp_no
GROUP BY salary
HAVING title = 'Enginner';

SELECT * FROM departments;
-- 4. 각 부서에는 몇 명이 있는지 출력해보자
SELECT *, count(dept_emp)
FROM departments
GROUP BY dept_emp;
-- 5. 각 직급 별로 몇 명이 있는지 출력해보자
