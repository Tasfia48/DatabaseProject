--ALTERNATION

ALTER TABLE POLICY ADD TERM_PRICE NUMBER(30);

DESCRIBE POLICY;

DESCRIBE CUSTOMER10;

ALTER TABLE CUSTOMER10 MODIFY POL_NO NUMBER(30);

DESCRIBE CUSTOMER10;

DESCRIBE AUTO_POLICY;

ALTER TABLE AUTO_POLICY DROP COLUMN TYPE;

DESCRIBE AUTO_POLICY;

ALTER TABLE AUTO_POLICY ADD TYPE VARCHAR(12);

DESCRIBE AUTO_POLICY;

DESCRIBE HOME_POLICY;

ALTER TABLE HOME_POLICY RENAME COLUMN HOUSE_NO TO H_NO;

DESCRIBE HOME_POLICY;

--INSERTION OF ATTRIBUTES IN THE TABLE

INSERT INTO POLICY VALUES (5342,30000,3344,380);
INSERT INTO POLICY VALUES (5372,90000,8765,230);
INSERT INTO POLICY VALUES (6322,88000,8665,380);
INSERT INTO POLICY VALUES (5571,78000,9665,380);
INSERT INTO POLICY VALUES (6228,82000,3565,380);
INSERT INTO POLICY VALUES (5842,20000,4765,420);


INSERT INTO AUTO_POLICY VALUES (5342,'C-4455','BMW','22-MAY-2015','CAR');
INSERT INTO AUTO_POLICY VALUES (5571,'D-4235','SUV','25-JUN-2014','JEEP');
INSERT INTO AUTO_POLICY VALUES (6228,'E-2375','ALLION','12-OCT-2014','CAR');


INSERT INTO HOME_POLICY VALUES (5842,'14/8-MIRPUR-10','MR.RAHIM','15-AUG-2015');
INSERT INTO HOME_POLICY VALUES (5372,'44/3-KAZIPARA','MR.RAHMAN','25-MAY-2014');
INSERT INTO HOME_POLICY VALUES (6322,'31/9-PAIKPARA','MR.RAFIQ','2-FEB-2013');

INSERT INTO CUSTOMER10 VALUES (123,5842,'MR.RAHIM','14/8-MIRPUR-10',016442000);
INSERT INTO CUSTOMER10 VALUES (114,5342,'MR.KHALIL','23/9-MIRPUR-2',017492030);
INSERT INTO CUSTOMER10 VALUES (319,6322,'MR.RAFIQ','31/9-PAIKPARA',017219239);
INSERT INTO CUSTOMER10 VALUES (189,5372,'MR.RAHMAN','1/3-PAIKPARA',018219239);
INSERT INTO CUSTOMER10 VALUES (119,5342,'MRS.SULTANA','3/34-PANTHOPATH',018219169);


SELECT * FROM CUSTOMER10;
SELECT * FROM AUTO_POLICY;
SELECT * FROM HOME_POLICY;
SELECT * FROM POLICY;

--DELETION

DELETE FROM AUTO_POLICY WHERE POL_NO=6228;

SELECT * FROM AUTO_POLICY;

DELETE FROM POLICY WHERE P_NO=6228;

SELECT * FROM POLICY;


--LAB-4 SELECT OPERATION AND AGGREGATE FUNCTION STARTS


--SELECT OPERATION

SELECT DISTINCT (P_NO) FROM POLICY;

SELECT (COVERAGE/12) AS COVERAGE_IN_A_YEAR FROM POLICY;


--COMPARISION SEARCH

SELECT OWNER_NAME FROM HOME_POLICY WHERE ISSUE_DATE='2-FEB-2013';

--AND OR ETC AND COMPOUND COMPARISION

SELECT P_NO FROM POLICY WHERE TERM_PRICE>30000 AND TERM_PRICE<40000;

--BETWEEN
SELECT P_NO FROM POLICY WHERE TERM_PRICE NOT BETWEEN 30000 AND 40000;

--IN OPERATION
SELECT NAME FROM CUSTOMER10 WHERE CUST_ID IN(123,114);

