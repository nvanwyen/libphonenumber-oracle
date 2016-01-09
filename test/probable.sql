--------------------------------------------------------------------------------
--
-- 2016-01-09, NV - probable.sql
--

-- test google phone number, probable determinations

--
select google.phonenumber.probable( '+17035551212' ) from dual;

-- canada is the same as us
select google.phonenumber.probable( '1235551212' ) from dual;

--
select google.phonenumber.probable( '(0) 20 7925 0918' ) from dual;

--
select google.phonenumber.probable( '+44 20 7925 0918' ) from dual;

--
-- ... done!
--
