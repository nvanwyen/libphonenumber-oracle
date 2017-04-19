--------------------------------------------------------------------------------
--
-- 2016-01-07, NV - libphonenumber.sch.sql
--

-- create the google schema for the libphonenumber functionality

prompt ... running libphonenumber.sch.sql

set serveroutput on

--
declare

    c number := 0;

begin

    select count(0) into c
      from dba_users
     where username = 'GOOGLE';

    if ( c = 0 ) then

        execute immediate 'create user google '
                       || 'identified by values ''FFFFFFFFFFFFFFFF'' ';

        dbms_output.put_line( 'Schema GOOGLE created' );

    else

        dbms_output.put_line( 'Schema GOOGLE already exists' );

    end if;

end;
/

--
-- ... done!
--