--PATTERN MATCHING
SELECT POL_NO FROM AUTO_POLICY WHERE TYPE LIKE '%JEEP%';

--ORDER BY

SELECT POL_NO,OWNER_NAME,H_NO FROM HOME_POLICY ORDER BY POL_NO;
SELECT POL_NO,OWNER_NAME,H_NO FROM HOME_POLICY ORDER BY POL_NO DESC;

--AGGREGATE FUNCTIONS

SELECT COUNT(*),SUM(PRICE),AVG(TERM_PRICE),MAX(COVERAGE),MIN(COVERAGE) FROM POLICY;


--LAB-5 SUBQUERY AND SET OPERATIONS



--SUBQUERY

SELECT OWNER_NAME,H_NO FROM HOME_POLICY WHERE POL_NO IN (SELECT P_NO FROM POLICY WHERE TERM_PRICE<40000);

--QUERY

SELECT V.VEHICLE_NO,V.TYPE,V.MODEL FROM AUTO_POLICY V,POLICY P WHERE V.POL_NO=P.P_NO;

--UNION OPERATION

SELECT P_NO,TERM_PRICE FROM POLICY WHERE TERM_PRICE>40000 UNION SELECT P.P_NO,P.TERM_PRICE FROM POLICY P WHERE P.P_NO IN (SELECT Q.P_NO FROM POLICY Q,AUTO_POLICY A WHERE Q.P_NO=A.POL_NO);

--UNION ALL OPERATION

SELECT P_NO,TERM_PRICE FROM POLICY WHERE TERM_PRICE<40000 UNION ALL SELECT P.P_NO,P.TERM_PRICE FROM POLICY P WHERE P.P_NO IN (SELECT Q.P_NO FROM POLICY Q,AUTO_POLICY A WHERE Q.P_NO=A.POL_NO);

--INTERSECT OPERATION

SELECT P_NO,TERM_PRICE FROM POLICY WHERE TERM_PRICE<40000 INTERSECT SELECT P.P_NO,P.TERM_PRICE FROM POLICY P WHERE P.P_NO IN (SELECT Q.P_NO FROM POLICY Q,AUTO_POLICY A WHERE Q.P_NO=A.POL_NO);

--MINUS OPERATION

SELECT P_NO,TERM_PRICE FROM POLICY WHERE TERM_PRICE<40000 MINUS SELECT P.P_NO,P.TERM_PRICE FROM POLICY P WHERE P.P_NO IN (SELECT Q.P_NO FROM POLICY Q,AUTO_POLICY A WHERE Q.P_NO=A.POL_NO);



--LAB-6 JOIN OPERATIONS


--JOIN

SELECT P.P_NO,C.CUST_ID FROM POLICY P JOIN CUSTOMER10 C ON P.P_NO=C.POL_NO;

SELECT P_NO,TERM_PRICE,PRICE,CUST_ID,NAME FROM POLICY JOIN CUSTOMER10 ON POLICY.P_NO=CUSTOMER10.POL_NO;  

--NATURAL JOIN OPERATION

SELECT POLICY.P_NO,POLICY.TERM_PRICE,POLICY.PRICE,POLICY.COVERAGE,CUSTOMER10.NAME FROM POLICY NATURAL JOIN CUSTOMER10; 

--CROSS JOIN OPERATION

SELECT P.P_NO,C.NAME FROM POLICY P CROSS JOIN CUSTOMER10 C;

-- USING CLAUSE
SELECT C.CUST_ID,C.NAME FROM CUSTOMER10 C JOIN AUTO_POLICY USING(POL_NO);

--MULTIPLE CONDITION

SELECT C.CUST_ID,C.NAME,A.POL_NO FROM CUSTOMER10 C JOIN HOME_POLICY A ON ((C.POL_NO=A.POL_NO) AND (C.NAME=A.OWNER_NAME));

--OUTER JOINS

SELECT P.P_NO,C.CUST_ID FROM POLICY P LEFT OUTER JOIN CUSTOMER10 C ON P.P_NO=C.POL_NO;

SELECT P.P_NO,C.CUST_ID FROM POLICY P RIGHT OUTER JOIN CUSTOMER10 C ON P.P_NO=C.POL_NO;


