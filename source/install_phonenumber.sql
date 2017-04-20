--------------------------------------------------------------------------------
--
-- 2016-01-07, NV - install_phonenumber.sql
--

--
-- install the Google LibPhoneNumber java Library and create wrappers
-- for it's use in Oracle
--

--
prompt ... running install_phonenumber.sql

--
whenever oserror exit

--
set linesize 160
set pagesize 50000
set trimspool on

--
column log new_value log noprint;

--
set termout off;
select sys_context( 'userenv', 'db_name' )
    || '_install_phonenumber.'
    || to_char( sysdate, 'YYYYMMDDHH24MISS' )
    || '.log' log
from dual;
set termout on;

--
spool &&log

-- set current version
prompt ... running ver
!( ./ver )

-- schema
@@phonenumber.sch.sql

-- privilges
@@phonenumber.prv.sql

-- implementation
prompt ... running compile.sh
!( ./compile.sh )

-- 3rd-party JAR
prompt ... running loadjava.sh
!( ./loadjava.sh sys xxx )

-- java wrapper (source)
@@phonenumber.jva.sql

-- package wrapper
@@phonenumber.pks.sql
@@phonenumber.pkb.sql

-- roles
@@phonenumber.rol.sql

-- RBAC grants
@@phonenumber.gnt.sql

-- synonyms
@@phonenumber.syn.sql

--
spool off
exit

--
-- ... done!
--
