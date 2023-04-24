
-- 테이블(엔터티) 생성
-- 성적정보 저장 테이블

CREATE TABLE tbl_score (
	name varchar2(4) NOT NULL,
	kor NUMBER(3) NOT NULL CHECK(kor > 0 AND kor <= 100),
	eng NUMBER(3) NOT NULL CHECK(eng > 0 AND eng <= 100),
	math NUMBER(3) NOT NULL CHECK(math > 0 AND math <= 100),
	total NUMBER(3) NULL,
	average NUMBER(5, 2),
	grade char(1),
	stu_num NUMBER(6),	
	--PK 거는법
	CONSTRAINT pk_stu_num
	PRIMARY KEY (stu_num)	
);

-- 테이블 생성 후 PK 적용하기
ALTER TABLE tbl_score
ADD CONSTRAINT pk_stu_num
	PRIMARY KEY (stu_num);

-- 컬럼 추가하기
ALTER TABLE 
	TBL_SCORE
ADD (sci NUMBER(3) NOT NULL CHECK(sci > 0 AND sci <= 100));

-- 컬럼 제거하기
ALTER TABLE
	TBL_SCORE
DROP COLUMN sci;

-- 테이블 복사 (tb_emp)
-- CTAS
CREATE TABLE tb_emp_copy 
AS SELECT * FROM tb_emp;

-- 복사 테이블 조회
SELECT * FROM tb_emp_copy;

-- drop table
DROP TABLE TB_EMP_COPY;

-- truncate table 
-- 구조는 냅두고 내부 데이터만 전체 삭제
TRUNCATE TABLE TB_EMP_COPY; 



-- 예시 테이블
CREATE TABLE goods (
	id NUMBER(6) PRIMARY KEY,
	g_name varchar(20) NOT NULL,
	price NUMBER(10) DEFAULT 1000,
	reg_date DATE	
);

DROP TABLE goods;


-- INSERT
INSERT INTO goods
	(id, g_name, price, reg_date)
VALUES (1, '선풍기', '120000', sysdate);

INSERT INTO goods
	(id, g_name, reg_date)
VALUES (2, '달고나', sysdate);


--INSERT INTO goods
--	(id, g_name, price)
--VALUES
---- 다중 컬럼 삽입 가능
--	(5, '후라보노2', 1500),
--	(6, '후라보노3', 2500),
--	(7, '후라보노4', 3500)
--;

-- 컬럼명 생략시 모든 컬럼에 대해 순서대로 넣어야 함.
INSERT INTO goods
VALUES (4, '세탁기', 10000, sysdate);


UPDATE goods 
SET g_name = '냉장고'
WHERE id = 3;

UPDATE goods
SET g_name = '콜라', price = 3000
WHERE id = 2;

-- 테이블의 모든 내용 변경
UPDATE goods 
SET price = 9999;

UPDATE tbl_user
SET age = age + 1
;

UPDATE goods
SET price = NULL
WHERE id = 3;


-- 행을 삭제 DELETE 
DELETE FROM goods
WHERE id = 3;

-- 모든 행 삭제: where절 없는 delete 
DELETE FROM goods

SELECT * FROM goods;

-- SELECT 조회
SELECT 
	CERTI_CD 
	, CERTI_NM 
	, ISSUE_INSTI_NM 
FROM TB_CERTI;

SELECT 
	CERTI_NM 
	, ISSUE_INSTI_NM 
	, CERTI_CD 
FROM TB_CERTI;

-- 중복 제거 distinct
-- 중복 제거 안할시 기본값 / SELECT ALL
SELECT DISTINCT
	ISSUE_INSTI_NM	 
FROM TB_CERTI;

-- 모든 컬럼 조회 / 실무적 측면에서는 사용 x : 순서 문제, 원하는 내용 추가 제거 등
SELECT 
	*
FROM TB_CERTI;


-- SELECT 조회 / EMP_NM이 뭐죠? , ADDR이 뭐죠? -> 별칭 지정
SELECT 
	EMP_NM AS 사원이름,
	ADDR "사원의 거주지 주소" 
FROM TB_EMP; 


-- 문자열 연결하기
SELECT 
	CERTI_NM || '(' || ISSUE_INSTI_NM || ')' "자격증 정보"
FROM TB_CERTI;