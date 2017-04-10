Solution:

Before dropping the tablespace, disable recyclbin . 

1. Disable recyclebin:

SQL> ALTER SYSTEM SET recyclebin = OFF DEFERRED;

System altered.

2. Drop tablespace:

SQL> drop tablespace DATA including contents and datafiles;
Tablespace dropped.

3.  Enable recyclebin 

SQL > ALTER SYSTEM SET recyclebin = ON DEFERRED;

System altered.
