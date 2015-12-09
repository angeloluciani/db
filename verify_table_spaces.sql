select tablespace_name, sum(bytes/1024/1024) "MB FREE" from dba_free_space group by tablespace_name order by 1;
