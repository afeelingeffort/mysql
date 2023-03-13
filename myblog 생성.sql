USE mydb;
SELECT * FROM `order`;
USE myblog;

-- user 테이블 생성
-- id : pk 부여
-- username : 사용자 이름 100자 NOT NULL, 중복 허용 불가(UNIQUE)
-- password : 100자 NOT NULL, 
-- email : 100자 NOT NULL,
-- address : 100자 
-- userRole : ADMIN, MANAGER, USER 
-- createDate 
CREATE TABLE user(
	id int PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    userRole VARCHAR(20), 
    createDate TIMESTAMP
);
SELECT * FROM user;

-- 블로그 사이트 
CREATE TABLE board(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content BLOB,
    readCount INT DEFAULT 0,
    userId INT, 
    FOREIGN KEY(userId) REFERENCES user(id)
);
SELECT * FROM board;

-- 댓글 테이블 만들기
CREATE TABLE reply(
	id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(300) NOT NULL,
    createDate TIMESTAMP, 
    boardId INT,
    userId INT,
    FOREIGN KEY(boardId) REFERENCES board(id),
    FOREIGN KEY(userId) REFERENCES user(id)
);
SELECT * FROM reply;

-- user : board -> 1 : N
-- user : reply -> 1 : N
-- board : reply -> 1 : N

SELECT now();

INSERT INTO user(username, password, email, address, userRole, createDate)
	VALUES('홍길동', '1234', 'a@naver.com', '부산시 중구', 'USER', now());
    
INSERT INTO user(username, password, email, address)
	VALUES('하이', '7777', 'd@naver.com', '부산시');
    
SELECT * FROM user;
SELECT * FROM board;

ALTER TABLE board MODIFY content text;

INSERT INTO board(title, content, userId)
	VALUES('첫번째 게시글', '자바는 어려워요', 3);

-- username과 password가 일치하는 사용자 찾아보기
SELECT * 
FROM user
WHERE username = '홍길동' 
	AND password = '12345';
    
SELECT * FROM board;

DELETE FROM board
WHERE id = 2;

