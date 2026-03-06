-- 트리거
-- 특정 테이블(선택한 테이블)에 변화가 생겼을 때(INSERT, DELETE, UPDATE)
-- 실행되는 프로시저
CREATE OR REPLACE TRIGGER TEST_TRIGGER
    --BEFORE | AFTER
--트리거 실행 시점(BEFORE OR AFTER)
-- AFTER 는 로그 기록용으로, BEFORE 는 INSERT 등 쿼리를 제어하는 역할.
    BEFORE
    INSERT OR UPDATE ON EMP -- EMP 테이블에 레코드가 INSERT 혹은 UPDATE 될 때 실행.
    FOR EACH ROW -- 여러 개의 행에 영향을 준다면 그 개수만큼 트리거 실행
                 -- (EX, UPDATE로 3개 행에 영향을 주었다면 트리거도 3번 실행)
    
BEGIN
        DBMS_OUTPUT.PUT_LINE('변경 전: ' || :OLD.SAL);
        DBMS_OUTPUT.PUT_LINE('변경 후: ' || :NEW.SAL);

END;
/

SELECT *FROM EMP;
UPDATE EMP
SET SAL = 1250
    WHERE EMPNO = 7521;

  