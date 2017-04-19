--------------------------------------------------------------------------------
--
-- 2016-01-07, NV - libphonenumber.gnt.sql
--

-- assign the RBAC grants for the google libphonenumber functionality

prompt ... running libphonenumber.gnt.sql

--
grant libphonenumber_user to google_user;

--
grant execute on google.phonenumber to libphonenumber_user;

--
-- ... done!
--
