CREATE TABLE member(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(100) NOT NULL
);

INSERT INTO member (name, email, phone, address)
VALUES 
('홍길동', 'hong@test.com', '010-1234-5678', '서울시 강남구'),
('김영희', 'kim@test.com', '010-2345-6789', '서울시 서초구'),
('이철수', 'lee@test.com', '010-3456-7890', '서울시 종로구'),
('박민지', 'park@test.com', '010-4567-8901', '서울시 마포구'),
('최재영', 'choi@test.com', '010-5678-9012', '서울시 강서구'),
('강영식', 'kang@test.com', '010-6789-0123', '서울시 송파구');

SELECT * FROM member;

UPDATE member
SET address = '서울시 중구'
WHERE name = '이철수';

-- UNIQUE 제약 > 고유한 값을 가지도록 강제하는 조건 
INSERT INTO member (name, email, phone, address)
VALUES 
('홍길동2', 'hong@test.com', '010-1234-5678', '서울시 강남구');

-- id가 2인 회원의 이름과 전화번호를 각각 '임성준', '010-9876-5432'로 수정
UPDATE member
SET name = '임성준', phone = '010-9876-5432'
WHERE id = 2;

-- id가 5인 회원의 이메일과 주소를 각각 'leejaehyun@test.com', '서울시 강서구'로 수정
UPDATE member
SET email = 'leejaehyun@test.com', address = '서울시 강서구'
WHERE id = 5;

CREATE TABLE movie (
	id INT PRIMARY KEY,
    title VARCHAR(10) NOT NULL,
    director VARCHAR(5) NOT NULL,
    realse_date DATE NOT NULL,
    genre VARCHAR(5) NOT NULL,
    rating DECIMAL(3, 2) NOT NULL
);

-- DROP TABLE movie;

INSERT INTO movie(id, title, director, realease_date, genre, rating)
	VALUES
    (1, '괴물', '봉준호', '2006-07-27', '드라마', 8.28),
    (2, '극한직업', '이병헌', '2019-01-23', '코미디', 9.20),
    (3, '명량', '김한민', '2006-07-27', '드라마', 9.17),
    (4, '신과함께-죄와 벌', '김용화', '2006-07-27', '드라마', 7.56),
    (5, '밀양', '임권택', '2006-07-27', '드라마', 7.76),
    (6, '반도', '연상호', '2006-07-27', '드라마', 6.71),
    (7, '베테랑', '류승완', '2006-07-27', '드라마', 8.49);
	
    