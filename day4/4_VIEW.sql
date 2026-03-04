SELECT * FROM STUDENT;
SELECT * FROM ENROL;
SELECT * FROM SUBJECT;


-- VIEW  --> 자주 사용하는 쿼리를 뷰로 저장한 뒤 빼서 사용가능한것.
-- > 복잡한 쿼리를 단순하게 만듦
-- 학번, 이름, 학과, 점수, 과목명
CREATE OR REPLACE VIEW  STUDENT_VIEW AS
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_DEPT = '기계'
WITH READ ONLY;

SELECT * FROM
STUDENT_VIEW;

SELECT *
FROM EMP;

-- 보안적인 이유로 필요한 정보만 제공할 때 사용가능.
CREATE OR REPLACE VIEW EMP_VIEW AS
SELECT EMPNO, ENAME, HIREDATE
FROM EMP;

SELECT *
FROM EMP_VIEW;

-- VIEW 에서 수정 가능 한 경우
-- 1. 하나의 테이블만 참조 할때.(조인이 없을 때)
-- 2. GROUP 함수 없을 때
-- 3. DISTINCT 가 없을 때(중복)
-- 4. ** 읽기 전용 옵션이 없을 때 **
-- -> VIEW를 만들 때는 읽기 전용 옵션을 붙여주는 게 좋다.


