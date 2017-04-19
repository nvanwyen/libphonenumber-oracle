--------------------------------------------------------------------------------
--
-- 2016-01-07, NV - libphonenumber.prv.sql
--

-- create the google schema for the libphonenumber functionality

prompt ... running libphonenumber.prv.sql

--
declare

    ts varchar2( 4000 );

begin

    --
    select default_tablespace into ts
      from dba_users
     where username = 'GOOGLE';

    --
    execute immediate 'alter user google quota unlimited on ' || ts;

end;
/

--
begin

    --
    dbms_java.grant_permission( 'GOOGLE',
                                'SYS:java.lang.RuntimePermission',
                                ' getClassLoader',
                                '' );

    --
    dbms_java.grant_permission( 'GOOGLE',
                                'SYS:java.lang.RuntimePermission' ,
                                'setContextClassLoader',
                                '' );

    --
    dbms_java.grant_permission( 'GOOGLE',
                                'SYS:java.util.PropertyPermission',
                                '*',
                                'read,write' );

end;
/

--
-- ... done!
--
