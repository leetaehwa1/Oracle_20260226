SELECT * FROM BOOK;
SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS;

SELECT 
    BOOKNAME, PUBLISHER
FROM BOOK
WHERE PRICE >= 10000

UNION

SELECT 
    BOOKNAME, PUBLISHER
FROM BOOK
WHERE PUBLISHER = '굿스포츠'
ORDER BY BOOKNAME
;

-- 날짜별 수익
-- 날짜와 해당 시기의 판매가격 출력
SELECT 
    TO_CHAR(ORDERDATE,'YYYY-MM-DD') 날짜,
    SUM(SALEPRICE) SUM_SALEPRICE, 
    1 AS ORDERKEY
FROM ORDERS
GROUP BY TO_CHAR(ORDERDATE,'YYYY-MM-DD')

UNION

SELECT '매출총액', 
    SUM(SALEPRICE), 
    2 AS ORDERKEY
FROM ORDERS 
ORDER BY ORDERKEY, SUM_SALEPRICE DESC
;

SELECT 날짜,SUM_SALEPRICE
FROM (
    SELECT 
        TO_CHAR(ORDERDATE,'YYYY-MM-DD') 날짜,
        SUM(SALEPRICE) SUM_SALEPRICE, 
        1 AS ORDERKEY
    FROM ORDERS
    GROUP BY TO_CHAR(ORDERDATE,'YYYY-MM-DD')
    
    UNION
    
    SELECT '매출총액', 
        SUM(SALEPRICE), 
        2 AS ORDERKEY
    FROM ORDERS 
    ORDER BY ORDERKEY, SUM_SALEPRICE DESC

);

-- 책 가격이 가장 높은 상위 3 개의 책이름, 가격 출력
SELECT BOOKNAME, PRICE
FROM BOOK
ORDER BY PRICE DESC
;

SELECT BOOKNAME,PRICE
FROM(
    SELECT *
    FROM BOOK
    ORDER BY PRICE DESC
)WHERE ROWNUM <=3
;

SELECT *
FROM BOOK
WHERE BOOKNAME LIKE '%축구%';
--%축구 -> 무조건 축구로 끝나야함
--축구% -> 무조건 축구로 시작해야함
-- %축구% -> 앞뒤로 뭐가 오든 상관없음


-- CASE ~WHEN
-- 날짜별 매출
-- 날짜, 해당 날짜의 매출, 매출이 20000 이상일 경우 '상'
-- 10000 이상일 경우 '중' ,그 외는 '하'로 표기

SELECT 
    SAL,
    CASE
        WHEN SAL > 4000 THEN '고소득'
        WHEN SAL BETWEEN 2000 AND 4000 THEN '적당히 받음'
        ELSE '화이팅'
    END 급여정보
FROM EMP;

SELECT 
    ORDERDATE,
    SUM(SALEPRICE),
    CASE
        WHEN SUM(SALEPRICE) >= 20000 THEN '상'
        WHEN SUM(SALEPRICE) >= 10000 THEN '중'
        ELSE '하'
        END 등급
FROM ORDERS
GROUP BY ORDERDATE;






