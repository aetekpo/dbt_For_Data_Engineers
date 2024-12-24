

CREATE OR REPLACE  WAREHOUSE SMALLWAREHOUSE
WAREHOUSE_SIZE = 'XSMALL';

CREATE OR REPLACE DATABASE TESTDB;

CREATE OR REPLACE SCHEMA TESTDB.ECOMMERCE;

-- 1 CREATE FORMAT
-- REF https://docs.snowflake.com/en/sql-reference/sql/create-file-format.html
-- REF https://docs.snowflake.com/en/sql-reference/sql/alter-file-format.html
-- follows: "DATABASENAME"."SCHEMANAME".FORMATNAME 
CREATE FILE FORMAT "TESTDB"."ECOMMERCE".ECOMMERCECSVFORMAT 
-- add SET if ALTER (insted io create)
COMPRESSION = 'AUTO' 
FIELD_DELIMITER = ',' 
RECORD_DELIMITER = '\n' 
SKIP_HEADER = 1 
FIELD_OPTIONALLY_ENCLOSED_BY = 'NONE' 
TRIM_SPACE = FALSE 
TIMESTAMP_FORMAT = 'MM/DD/YYYY HH:MI'
ERROR_ON_COLUMN_COUNT_MISMATCH = TRUE 
ESCAPE = 'NONE' 
ESCAPE_UNENCLOSED_FIELD = '\134'
NULL_IF = ('\\N');

-- "DATABASENAME"."SCHEMANAME".DATANAME
-- 2. CREATE DATA
create or replace TABLE TESTDB.ECOMMERCE.DATA (
	INVOICENO VARCHAR(38),
	STOCKCODE VARCHAR(38),
	DESCRIPTION VARCHAR(60),
	QUANTITY NUMBER(38,0),
	INVOICEDATE TIMESTAMP,
	UNITPRICE NUMBER(38,0),
	CUSTOMERID VARCHAR(10),
	COUNTRY VARCHAR(20)
);