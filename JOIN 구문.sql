CREATE DATABASE shopdb;
USE shopdb;

DROP TABLE userTBL;
DROP TABLE buyTBL;
CREATE TABLE userTBL(
	username CHAR(3) NOT NULL,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile CHAR(10) NOT NULL,
    PRIMARY KEY(username)
);
-- 전화번호 형식을 01012341234에서 010-1234-1234 형식으로 수정하기 위함
ALTER TABLE userTBL modify mobile VARCHAR(13);

CREATE TABLE buyTBL(
	username CHAR(3) NOT NULL,
    prodName CHAR(3) NOT NULL,
    price INT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY(username) references userTBL(username)
);

insert into userTBL values('이승기', 1987, '서울', '010-1234-1234');
insert into userTBL values('홍길동', 1911, '부산', '010-2222-3333');
insert into userTBL values('이순신', 1999, '대구', '010-3333-4444');

insert into buyTBL values('이승기', '운동화', 50, 1);
insert into buyTBL values('이승기', '노트북', 150, 1);
insert into buyTBL values('홍길동', '책', 10, 5);
insert into buyTBL values('홍길동', '모니터', 200, 2);
insert into buyTBL values('이순신', '청바지', 40, 1);
insert into buyTBL values('이순신', '책', 10, 3);

-- 에러 발생
-- 부모 테이블 현재 userTBL에 야스오는 없는 사람이기 때문에 존재할 수 없다.
INSERT INTO buyTBL VALUES('야스오', '책', 10, 3);


SELECT * FROM userTBL;
SELECT * FROM buyTBL;
-- JOIN구문 작성
-- inner join
-- id값이 서로 중복되는 값만 나타남
SELECT *
FROM userTBL
INNER JOIN buyTBL
ON userTBL.username = buyTBL.username;

-- left join
-- userTBL 전체와 userTBL과 겹치는 buyTBL 결과를 리턴
SELECT *
FROM userTBL
LEFT JOIN buyTBL
ON userTBL.username = buyTBL.username;

SELECT *
FROM userTBL;

-- 야스오 회원 가입합
INSERT INTO userTBL(username, birthYear, addr, mobile)
VALUES('야스오', 2020, '부산', '010-1234-1234');

-- userTBL 중에서 buyTBL과 겹치고 NULL이 아닌 것
SELECT *
FROM userTBL
LEFT JOIN buyTBL
ON userTBL.username = buyTBL.username
WHERE buyTBL.username IS NOT NULL;

-- AS(별칭) 사용해서 다시 inner join
-- userTBL을 U로 부르겠다고 별칭 정함
SELECT *
FROM userTBL AS U
INNER JOIN buyTBL AS B
ON U.username = B.username;

-- LEFT JOIN 기준 테이블 선정
-- 기준 테이블 선정에 따라 결과집합이 다를 수 있다.
-- 기준 테이블 선정 기준은 작은 데이터를 기준으로 하는 것이 좋다.
SELECT *
FROM buyTBL AS b
LEFT JOIN userTBL AS u
ON b.username = u.username;

-- right join
SELECT u.username, b.prodName, b.price, b.amount
FROM userTBL AS u
RIGHT JOIN buyTBL AS b
ON u.username = b.username;

-- 연산자 사용해보기
SELECT u.username, b.prodName, b.price, b.amount, (b.price * b.amount) AS 'sum'
FROM userTBL AS u
RIGHT JOIN buyTBL AS b
ON u.username = b.username;


SELECT u.username, b.prodName
FROM userTBL AS u
LEFT JOIN buyTBL AS b
ON u.username = b.username;
 
/*
INNER JOIN, LEFT JOIN, RIGHT JOIN 문제 만들어 보고 쿼리를 출력해주세요 

1. 성이 이씨이면서 태어난 년도가 1999년인 구매한 아이템 정보를 표시해주세요!
2. 기준 테이블은 userTBL로 하고 LEFT JOIN을 사용하여 주문자 이름과, 주소, 전화번호, 상품 이름, 가격, 주문 수량 을 출력해보자 (단, 주문 정보가 없는 경우 출력하지 않는다.)
3. LEFT JOIN 을 사용하여 NULL 값도 확인할 수 있게 출력 
4. userTBL 기준으로 INNER JOIN하고 buyTBL에서 수량이 3개 이상인 데이터만 조회해라
5. buyTBL 기준으로 RIGHT JOIN하고 username이 '이승기'이거나 '야스오'이면서 userTBL의 username이 null이 아닌 데이터를 조회해라
6. 기준 테이블로 buyTBL을 사용해서 LEFT JOIN을 수행하고, 1999년에 태어난 사람은 총 몇 개의 물품을 구매했는지 구하시오.
7. 기준 테이블로 userTBL을 사용해서 INNER JOIN을 수행하고, '책'을 구매한 사람들의 이름과 전화번호를 출력하시오.
8. 기준 테이블로 buyTBL을 사용해서 RIGHT JOIN을 수행하고, '대구'에 사는 사람이 구매한 물품들을 출력하시오.
*/

-- 성이 이씨이면서 태어난 년도가 1999년인 사람의 구매한 아이템 정보와 총 구입 금액
SELECT prodName (b.price * b.amount) AS '총 구입 금액'
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.username = b.username;
