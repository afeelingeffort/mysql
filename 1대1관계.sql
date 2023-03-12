USE mydb;

-- member가 있으면 테이블 삭제
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `member`;
DROP TABLE member_grade;
CREATE TABLE `member` (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    address VARCHAR(100)
);

CREATE TABLE member_grade(
	member_id INT PRIMARY KEY,
    grade VARCHAR(10),
    point INT,
    FOREIGN KEY(member_id) REFERENCES member(id)
);

INSERT INTO `member`
VALUES
	(1, '홍길동', 'asdf@fdas@com', '부산시'),
    (2, '홍길도', 'fdas@asdf@com', '서울시'),
    (3, '홍길수', 'asdf@fdas@com', '대전시'),
    (4, '홍길기', 'asdf@fdas@com', '부산시');

SELECT * 
FROM member


SELECT * FROM `member`;

DROP TABLE employee;
DROP TABLE employee_position;
-- 직원 정보와 직위 정보를 저장하는 테이블 설계 1 : 1 관계
CREATE TABLE employee(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE employee_position(
	employee_id INT PRIMARY KEY,
    position VARCHAR(50) NOT NULL,
    dismissal_date DATE,
    FOREIGN KEY(employee_id) REFERENCES employee(id)
);
SELECT * FROM employee;

-- 상품과 상품 상세 정보 1 : 1 관계 설계
DROP TABLE product;

CREATE TABLE product(
	id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INT
);

CREATE TABLE product_detail(
	product_id INT PRIMARY KEY,
    description TEXT,
    FOREIGN KEY(product_id) REFERENCES product(id)
);

SELECT * FROM product;