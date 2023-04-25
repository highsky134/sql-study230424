CREATE TABLE employees (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    salary NUMBER(8,2)
);

INSERT INTO employees VALUES (1, 'Alice', 5000);
INSERT INTO employees VALUES (2, 'Bob', 6000);
INSERT INTO employees VALUES (3, 'Charlie', 7000);


-- 급여 총합 조회
SELECT sum(salary) FROM EMPLOYEES;

COMMIT; -- 변경사항 완전히 DB에 반영
BEGIN 
	-- 모든 사원들의 급여를 1000씩 올려줄거다	
	UPDATE EMPLOYEES SET salary = SALARY + 1000;

	ROLLBACK;

	SELECT sum(salary) FROM EMPLOYEES;
END;


-- WHERE 조건절

SELECT 
	EMP_NO, EMP_NM, ADDR, SEX_CD 
FROM TB_EMP
WHERE SEX_CD = 2
;

-- where절로 pk 동등 조건을 걸면 무조건 단일행이 조회된다.
SELECT 
	EMP_NO, EMP_NM, ADDR, SEX_CD
FROM TB_EMP
WHERE EMP_NO = 1000000003;


-- 비교 연산자
SELECT 
	EMP_NO, EMP_NM, BIRTH_DE, TEL_NO
FROM TB_EMP
WHERE BIRTH_DE >= '19900101' AND BIRTH_DE <= '19991231'
;


-- BETWEEN
SELECT 
	EMP_NO, EMP_NM, BIRTH_DE, TEL_NO
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19900101' AND '19991231'
;


-- OR 연산
SELECT 
	EMP_NO, EMP_NM, DEPT_CD
FROM TB_EMP
WHERE DEPT_CD = '100004' OR DEPT_CD = '100006';

-- IN 연산자
SELECT 
	EMP_NO, EMP_NM, DEPT_CD
FROM TB_EMP
WHERE DEPT_CD IN ('100004', '100006')
;

-- NOT IN 연산자
SELECT 
	EMP_NO, EMP_NM, DEPT_CD
FROM TB_EMP
WHERE DEPT_CD NOT IN ('100004', '100006')
;


-- LIKE 연산자
-- 검색에서 주로 사용
-- 와일드 카드 매핑 (%: 0글자 이상, _: 딱 1글자);
SELECT 
	EMP_NO, EMP_NM
FROM TB_EMP
WHERE EMP_NM LIKE '%심'
;

SELECT 
	EMP_NO, EMP_NM
FROM TB_EMP
WHERE EMP_NM LIKE '이__'
;

SELECT 
	EMP_NO, EMP_NM, ADDR
FROM TB_EMP
WHERE ADDR LIKE '%용인%'
;

-- 성씨가 김씨이면서, 부서가 100003, 4, 6번 중에 하나이면서, 90년대생인 
SELECT 
	EMP_NO, EMP_NM, BIRTH_DE, DEPT_CD 
FROM TB_EMP
WHERE EMP_NM LIKE '김%' 
	AND DEPT_CD IN ('100003', '100004', '100006') 
	AND BIRTH_DE BETWEEN '19900101' AND '19991231' 
;

-- 실무용: where 1=1로 시작하고 조건에 전부 AND를 붙이고 
SELECT 
	EMP_NO, EMP_NM, BIRTH_DE, DEPT_CD 
FROM TB_EMP
WHERE 1=1
	AND EMP_NM LIKE '김%' 
	AND DEPT_CD IN ('100003', '100004', '100006') 
	AND BIRTH_DE BETWEEN '19900101' AND '19991231' 
;


-- 부정 일치 비교 연산자
SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR ,
	SEX_CD 
FROM TB_EMP
--WHERE SEX_CD != 2
--WHERE SEX_CD ^= 2
WHERE SEX_CD <> 2
;

-- 성별 코드가 1이 아니면서 성씨가 이씨가 아니 사람들의 
SELECT 
	EMP_NO ,
	EMP_NM ,
	SEX_CD 
FROM TB_EMP
WHERE 1=1
	AND SEX_CD <> 1
	AND EMP_NM NOT LIKE '이%'
;

-- null값 조회
-- 반드시 IS NULL 연산자로 조회해야 한다
SELECT 
	EMP_NO ,
	EMP_NM ,
	DIRECT_MANAGER_EMP_NO 
FROM TB_EMP
WHERE DIRECT_MANAGER_EMP_NO IS NULL
						  --IS NOT NULL 
;

-- 연산자 우선순위
-- NOT > AND > OR 
SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE 1=1
	AND EMP_NM LIKE '김%'
	AND (ADDR LIKE '%수원%' OR ADDR LIKE '%일산%')
;
























