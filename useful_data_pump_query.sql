

expdp <to_user>/<password>@orcl full=Y directory=DATA_PUMP_DIR dumpfile=15072016.dmp logfile=15072016.log
impdp <to_user>/<password>@orcl schemas=<from_dump_user> directory=DATA_PUMP_DIR dumpfile=20110728h1130_backup_db.dmp logfile=20110728h1130_backup_db.log remap_schema=<from_dump_user>:<to_user>

SELECT DIRECTORY_NAME, DIRECTORY_PATH FROM DBA_DIRECTORIES WHERE DIRECTORY_NAME='DATA_PUMP_DIR';

CREATE OR REPLACE DIRECTORY DATA_PUMP_DIR AS 'D:\app\oracle\admin\xdm\dpdump\';

GRANT READ, WRITE ON DIRECTORY DATA_PUMP_DIR TO <to_user>; 

grant EXP_FULL_DATABASE to ADEMPIERE;
