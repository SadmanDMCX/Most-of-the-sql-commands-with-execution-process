/* RUN THIS FILE WITH THE BELOW COMMAND */
/* YOU NEED ORACLE DB AND IN YOUR CMD FIRST WRITE SQLPLUS AND AFTER LOGIN PERFORM BELOW OPARATION */
/* SIMPLEY GO TO YOUR CMD AND ENTER BELOW COMMAND */
/* @FOLDER PATH\FILE NAME(HERE, SQLCommandsU1.sql).SQL */

/* SCREEN CLEAR */
CL SCR;

/* DROP STATEMENT */
DROP TABLE EMP_RES;
DROP TABLE EMP_MAIN;

/* CREATE TABLE STATEMENT */
CREATE TABLE EMP_MAIN 
(EM_ID INT NOT NULL PRIMARY KEY, EM_NAME VARCHAR(10) NOT NULL UNIQUE, EM_DEPT VARCHAR(10) DEFAULT 'PERL', EM_DOB DATE NOT NULL, CHECK(EM_ID > 0));

CREATE TABLE EMP_RES
(EM_RES_ID INT NOT NULL PRIMARY KEY, EM_RES_CAR VARCHAR(10) DEFAULT 'LEXUS', EM_R_ID INT, 
 FOREIGN KEY (EM_R_ID) REFERENCES EMP_MAIN(EM_ID) ON DELETE CASCADE);
 
/* DESC STATEMENT */ 
DESC EMP_MAIN;

/* INSERT STATEMENT */
INSERT INTO 
EMP_MAIN (EM_ID, EM_NAME, EM_DEPT, EM_DOB) VALUES (1, 'SAMI', 'HTML', TO_DATE('28/02/1995', 'DD/MM/YYYY'));
INSERT INTO 
EMP_RES (EM_RES_ID, EM_RES_CAR, EM_R_ID) VALUES (1, 'FORD', 1);

INSERT INTO 
EMP_MAIN (EM_ID, EM_NAME, EM_DEPT, EM_DOB) VALUES (2, 'RUBAIYA', 'CSS', TO_DATE('08/11/2000', 'DD/MM/YYYY'));
INSERT INTO 
EMP_RES (EM_RES_ID, EM_RES_CAR, EM_R_ID) VALUES (2, 'TOYOTA', 2);

INSERT INTO 
EMP_MAIN (EM_ID, EM_NAME, EM_DEPT, EM_DOB) VALUES (3, 'RONKIN', 'JS', TO_DATE('13/06/2009', 'DD/MM/YYYY'));
INSERT INTO 
EMP_RES (EM_RES_ID, EM_RES_CAR, EM_R_ID) VALUES (3, 'LOTUS', 3);

INSERT INTO 
EMP_MAIN (EM_ID, EM_NAME, EM_DEPT, EM_DOB) VALUES (4, 'YONAMIRA', 'CSS', TO_DATE('08/11/2000', 'DD/MM/YYYY'));
INSERT INTO 
EMP_RES (EM_RES_ID, EM_RES_CAR, EM_R_ID) VALUES (4, 'TOYOTA', 4);

INSERT INTO 
EMP_MAIN (EM_ID, EM_NAME, EM_DOB) VALUES (5, 'EUROGER', TO_DATE('08/11/2000', 'DD/MM/YYYY'));
INSERT INTO 
EMP_RES (EM_RES_ID, EM_R_ID) VALUES (5, 5);

/* SELECT STATEMENT */
SELECT * FROM EMP_MAIN;
SELECT * FROM EMP_RES;

/* DELETE STATEMENT */
DELETE FROM EMP_MAIN WHERE EM_ID = 2;

SELECT * FROM EMP_MAIN;
SELECT * FROM EMP_RES;

/* INSERT STATEMENT */
INSERT INTO 
EMP_MAIN (EM_ID, EM_NAME, EM_DEPT, EM_DOB) VALUES (2, 'RUBAIYA', 'CSS', TO_DATE('08/11/2000', 'DD/MM/YYYY'));
INSERT INTO 
EMP_RES (EM_RES_ID, EM_RES_CAR, EM_R_ID) VALUES (2, 'TOYOTA', 2);

SELECT * FROM EMP_MAIN;
SELECT * FROM EMP_RES;

/* AND OR STATEMENT */
SELECT * FROM EMP_MAIN WHERE EM_DEPT = 'CSS' AND EM_ID >= 2;
SELECT * FROM EMP_RES WHERE EM_RES_CAR = 'TOYOTA' OR EM_RES_CAR = 'FORD';

/* ORDER BY STATEMENT */
SELECT * FROM EMP_MAIN ORDER BY EM_NAME DESC;
SELECT * FROM EMP_RES ORDER BY EM_RES_CAR ASC;

/* UPDATE STATEMENT */
UPDATE EMP_RES SET EM_RES_CAR = 'LEXUS' WHERE EM_RES_CAR = 'FORD';
SELECT * FROM EMP_RES;
UPDATE EMP_RES SET EM_RES_CAR = 'FORD' WHERE EM_RES_CAR = 'LEXUS';
SELECT * FROM EMP_RES;

