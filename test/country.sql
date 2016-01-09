--------------------------------------------------------------------------------
--
-- 2016-01-07, NV - country.sql
--

-- test the google phonenumber country functionality

set serveroutput on

--
select google.phonenumber.get_countrycode( '+17035551212' ) from dual;

-- canada is the same as us
select google.phonenumber.get_countrycode( '1235551212', 'CA' ) from dual;

--
select google.phonenumber.get_countrycode( '(0) 20 7925 0918' ) from dual;

--
select google.phonenumber.get_countrycode( '+44 20 7925 0918', 'GB' ) from dual;


--
select google.phonenumber.get_national( '+17035551212' ) from dual;

--
select google.phonenumber.get_national( '1235551212', 'CA' ) from dual;

--
select google.phonenumber.get_national( '(0) 20 7925 0918' ) from dual;

--
select google.phonenumber.get_national( '+44 20 7925 0918', 'GB' ) from dual;


--
select google.phonenumber.truncate_number( '17035551212' ) from dual;

--
select google.phonenumber.truncate_number( '70355512121234567890' ) from dual;

