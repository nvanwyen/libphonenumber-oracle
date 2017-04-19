--------------------------------------------------------------------------------
--
-- 2016-01-07, NV - libphonenumber.pks.sql
--

-- create the package spcification for the google libphonenumber functionality

prompt ... running libphonenumber.pks.sql

--
alter session set current_schema = google;

--
create or replace package phonenumber as

    --
    subtype enum is number;

    -- phone types
    type_unknown         constant enum :=  0; -- default type
    type_fixed_line      constant enum :=  1;
    type_mobile          constant enum :=  2;
    type_fixed_mobile    constant enum :=  3;
    type_toll_free       constant enum :=  4;
    type_premium_rate    constant enum :=  5;
    type_shared_cost     constant enum :=  6;
    type_voip            constant enum :=  7;
    type_personal        constant enum :=  8;
    type_pager           constant enum :=  9;
    type_uan             constant enum := 10;
    type_voicemail       constant enum := 11;

    -- format types
    format_international constant enum :=  0; -- default format
    format_national      constant enum :=  1;
    format_rfc3966       constant enum :=  2;
    format_e164          constant enum :=  3;

    --
    function version return varchar2;

    --
    function to_type( type in enum ) return varchar2 parallel_enable;
    function to_type( type in varchar2 ) return enum parallel_enable;

    --
    function to_format( type in enum ) return varchar2 parallel_enable;
    function to_format( type in varchar2 ) return enum parallel_enable;

    --
    function format( phone  in varchar2,
                     region in varchar2 default 'US',
                     style  in enum     default format_international ) return varchar2 parallel_enable;

    --
    function get_region_code( phone in varchar2 ) return varchar2 parallel_enable;

    --
    function is_possible_number( phone  in varchar2,
                                 region in varchar2 default 'US' ) return boolean parallel_enable;

    --
    function is_valid_for_region( phone  in varchar2,
                                  region in varchar2 default 'US' ) return boolean parallel_enable;

    --
    function get_supported_regions return varchar2 parallel_enable;

    --
    function is_supported_region( region in varchar2 ) return boolean parallel_enable;

    --
    function get_type( phone  in varchar2,
                       region in varchar2 default 'US' ) return enum parallel_enable;

    --
    function get_countrycode( phone  in varchar2,
                              region in varchar2 default null ) return number parallel_enable;


    --
    function get_national( phone  in varchar2,
                           region in varchar2 default null ) return number parallel_enable;

    --
    function truncate_number( phone in varchar2 ) return varchar2 parallel_enable;

    --
    function probable( phone in varchar2,
                       style in enum default format_international ) return varchar2 parallel_enable;

    --
    function standardize( phone  in varchar2,
                          region in varchar2 default 'US',
                          style  in enum     default format_international ) return varchar2 parallel_enable;

end phonenumber;
/

show errors

--
-- ... done!
--
