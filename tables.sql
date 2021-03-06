DROP TABLE CUSTOMER10;
DROP TABLE AUTO_POLICY;
DROP TABLE HOME_POLICY;
DROP TABLE POLICY;

CREATE TABLE POLICY
  (P_NO        NUMBER(30) NOT NULL,
   PRICE       NUMBER(30),
   COVERAGE    NUMBER(30)
);

ALTER TABLE POLICY ADD CONSTRAINT PKP PRIMARY KEY(P_NO);



CREATE TABLE CUSTOMER10
  (CUST_ID         NUMBER(12),
   POL_NO          NUMBER(12),
   NAME            VARCHAR2(15),
   ADDRESS         VARCHAR2(35),
   PHONE           NUMBER(18)
);
ALTER TABLE CUSTOMER10 ADD CONSTRAINT PKCUS PRIMARY KEY(CUST_ID);
ALTER TABLE CUSTOMER10 ADD CONSTRAINT FKCUS FOREIGN KEY(POL_NO) REFERENCES POLICY(P_NO);


CREATE TABLE AUTO_POLICY 
  (POL_NO                 NUMBER(12) NOT NULL,
   VEHICLE_NO             VARCHAR2(12) NOT NULL,
   MODEL                  VARCHAR2(15),
   ISSUE_DATE             DATE,
   TYPE                   VARCHAR2(12)
);

ALTER TABLE AUTO_POLICY ADD CONSTRAINT PKAP PRIMARY KEY(POL_NO);
ALTER TABLE AUTO_POLICY ADD CONSTRAINT FKAP FOREIGN KEY(POL_NO) REFERENCES POLICY(P_NO);




CREATE TABLE HOME_POLICY 
  (POL_NO                 NUMBER(12) NOT NULL,
   HOUSE_NO               VARCHAR2(20) UNIQUE,
   OWNER_NAME             VARCHAR2(15),
   ISSUE_DATE             DATE
);

ALTER TABLE HOME_POLICY ADD CONSTRAINT PKHP PRIMARY KEY(POL_NO);
ALTER TABLE HOME_POLICY ADD CONSTRAINT FKHP FOREIGN KEY(POL_NO) REFERENCES POLICY(P_NO);
COMMIT;

DESCRIBE POLICY;
DESCRIBE CUSTOMER10;
DESCRIBE AUTO_POLICY;
DESCRIBE HOME_POLICY;

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
COMMIT;

INSERT INTO POLICY VALUES (5342,30000,3344,380);
INSERT INTO POLICY VALUES (5372,90000,8765,230);
INSERT INTO POLICY VALUES (6322,88000,8665,380);
INSERT INTO POLICY VALUES (5571,78000,9665,380);
INSERT INTO POLICY VALUES (6228,82000,3565,380);
INSERT INTO POLICY VALUES (5842,20000,4765,220);
INSERT INTO POLICY VALUES (5442,87000,3520,320);
INSERT INTO POLICY VALUES (3341,29000,4369,280);

INSERT INTO AUTO_POLICY VALUES (5342,'C-4455','BMW','22-MAY-2015','CAR');
INSERT INTO AUTO_POLICY VALUES (5571,'D-4235','SUV','25-JUN-2014','JEEP');
INSERT INTO AUTO_POLICY VALUES (6228,'E-2375','ALLION','12-OCT-2014','CAR');
INSERT INTO AUTO_POLICY VALUES (5442,'U-2375','ALLION','12-NOV-2011','JEEP');




INSERT INTO HOME_POLICY VALUES (5842,'14/8-MIRPUR-10','MR.RAHIM','15-AUG-2015');
INSERT INTO HOME_POLICY VALUES (5372,'44/3-KAZIPARA','MR.RAHMAN','25-MAY-2014');
INSERT INTO HOME_POLICY VALUES (6322,'31/9-PAIKPARA','MR.RAFIQ','2-FEB-2013');
INSERT INTO HOME_POLICY VALUES (3341,'3/9-DHANMONDI','MRS.SULTANA','2-FEB-2013');



INSERT INTO CUSTOMER10 VALUES (123,5842,'MR.RAHIM','14/8-MIRPUR-10',016442000);
INSERT INTO CUSTOMER10 VALUES (114,5342,'MR.KHALIL','23/9-MIRPUR-2',017492030);
INSERT INTO CUSTOMER10 VALUES (319,6322,'MR.RAFIQ','31/9-PAIKPARA',017219239);
INSERT INTO CUSTOMER10 VALUES (193,5442,'MR.AHIMS','8/9-PANTHOPATH',016841200);
INSERT INTO CUSTOMER10 VALUES (134,3341,'MRS.SULTANA','3/9-DHANMONDI',019492030);

COMMIT;


SELECT * FROM CUSTOMER10;
SELECT * FROM AUTO_POLICY;
SELECT * FROM HOME_POLICY;
SELECT * FROM POLICY;