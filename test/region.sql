--------------------------------------------------------------------------------
--
-- 2016-01-07, NV - region.sql
--

-- test the google phonenumber region functionality

set serveroutput on

--
select google.phonenumber.get_region_code( '+17035551212' ) from dual;

--
select google.phonenumber.get_region_code( '+919769321013' ) from dual;

--
select google.phonenumber.get_region_code( '+442079250918' ) from dual;

--
select google.phonenumber.get_supported_regions() from dual;

--
begin

    --
    dbms_output.put_line( 'LK is supported: '
                       || case when google.phonenumber.is_supported_region( 'LK' ) 
                               then 'YES'
                               else 'NO'
                          end );

    --
    dbms_output.put_line( 'XX is supported: '
                       || case when google.phonenumber.is_supported_region( 'XX' ) 
                               then 'YES'
                               else 'NO'
                          end );

end;
/