/* LIKE & NOT LIKE STATEMENT */
SELECT * FROM EMP_MAIN WHERE EM_DEPT LIKE '%S';
SELECT * FROM EMP_MAIN WHERE EM_DEPT LIKE 'S%';
SELECT * FROM EMP_MAIN WHERE EM_DEPT LIKE '%M_';
SELECT * FROM EMP_MAIN WHERE EM_DEPT LIKE '_T%';
SELECT * FROM EMP_MAIN WHERE EM_DEPT LIKE '%T%';
SELECT * FROM EMP_MAIN WHERE EM_NAME LIKE '%NAM%';
SELECT * FROM EMP_MAIN WHERE EM_NAME LIKE '_AMI';
SELECT * FROM EMP_MAIN WHERE EM_NAME LIKE 'R_BA_Y_';
SELECT * FROM EMP_MAIN WHERE EM_NAME NOT LIKE '_AMI';
SELECT * FROM EMP_MAIN WHERE EM_NAME NOT LIKE 'R_BA_Y_';

/* IN STATEMENT */
SELECT * FROM EMP_MAIN WHERE EM_NAME IN ('SAMI', 'YONAMIRA');
SELECT * FROM EMP_RES WHERE EM_RES_ID IN (1, 3, 4);

/* BETWEEN STATEMENT */
SELECT * FROM EMP_MAIN WHERE EM_NAME BETWEEN 'SAMI' AND 'YONAMIRA';
SELECT * FROM EMP_RES WHERE EM_RES_ID BETWEEN 3 AND 4;
SELECT * FROM EMP_MAIN WHERE EM_DOB BETWEEN TO_DATE('08/11/2000', 'DD/MM/YYYY') AND TO_DATE('08/11/2010', 'DD/MM/YYYY');
SELECT * FROM EMP_MAIN WHERE EM_DOB BETWEEN '08/NOV/2000' AND '08/NOV/2010';

/* ALIAS STATEMENT */
SELECT EM_DOB AS DOB, EM_NAME AS NAME FROM EMP_MAIN;

/* JOIN, INNER JOIN, RIGHT JOIN, FULL OUTER JOIN STATEMENT */
SELECT * FROM EMP_MAIN INNER JOIN EMP_RES ON EM_ID = EM_RES_ID;
SELECT * FROM EMP_MAIN LEFT JOIN EMP_RES ON EM_NAME = EM_RES_CAR;
SELECT * FROM EMP_MAIN RIGHT JOIN EMP_RES ON EM_DEPT = EM_RES_CAR;
SELECT * FROM EMP_MAIN FULL OUTER JOIN EMP_RES ON EM_DEPT = EM_RES_CAR;
SELECT * FROM EMP_MAIN FULL OUTER JOIN EMP_RES ON EM_DEPT = EM_RES_CAR ORDER BY EM_NAME;

/* UNION STATEMENT */ /* MAINTAIN THE ASC ORDER IN THE SERIAL */
SELECT EM_NAME FROM EMP_MAIN UNION SELECT EM_RES_CAR FROM EMP_RES;
SELECT EM_DEPT FROM EMP_MAIN UNION SELECT EM_RES_CAR FROM EMP_RES;

/* ALTER STATEMENT */
ALTER TABLE EMP_MAIN ADD EM_REP VARCHAR(10);
SELECT * FROM EMP_MAIN;
ALTER TABLE EMP_MAIN DROP COLUMN EM_REP;
SELECT * FROM EMP_MAIN;
ALTER TABLE EMP_MAIN MODIFY EM_NAME VARCHAR(20);
SELECT * FROM EMP_MAIN;
ALTER TABLE EMP_MAIN MODIFY EM_NAME VARCHAR(10);
SELECT * FROM EMP_MAIN;

/* AUTO INCREMENT */
DROP TABLE AUTOINC;
DROP SEQUENCE SEQ;
CREATE SEQUENCE SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 10;
CREATE TABLE AUTOINC (G_ID INT NOT NULL PRIMARY KEY, G_NAME VARCHAR(10) NOT NULL);
INSERT INTO AUTOINC (G_ID, G_NAME) VALUES (SEQ.NEXTVAL, 'AC');
INSERT INTO AUTOINC (G_ID, G_NAME) VALUES (SEQ.NEXTVAL, 'POP');
INSERT INTO AUTOINC (G_ID, G_NAME) VALUES (SEQ.NEXTVAL, 'BF4');
SELECT * FROM AUTOINC;
DROP TABLE AUTOINC;
DROP SEQUENCE SEQ;

/* DISTINCT STATEMENT */
SELECT DISTINCT EM_DEPT FROM EMP_MAIN;

/* DATES */
SELECT * FROM EMP_MAIN WHERE EM_DOB = TO_DATE('28/02/1995', 'DD/MM/YYYY');
SELECT * FROM EMP_MAIN WHERE EM_DOB < '28/FEB/2000';
SELECT * FROM EMP_MAIN WHERE EM_DOB > '28/FEB/2006';

