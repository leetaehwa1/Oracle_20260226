-- 조건 처리
-- NVL : NULL 값에 대한 처리

SELECT NAME, PAY, BONUS, PAY+BONUS
FROM PROFESSOR;

SELECT NAME, PAY, NVL(BONUS, 0), PAY+NVL(BONUS,0)
FROM PROFESSOR;

SELECT NAME ,BONUS, NVL2(BONUS, 10000, 0)
FROM PROFESSOR;

-- DECODE : 자바의 조건문(IF)
-- DECODE(컬럼명, '조건값', '조건이랑 같을 때 출력', '조건이랑 다를 때 출력')
-- DECODE(컬럼명, '조건값1', '조건이랑 같을 때 출력', '조건이랑 다를 때 출력')

SELECT  
    NAME,
    DECODE(GRADE, 4, '졸업반', GRADE || '학년') 상태 , 
    DECODE(GRADE, 4, '졸업반', '3', '고학년', '저학년')
FROM STU; 

-- CASE ~ WHER : DECODE 보다 좀 더 복잡한 IF 가독성 있게 처리 가능

SELECT 
    SAL,
    CASE
        WHEN SAL > 4000 THEN '고소득'
        WHEN SAL BETWEEN 2000 AND 4000 THEN '적당히 받음'
        ELSE '화이팅'
    END 급여정보
FROM EMP


