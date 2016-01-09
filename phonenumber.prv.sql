--------------------------------------------------------------------------------
--
-- 2016-01-07, NV - libphonenumber.prv.sql
--

-- create the google schema for the libphonenumber functionality

prompt ... running libphonenumber.prv.sql

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
