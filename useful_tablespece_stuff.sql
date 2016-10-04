-- select tablespaces's name and status
select tablespace_name, status, contents from user_tablespaces;

-- select tablespaces, name, status, dimension
col file_name format a50
col tablespace_name format a10 
SELECT file_name, tablespace_name, ROUND(bytes/1024000) MB
FROM dba_data_files
ORDER BY 1;
