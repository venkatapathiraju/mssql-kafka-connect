use [master]
GO
CREATE DATABASE demo;
GO
use DEMO;

CREATE TABLE demo.dbo.TRANSACTIONS (ID INT, INSTRUMENT VARCHAR(50), TRANS_DATE DATE, SETTL_DATE DATE, ROW_VER ROWVERISON);

GO

EXEC SYS.sp_cdc_enable_db;
EXEC sys.sp_cdc_enable_table @source_schema = N'dbo', @source_name = N'TRANSACTIONS', @role_name = NULL
GO

insert into demo.dbo.TRANSACTIONS (ID, INSTRUMENT , TRANS_DATE, SETTL_DATE) values (1, 'SP','2023-02-03','2023-03-07')
GO