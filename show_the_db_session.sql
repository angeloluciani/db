select username, machine, schemaname, osuser, status,
SYSDATE-logon_time "Giorni", (SYSDATE-logon_time)*24
"Ore"
from sys.v_$session
where type='USER'
