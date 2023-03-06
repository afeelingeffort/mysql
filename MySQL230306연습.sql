-- 환자 목록 생성하기
CREATE TABLE patient(
	patient_number INT AUTO_INCREMENT PRIMARY KEY,
    patient_name VARCHAR(30) NOT NULL,
    patient_date DATE NOT NULL,
    disease_name VARCHAR(50) NOT NULL,
    room_number VARCHAR(30) DEFAULT '미정'
);

INSERT INTO patient
(patient_name, patient_date, disease_name, room_number)
VALUES
	('이이이', '2023-01-01', '당뇨', '301호'),
    ('박박박', '2023-05-23', '요로결석', '301호'),
    ('최최최', '2023-03-24', '폐암', '302호'),
    ('김김김', '2022-03-02', '아', DEFAULT);
SELECT * FROM patient;
DELETE FROM patient WHERE patient_name='이이이';
DELETE FROM patient;

-- 이미 생성된 테이블 제약사항 변경하기 
DESC patient;
ALTER TABLE patient MODIFY disease_name VARCHAR(30) NULL;

-- patient_date의 제약사항을 default로 하고 빈 문자열 넣기
-- DATE는 DEFAULT가 안되나보다.
ALTER TABLE patient MODIFY patient_date DATE DEFAULT '';
ALTER TABLE patient MODIFY disease_name VARCHAR(30) DEFAULT '';

-- DROP TABLE patient;