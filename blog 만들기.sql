
-- blog 
-- 서버 프로그램 구현 - MySQL <-- 서버

CREATE DATABASE myblog;
USE myblog;

-- 사용자 생성
CREATE USER 'bloguser'@'%' IDENTIFIED BY '1q2w3e4r5t';

-- 사용자 기본 권한 조회
-- DB를 선택
USE mysql;
SELECT user, HOST FROM user;
-- '%' 어디서든지 접근 가능한 권한 (IP주소 개념)

SELECT * FROM user WHERE user = 'bloguser';

-- 접근 권한 변경
GRANT ALL PRIVILEGES ON *.* TO 'bloguser'@'%';

-- 방금 권한 변경을 즉시 적용하려면 한가지 명령어를 더 해주어야 한다.
FLUSH PRIVILEGES;