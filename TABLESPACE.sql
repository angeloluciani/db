


DROP TABLESPACE X_BLOB 
  INCLUDING CONTENTS
  AND DATAFILES 
  cascade constraints
  
-- Identify the segments :
select segment_name from dba_segments
where tablespace_name ='X_BLOB'
and segment_type like '%LOB%';

--Identify the table_name owning the LOB segment 
select OWNER, TABLE_NAME, SEGMENT_NAME from dba_lobs
where SEGMENT_NAME in (
select segment_name
from dba_segments
where tablespace_name ='X_BLOB'
and segment_type like '%LOB%');

--Identify the tablespace for that table 
select OWNER, TABLESPACE_NAME from dba_tables
where TABLE_NAME in 
(
select TABLE_NAME from dba_lobs
where SEGMENT_NAME in (
select segment_name
from dba_segments
where tablespace_name ='X_BLOB'
and segment_type like '%LOB%')
)

-- Move the segments into the table's tablespace - dependent on LOB type :
ALTER TABLE xyz MOVE LOB(lobcol) STORE AS lobsegment
(TABLESPACE one_selected_above STORAGE (new_storage));
--This command will move the lob column to a new tablespace.
--You should now be able to drop the users tablespace.
--If you want to get rid of the LOBs period. - then move the owning tables to the tablespace USERS and then drop cascade.
