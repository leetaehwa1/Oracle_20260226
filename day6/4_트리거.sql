--ENROL 테이블 트리거 만들기

--조건 1. 테이블명은 ENROL_LOG
 --      컬럼은 과목번호, 학생번호, 수정전시험점수, 수정후시험점수, 작업자ID, 작업종류, 작업날짜
--조건 2. INSERT할 경우 ENROL_LOG에 해당 내용 자동 저장
 --      단, 시험점수가 0~100사이가 아니면 0으로 저장 후
--조건 3. UPDATE할 경우 ENROL_LOG에 해당 내용 자동 저장
  --     단, 시험점수가 0~100사이가 아니면 에러를 띄운 후 종료
--조건 4. DELETE할 경우 에러를 띄운 후 종료

CREATE TABLE ENROL_LOG (
    L_SUBNO CHAR(3),
    L_STUNO CHAR(8),
    O_GRADE NUMBER,
    N_GRADE NUMBER,
    L_USERID VARCHAR2(30),
    EVENT VARCHAR2(10                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ),
    L_TIME DATE
);
DROP TABLE ENROL_LOG;
SELECT *FROM ENROL;
SELECT * FROM
ENROL_LOG;

SELECT * FROM
ENROL_LOG;

CREATE OR REPLACE TRIGGER ENROL_TRG
    BEFORE
    INSERT OR UPDATE OR DELETE ON ENROL
    FOR EACH ROW
BEGIN
-- SYS_CONTEXT('USERENV', 'SESSION_USER') 
--현재 아이디를 가져오는 문법

    IF INSERTING THEN
        IF :NEW.ENR_GRADE < 0 OR :NEW.ENR_GRADE >100 THEN 
            :NEW.ENR_GRADE :=0;
            END IF;
            INSERT INTO ENROL_LOG
            VALUES(:NEW.SUB_NO, :NEW.STU_NO, :NEW.ENR_GRADE, :NEW.ENR_GRADE ,SYS_CONTEXT('USERENV', 'SESSION_USER'), 'I', SYSDATE);
    ELSIF UPDATING THEN
    IF :NEW.ENR_GRADE < 0 OR :NEW.ENR_GRADE >100 THEN 
            RAISE_APPLICATION_ERROR(-20010, '성적을 제대로 입력해주세요');
            END IF;
        INSERT INTO ENROL_LOG
        VALUES(:NEW.SUB_NO, :NEW.STU_NO, :OLD.ENR_GRADE, :NEW.ENR_GRADE ,SYS_CONTEXT('USERENV', 'SESSION_USER'), 'U', SYSDATE);
    ELSIF DELETING THEN
        -- INSERT INTO EMP_LOG
        --VALUES(:OLD.EMPNO, :OLD.MGR, :OLD.SAL, :OLD.SAL, :OLD.COMM, SYS_CONTEXT('USERENV', 'SESSION_USER'), 'D', SYSDATE);
        RAISE_APPLICATION_ERROR(-20009, '학생의 성적은 삭제할 수 없습니다.');
    
    END IF;
END;
/
SELECT * FROM
ENROL_LOG;
SELECT * FROM ENROL;
INSERT INTO ENROL
VALUES('101','20142021',200);
COMMIT;
UPDATE ENROL
SET
    ENR_GRADE = 90
WHERE STU_NO = '20142021';
