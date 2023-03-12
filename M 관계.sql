USE shopdb;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL
);

CREATE TABLE subject(
	subject_id INT PRIMARY KEY,
    name VARCHAR(5) NOT NULL,
    professor VARCHAR(50) NOT NULL
);

-- 학생 : 수강 테이블의 관계는 1 : N
-- 과목 : 수강 테이블의 관계는 1 : N
CREATE TABLE enrollment(
	enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY(student_id) REFERENCES student(student_id),
    FOREIGN KEY(subject_id) REFERENCES subject(subject_id)
);

-- 한 사람이 여러 개의 도시에서 여러 번 여행을 다녀온 경우를 테이블로 구축해보세요.
-- 여기서 사람, 도시에 관계를 관계차수 표현해보세요
-- 도시 <-- 방문한 사람의 이력 저장 가능 
-- 한 사람이 여러 도시를 방문하고, 한 도시에 여러 사람이 방문을 한다.
-- person, city, travel

USE shopdb;

CREATE TABLE person(
	person_id INT PRIMARY KEY,
    person_name VARCHAR(5) NOT NULL
);

CREATE TABLE city(
	city_id INT PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);

DROP TABLE travel;
-- 중간테이블 만들기
CREATE TABLE travel(
	-- id INT PRIMARY KEY,
	person_id INT NOT NULL,
    city_id INT NOT NULL,
    trip_date DATE,
    PRIMARY KEY(person_id, city_id, trip_date),
    FOREIGN KEY(person_id) REFERENCES person(person_id),
    FOREIGN KEY(city_id) REFERENCES city(city_id)
);

DESC travel;

INSERT INTO person VALUES
	(1, '김영희'),
    (2, '박철수'),
    (3, '이민호'),
    (4, '한지민'),
    (5, '송혜교');
    
INSERT INTO city VALUES
	(1, '서울'),
    (2, '부산'),
    (3, '제주'),
    (4, '홍콩'),
    (5, '도쿄');    

INSERT INTO travel VALUES
	(1, 1, '2022-07-10'),
    (1, 2, '2022-07-10'),
    (2, 5, '2022-07-10'),
    (2, 4, '2022-07-10'),
    (3, 3, '2022-07-10'),
    (4, 5, '2022-07-10'),
    (1, 4, '2022-07-10');
    
SELECT * FROM travel;
SELECT * FROM person;
-- 문제 join 구문을 활용해서 문제
-- INNER JOIN을 이용하여 성이 김씨인 사람이 여행 간 곳을 조회
SELECT c.city_name
FROM travel AS t 
INNER JOIN person AS p
ON t.person_id = p.person_id 
INNER JOIN city AS c
ON t.city_id = c.city_id
WHERE p.person_name LIKE('김%');


SELECT  *
FROM person ;

SELECT c.city_name, p.person_name, t.trip_date
FROM travel AS t 
INNER JOIN person AS p
ON t.person_id = p.person_id 
INNER JOIN city AS c
ON t.city_id = c.city_id
WHERE p.person_name LIKE('김%') AND t.trip_date;

-- LEFT JOIN을 이용하여 person을 기준테이블로 도쿄에 간 사람의 이름을 조회
SELECT p.person_name
FROM person AS p
LEFT JOIN travel AS t
ON p.person_id = t.person_id
LEFT JOIN city AS c
ON t.city_id = c.city_id
WHERE c.city_id = '도쿄';

SELECT p.person_name
FROM travel AS t
LEFT JOIN city AS c
ON t.person_id = c.city_id
LEFT JOIN person AS p
ON p.person_id = t.person_id
WHERE c.city_name='도쿄';

-- 중복되는 컬럼명을 빼고 city_id가 4번이거나 5번인 데이터 LEFT JOIN
SELECT t.person_id, t.city_id, t.date, p.name, c.name
FROM travel AS t
LEFT JOIN person AS p
ON t.person_id = p.person_id
LEFT JOIN city AS c
ON t.city_id = c.city_id
WHERE t.city_id IN(4, 5);

-- 고객, 주문 목록 --> 1 : N
-- 홍길동 --> 신발, 
--      --> 컴퓨터,

-- 고객, 상품정보, 주문목록 --> N : M --> 중간테이블 : 주문목록
-- 주문 -- 1(홍길동), 1(신발), "일자"

-- 테이블 설계 
-- 고객, 상품, 주문 목록

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE product;
DROP TABLE customer;

CREATE TABLE customer(
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL
);

CREATE TABLE product(
	product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL
);

CREATE TABLE orderList(
	customer_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATE,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(product_id) REFERENCES product(product_id)
);

USE mydb;

SELECT * FROM usertbl;