/* FUNCTIONS MIN MAX AVG COUNT SUM ROUND */
DROP TABLE FUNCAL;
DROP SEQUENCE SEQE;
CREATE SEQUENCE SEQE MINVALUE 1 START WITH 1 INCREMENT BY 1 CACHE 10;
CREATE TABLE FUNCAL (ID INT NOT NULL PRIMARY KEY, VAL NUMBER(10) NOT NULL, VAL2 FLOAT NOT NULL, VAL3 DOUBLE PRECISION NOT NULL);
INSERT INTO FUNCAL (ID, VAL, VAL2, VAL3) VALUES (SEQE.NEXTVAL, 10, 2.5, 5.666);
INSERT INTO FUNCAL (ID, VAL, VAL2, VAL3) VALUES (SEQE.NEXTVAL, 20, 4.6, 2.989);
INSERT INTO FUNCAL (ID, VAL, VAL2, VAL3) VALUES (SEQE.NEXTVAL, 30, 5.2, 4.12333);
SELECT * FROM FUNCAL;
SELECT MIN(VAL), MAX(VAL), AVG(VAL) FROM FUNCAL;
SELECT MIN(VAL2), MAX(VAL2), AVG(VAL2) FROM FUNCAL;
SELECT MIN(VAL3), MAX(VAL3), AVG(VAL3) FROM FUNCAL;
SELECT SUM(VAL), SUM(VAL2), SUM(VAL3) FROM FUNCAL;
SELECT ROUND(VAL3,0) FROM FUNCAL;
SELECT COUNT(VAL) FROM FUNCAL;
DROP SEQUENCE SEQE;
DROP TABLE FUNCAL;

/* FUNCTIONS GROUP BY HAVING UPPER LOWER INITCAP LEN TO_CHAR TO DATE */
SELECT EM_NAME, COUNT(EM_NAME) FROM EMP_MAIN GROUP BY EM_NAME;
SELECT EM_NAME, AVG(EM_ID) FROM EMP_MAIN GROUP BY EM_NAME HAVING AVG(EM_ID) < 5;
SELECT LOWER(EM_NAME) FROM EMP_MAIN;
SELECT UPPER(EM_NAME) FROM EMP_MAIN;
SELECT INITCAP(EM_NAME) FROM EMP_MAIN;
SELECT LENGTH(EM_NAME) FROM EMP_MAIN;
SELECT TO_CHAR(EM_DOB, 'YYYY') FROM EMP_MAIN;
SELECT TO_CHAR(EM_DOB, 'MM') FROM EMP_MAIN;
SELECT TO_CHAR(EM_DOB, 'DD') FROM EMP_MAIN;
SELECT TO_CHAR(EM_DOB, 'MON') AS MON FROM EMP_MAIN;
SELECT TO_CHAR(EM_DOB, 'IYYYY') AS I_Y FROM EMP_MAIN;
SELECT TO_CHAR(EM_DOB, 'IMM') AS I_M FROM EMP_MAIN;
SELECT TO_CHAR(EM_DOB, 'IDD') AS I_D FROM EMP_MAIN;
SELECT TO_CHAR(EM_DOB, 'FXDD') AS FXDD FROM EMP_MAIN;
SELECT TO_CHAR(EM_DOB, 'MONTH') AS MONTH FROM EMP_MAIN;
SELECT TO_CHAR(EM_DOB, 'DAY') AS DAY FROM EMP_MAIN;
SELECT TO_CHAR(EM_DOB, 'YEAR') AS Y_YEAR FROM EMP_MAIN;
SELECT TO_DATE('1/1/1995', 'DD/MM/YYYY') AS TO_DATE FROM EMP_MAIN;

/* GREATER SMALLER AND NOT */
SELECT * FROM EMP_MAIN WHERE EM_ID < 2;
SELECT * FROM EMP_MAIN WHERE EM_ID > 2;
SELECT * FROM EMP_MAIN WHERE EM_ID != 2;

/* IS STATEMENT */ /* IT ALSO CHECKES THE NULL VALUE */
SELECT EM_NAME FROM EMP_MAIN WHERE EM_NAME IS NOT NULL;
SELECT EM_NAME FROM EMP_MAIN WHERE EM_NAME IS NULL; 
/* RESULT OF 'IS NULL' QUERY IS 'NO ROW SELECTED' BECAUSE NO NULL VALUES EXISTS IN THE DATABASE */


/* END */

/* 
    HERE TWO ERRORS FOUND IN EXECUTION
    ACTUALLY THIS ARE THE DROP TABLE ERROR THIS OCCURED IF IN THE TABLE IS NOT EXIST IN THE DATABASE 
    HERE I AM USING DORP TABLE BEFORE AND AFTER CREATE TABLES (FUNCAL, AUTOINC).
    YOU CAN MODIFY BY SIMPLY REMOVE THE BEFORE CREATE DROP TABLE AND SEQUENCE IF YOU WANT.
*/

/*
    IF YOU WANT TO DEFINE SOMETHING NULL THEN DONT USE THE NOT NULL CONSTRAINT AFTER DECLEAR A VARABLE
*/









