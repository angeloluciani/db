select * from dba_profiles;

ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

alter user "pippo" identified by values 'pluto';
