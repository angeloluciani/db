-- select tablespaces's name and status
select tablespace_name, status, contents from user_tablespaces;

-- select tablespaces, name, status, dimension
col file_name format a50
col tablespace_name format a10 
SELECT file_name, tablespace_name, ROUND(bytes/1024000) MB
FROM dba_data_files
ORDER BY 1;

-- drop table_space
DROP TABLESPACE PIPPO 
  INCLUDING CONTENTS
  AND DATAFILES 
  cascade constraints;
  
-- create table space
CREATE TABLESPACE "pippo"
       DATAFILE 'C:\DEV\DATAFILE\pippo.dbf' SIZE 100M REUSE
       AUTOEXTEND ON
       NEXT       100M
       MAXSIZE   2048M
       LOGGING
       EXTENT MANAGEMENT LOCAL
       SEGMENT SPACE MANAGEMENT AUTO;  

