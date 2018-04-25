--------------------------------------------------------
-- Archivo creado  - miércoles-abril-25-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."CUSTOMERS" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255), 
	"COUNTRY" VARCHAR2(255), 
	"GRADE" NUMBER(*,0), 
	"SALESMAN_ID" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."ORDERS" 
   (	"ID" NUMBER(*,0), 
	"AMOUNT" NUMBER(8,2), 
	"ORDER_DATE" DATE, 
	"CUSTOMER_ID" NUMBER(*,0), 
	"SALESMAN_ID" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table SALESMAN
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."SALESMAN" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255), 
	"COUNTRY" VARCHAR2(255), 
	"COMMISSION" NUMBER(5,2)
   )
--------------------------------------------------------
--  DDL for View VIEW_1
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIOS"."VIEW_1" ("SALESMAN_NAME", "CUSTOMER_NAME", "COUNTRY") AS 
  SELECT S.NAME AS SALESMAN_NAME, C.NAME AS CUSTOMER_NAME, C.COUNTRY
    FROM SALESMAN S
    INNER JOIN CUSTOMERS C ON S.ID= C.SALESMAN_ID
    WHERE S.COUNTRY = C.COUNTRY
--------------------------------------------------------
--  DDL for View VIEW_2
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIOS"."VIEW_2" ("ID", "NAME", "COUNTRY", "GRADE", "SALESMAN_ID", "SALESMAN_NAME", "COMMISSION") AS 
  SELECT C."ID",C."NAME",C."COUNTRY",C."GRADE",C."SALESMAN_ID", S.NAME AS SALESMAN_NAME, S.COMMISSION
    FROM SALESMAN S
    INNER JOIN CUSTOMERS C ON S.ID= C.SALESMAN_ID
    WHERE S.COMMISSION > 12
--------------------------------------------------------
--  DDL for View VIEW_3
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIOS"."VIEW_3" ("CUSTOMER_NAME", "COUNTRY", "ORDER_NUMBER", "ORDER_DATE", "ORDER_AMOUNT") AS 
  SELECT C.NAME AS CUSTOMER_NAME, C.COUNTRY, O.ID AS ORDER_NUMBER, O.ORDER_DATE, O.AMOUNT AS ORDER_AMOUNT 
    FROM CUSTOMERS C
    INNER JOIN ORDERS O ON C.ID= O.CUSTOMER_ID
    ORDER BY O.ORDER_DATE ASC
--------------------------------------------------------
--  DDL for Index SYS_C007673
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."SYS_C007673" ON "EJERCICIOS"."SALESMAN" ("ID")
--------------------------------------------------------
--  DDL for Index SYS_C007677
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."SYS_C007677" ON "EJERCICIOS"."CUSTOMERS" ("ID")
--------------------------------------------------------
--  DDL for Index SYS_C007681
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."SYS_C007681" ON "EJERCICIOS"."ORDERS" ("ID")
--------------------------------------------------------
--  Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."CUSTOMERS" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."ORDERS" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Constraints for Table SALESMAN
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."SALESMAN" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."CUSTOMERS" ADD CONSTRAINT "SALESMAN_FK" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "EJERCICIOS"."SALESMAN" ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."ORDERS" ADD CONSTRAINT "CUSTOMER_ORDER_FK" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "EJERCICIOS"."CUSTOMERS" ("ID") ENABLE
  ALTER TABLE "EJERCICIOS"."ORDERS" ADD CONSTRAINT "SALESMAN_ORDER_FK" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "EJERCICIOS"."SALESMAN" ("ID") ENABLE
