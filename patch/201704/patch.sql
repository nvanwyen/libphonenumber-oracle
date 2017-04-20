--------------------------------------------------------------------------------
--
-- 2017-04-19, NV - patch_201704.sql
--

-- this patch is the Apr, 2017 update for version 8.1.4
-- adding "standardize()" to the API as requested. This patch will fail
-- if the install version is not v8.1.4 or higher

--
whenever oserror  exit 9;
whenever sqlerror exit sql.sqlcode;

--
set linesize 160
set pagesize 50000
set trimspool on

--
column log new_value log noprint;

--
set termout off;
select sys_context( 'userenv', 'db_name' )
    || '_patch_phonenumber.'
    || to_char( sysdate, 'YYYYMMDDHH24MISS' )
    || '.log' log
from dual;
set termout on;

--
spool &&log

--
set serveroutput on
--
declare

    ver varchar2( 4000 );

    maj number;
    mnr number;
    pch number;

begin

    --
    execute immediate q'[select google.phonenumber.version 
                           from dual]'
       into ver;

    --
    if ( length( trim( ver ) ) > 0 ) then

        -- remove "v" from "v8.1.4"
        ver := replace( ver, 'v', '' );

        --
        begin

            -- assumes format 8.1.4 (8 @ index 1, 1 @ idnex 3 and 4 @ index 5)
            maj := to_number( substr( ver, 1, 1 ) );
            mnr := to_number( substr( ver, 3, 1 ) );
            pch := to_number( substr( ver, 5, 1 ) );

            --
            if ( ( maj >= 8 ) and ( mnr >= 4 ) and ( pch > 1 ) ) then

                --
                dbms_output.put_line( 'GOOGLE version [v' || ver || '] ready for patching' );

            else

                --
                raise_application_error( -20003, 'GOOGLE version [v' || ver || '] cannot be patched' );

            end if;

            --
            exception
                when invalid_number then
                    raise_application_error( -20003, 'GOOGLE Phonenumber did not parse version' );

        end;

    else

        --
        raise_application_error( -20002, 'GOOGLE Phonenumber returned NULL version' );

    end if;

    --
    exception
        --
        when others then
            --
            if ( sqlcode = -00904 ) then /* ORA-00904: %s: invalid identifier */

                --
                raise_application_error( -20001, 'GOOGLE Phonenumber is too old to patch' );

            end if;

end;
/

-- set current (or new) version
prompt ... running ver
!( ./ver )

-- implementation
prompt ... running compile.sh
!( ./compile.sh )

-- load JAR
prompt ... running loadjar.sh
!( ./loadjar.sh jar/PhoneNumberImpl.jar sys xxx )

-- java wrapper (source)
@@phonenumber.jva.sql

-- package wrapper
@@phonenumber.pks.sql
@@phonenumber.pkb.sql

--
spool off
exit

--
-- ...done!
--
