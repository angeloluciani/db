select * from dba_profiles;

ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

alter user PIPPO identified by pluto;

alter user PIPPO account unlock;

select username,account_status from dba_users; // The account status should be open

