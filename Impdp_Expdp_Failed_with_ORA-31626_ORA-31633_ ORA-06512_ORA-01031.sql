Impdp Expdp Failed with ORA-31626, ORA-31633, ORA-06512, ORA-01031
_____________________________________________________________________________________________________________________


 
Error description

Oracle data pump expdp / impdp failed with following errors.

Import: Release 11.2.0.3.0 - Production on Fri Jun 20 07:42:33 2014

Copyright (c) 1982, 2011, Oracle and/or its affiliates.  All rights reserved.

Username: scott
Password:

Connected to: Oracle Database 11g Release 11.2.0.3.0 - 64bit Production
ORA-31626: job does not exist
ORA-31633: unable to create master table "SCOTT.SYS_IMPORT_FULL_05"
ORA-06512: at "SYS.DBMS_SYS_ERROR", line 95
ORA-06512: at "SYS.KUPV$FT", line 1020
ORA-01031: insufficient privileges

Solution Description
 
If you are trying for export using expdp you have to give EXP_FULL_DATABASE privilege to the user which you are using for the export. 

Or if you are trying to import using impdp, you will have to give IMP_FULL_DATABASE privilege to the user which you are using for the export. Also you have to give required space quota to the user.

Commands
SQL> grant IMP_FULL_DATABASE to scott;

Grant succeeded.
SQL> alter user scott quota unlimited on users;
User altered.

SQL> grant EXP_FULL_DATABASE to scott;
