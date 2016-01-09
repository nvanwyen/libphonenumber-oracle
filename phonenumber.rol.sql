--------------------------------------------------------------------------------
--
-- 2016-01-07, NV - libphonenumber.rol.sql
--

-- create roles for RBAC privliges for the google libphonenumber functionality

prompt ... running libphonenumber.rol.sql

set serveroutput on

--
declare

    c number := 0;

begin

    select count(0) into c
      from dba_roles
     where role = 'GOOGLE_USER';

    if ( c = 0 ) then

        execute immediate 'create role google_user '
                       || 'not identified ';

        dbms_output.put_line( 'Role GOOGLE_USER created' );

    else

        dbms_output.put_line( 'Role GOOGLE_USER already exists' );

    end if;

    select count(0) into c
      from dba_roles
     where role = 'LIBPHONENUMBER_USER';

    if ( c = 0 ) then

        execute immediate 'create role libphonenumber_user '
                       || 'not identified ';

        dbms_output.put_line( 'Role LIBPHONENUMBER_USER created' );

    else

        dbms_output.put_line( 'Role LIBPHONENUMBER_USER already exists' );

    end if;

end;
/

--
-- ... done!
--
