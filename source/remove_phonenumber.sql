--------------------------------------------------------------------------------
--
-- 2016-01-07, NV - remove_libphonenumber.sql
--

--
-- remnoves the Google LibPhoneNumber java Library and create wrappers
-- for it's use in Oracle
--

--
prompt ... running remove_libphonenumber.sql

--
set linesize 160
set pagesize 50000
set trimspool on

--
column log new_value log noprint;

--
set termout off;
select sys_context( 'userenv', 'db_name' )
    || '_remove_libphonenumber.'
    || to_char( sysdate, 'YYYYMMDDHH24MISS' )
    || '.log' log
from dual;
set termout on;

--
spool &&log

--
drop role google_user;
drop role libphonenumber_user;

--
drop user google cascade;

--
spool off
exit

--
-- ... done!
--

