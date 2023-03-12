SELECT * FROM employees LIMIT 100;

-- 1
SELECT * 
FROM employees 
GROUP BY gender;

-- 2
SELECT *, COUNT(*)
FROM employees
GROUP BY gender;

-- 조건 두 개 걸기
SELECT *, COUNT(hire_date)
FROM employees
GROUP BY hire_date, gender;

-- ----------------------------
-- 풀 네임을 받아 직원에 연봉 받은 횟수를 반환하는 기능을 만들어주세요
SELECT *, COUNT(salary)
FROM salaries
GROUP BY salary;

SELECT * FROM salaries;

SELECT * FROM departments;

SELECT * , count(e.emp_no) AS count
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no
WHERE first_name = 'Georgi' AND last_name = 'Facello' AND birth_date ='1953-09-02';

-- ---------------------
SELECT * 
FROM employees
LIMIT 100;

-- employees(1) : dept_emp(N)
SELECT *
FROM dept_emp
LIMIT 100;

-- dept_emp(N) : (1)
SELECT * 
FROM departments;

-- employees : departments --> N : M 관계 차수를 가진다.
-- 중간 테이블 dept_emp 만들어서 N : M 를 표현하고 있다.

-- employees : dept_emp의 관계는 1 : N 관계로 풀어진다.
-- departments : dept_emp의 관계는 1 : N 관계로 풀어진다.

-- 1단계 - 조인
SELECT *
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no;

-- 2단계 - 중복컬럼 제거
-- DISTINCT 확인
SELECT *
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no;



SELECT * FROM departments;

-- 3단계 
SELECT e.emp_no, e.first_name, d.dept_no, dp.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no;

-- 4단계 - 사용방법 연습
SELECT e.emp_no, e.first_name, d.dept_no, dp.dept_name
FROM employees AS e 
LEFT JOIN dept_emp AS d -- dept_emp 중간 테이블
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp -- employees랑 departments를 dept_emp를 이용해서 연결시켜주려는 거임?
ON d.dept_no = dp.dept_no
GROUP BY dept_no
HAVING dept_no = 'd001';

SELECT * FROM dept_emp;