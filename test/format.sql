--------------------------------------------------------------------------------
--
-- 2016-01-07, NV - format.sql
--

-- test the google phonenumber format functionality

set serveroutput on

--
begin

    for i in google.phonenumber.type_unknown .. google.phonenumber.type_voicemail loop

        dbms_output.put_line( 'Type: ' ||
                              google.phonenumber.to_type( i ) || ' = ' ||
                              google.phonenumber.to_type( google.phonenumber.to_type( i ) ) );

    end loop;

end;
/

--
begin

    for i in google.phonenumber.format_international .. google.phonenumber.format_e164 loop

        dbms_output.put_line( 'Format: ' ||
                              google.phonenumber.to_format( i ) || ' = ' ||
                              google.phonenumber.to_format( google.phonenumber.to_format( i ) ) );

    end loop;

end;
/

--
select google.phonenumber.format( '+17035551212' ) from dual;

-- canada is the same as us
select google.phonenumber.format( '1235551212', 'CA' ) from dual;

--
select google.phonenumber.format( '8005551212' ) from dual;

--
begin

    dbms_output.put_line( google.phonenumber.format( '8005551212',
                                                     'US',
                                                     google.phonenumber.format_national ) );

end;
/

--
select google.phonenumber.format( '(0) 20 7925 0918', 'GB' ) from dual;

--
select google.phonenumber.format( '+44 20 7925 0918', 'GB', google.phonenumber.to_format( 'RFC3966' ) ) from dual;

