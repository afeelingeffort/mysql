/* 
NOW(), CURDATE(), CURTIME(), 
YEAR(), MONTH(), DAY(), HOUR()*/

SELECT now();
SELECT curdate();

-- String Function
SELECT ASCII('B');

-- 공백 포함 글자수
SELECT char_length('my sql test');
-- 문자열 이어줌
SELECT concat('green' , 'class', '       100%') AS 'title';
-- '->'로 문자열 이어줌
SELECT concat_ws('->', 'class', 'mysql', '홍길동');
-- 공백 있으면 안됨 
SELECT find_in_set('q', 's,q,l');
-- 소수점 몇번째까지 출력
SELECT format(2500.123, 2);
-- 대소문자 변경
SELECT lcase('HELLO WORLD');
SELECT ucase('hello world');
-- 양 끝 공백 제거 trim, replace
SELECT trim('  MY S   QL');
SELECT replace('  MY S   QL', ' ', ''); -- 값에 공백을 빈 공백으로 처리

CREATE TABLE userTBL(
  username char(3) not null, 
  birthYear int not null, 
  addr char(2) not null, 
  mobile char(10) not null,
  primary key(username)
); 
-- 전화번호 형식을 01012341234 에서 010-1234-1234 형식으로 수정하기 위해 스키마 변경  
alter table userTBL modify mobile varchar(13);


DROP TABLE buyTBL;
DROP TABLE userTBL;


CREATE TABLE userTBL(
  username char(3) not null, 
  birthYear int not null, 
  addr char(2) not null, 
  mobile char(13) not null,
  primary key(username)
); 

CREATE TABLE buyTBL(
  username char(3) not null, 
  prodName char(3) not null, 
  price int not null, 
  amount int not null, 
  foreign key(username) references userTBL(username)
);

SELECT * FROM buyTBL;

insert into userTBL values('이승기', 1987, '서울', '010-1234-1234');
insert into userTBL values('홍길동', 1911, '부산', '010-2222-3333');
insert into userTBL values('이순신', 1999, '대구', '010-3333-4444');

insert into buyTBL values('이승기', '운동화', 50, 1);
insert into buyTBL values('이승기', '노트북', 150, 1);
insert into buyTBL values('홍길동', '책', 10, 5);
insert into buyTBL values('홍길동', '모니터', 200, 2);
insert into buyTBL values('이순신', '청바지', 40, 1);
insert into buyTBL values('이순신', '책', 10, 3);

SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES';

-- MySQL Numberic function
SELECT * FROM buyTBL;
SELECT *, sum(price) AS '상품가격에 총합' FROM buyTBL;

-- 표 뒤에 총합계 적어줌
SELECT *, (SELECT sum(price) FROM buyTBL) AS 총합계
FROM buyTBL;

-- avg 평균 값 계산
SELECT *, avg(price) AS '상품평균가격'
FROM buyTBL;

SELECT *, (SELECT avg(price) FROM buyTBL) AS '평균값'
FROM buyTBL;

-- 올림 함수
SELECT ceil(25.12);
-- 반올림 함수
SELECT round(123.56, 1);
-- 버림 함수
SELECT floor(25.75);

SELECT *
FROM buyTBL;

SELECT prodName, min(price)
FROM buyTBL;

SELECT prodName, max(price)
FROM buyTBL;

