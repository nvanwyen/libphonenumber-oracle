--------------------------------------------------------------------------------
--
-- 2016-01-07, NV - libphonenumber.jva.sql
--

-- this script provides the stored java wrapper class for the
-- google libphonenumber functionality

--
prompt ... running libphonenumber.jva.sql

--
alter session set current_schema = google;

--
create or replace and resolve java source named "phonenumber" as

    //
    package oracle.google;

    //
    import java.lang.*;
    import java.util.*;
    import oracle.google.PhoneNumberImpl;

    //
    public class phonenumber
    {
        //
        public static final int TYPE_UNKNOWN         = PhoneNumberImpl.TYPE_UNKNOWN;
        public static final int TYPE_FIXED_LINE      = PhoneNumberImpl.TYPE_FIXED_LINE;
        public static final int TYPE_MOBILE          = PhoneNumberImpl.TYPE_MOBILE;
        public static final int TYPE_FIXED_MOBILE    = PhoneNumberImpl.TYPE_FIXED_MOBILE;
        public static final int TYPE_TOLL_FREE       = PhoneNumberImpl.TYPE_TOLL_FREE;
        public static final int TYPE_PREMIUM_RATE    = PhoneNumberImpl.TYPE_PREMIUM_RATE;
        public static final int TYPE_SHARED_COST     = PhoneNumberImpl.TYPE_SHARED_COST;
        public static final int TYPE_VOIP            = PhoneNumberImpl.TYPE_VOIP;
        public static final int TYPE_PERSONAL        = PhoneNumberImpl.TYPE_PERSONAL;
        public static final int TYPE_PAGER           = PhoneNumberImpl.TYPE_PAGER;
        public static final int TYPE_UAN             = PhoneNumberImpl.TYPE_UAN;
        public static final int TYPE_VOICEMAIL       = PhoneNumberImpl.TYPE_VOICEMAIL;

        //
        public static final int FORMAT_INTERNATIONAL = PhoneNumberImpl.FORMAT_INTERNATIONAL;
        public static final int FORMAT_NATIONAL      = PhoneNumberImpl.FORMAT_NATIONAL;
        public static final int FORMAT_RFC3966       = PhoneNumberImpl.FORMAT_RFC3966;
        public static final int FORMAT_E164          = PhoneNumberImpl.FORMAT_E164;

        //
        public static String to_type( int type )
        {
            PhoneNumberImpl impl = new PhoneNumberImpl();
            return impl.to_type( type );
        }

        //
        public static int to_type( String type )
        {
            PhoneNumberImpl impl = new PhoneNumberImpl();
            return impl.to_type( type );
        }

        //
        public static String to_format( int type )
        {
            PhoneNumberImpl impl = new PhoneNumberImpl();
            return impl.to_format( type );
        }

        //
        public static int to_format( String type )
        {
            PhoneNumberImpl impl = new PhoneNumberImpl();
            return impl.to_format( type );
        }

        //
        public static String format( String phone, String region, int style )
        {
            PhoneNumberImpl impl = new PhoneNumberImpl();
            return impl.format( phone, region, style );
        }

        //
        public static String get_region_code( String phone )
        {
            PhoneNumberImpl impl = new PhoneNumberImpl();
            return impl.get_region_code( phone );
        }

        //
        public static boolean is_possible_number( String phone, String region )
        {
            PhoneNumberImpl impl = new PhoneNumberImpl();
            return impl.is_possible_number( phone, region );
        }

        //
        public static boolean is_valid_for_region( String phone, String region )
        {
            PhoneNumberImpl impl = new PhoneNumberImpl();
            return impl.is_valid_for_region( phone, region );
        }

        //
        public static String get_supported_regions()
        {
            String val = "";
            PhoneNumberImpl impl = new PhoneNumberImpl();

            for ( String reg : impl.get_supported_regions() )
            {
                if ( val.length() == 0 )
                    val = reg;
                else
                    val += ", " + reg;
            }

            return val;
        }

        //
        public static boolean is_supported_region( String region )
        {
            boolean val = false;

            if ( region.length() > 0 )
            {
                PhoneNumberImpl impl = new PhoneNumberImpl();

                for ( String reg : impl.get_supported_regions() )
                {
                    if ( reg.equalsIgnoreCase( region ) )
                    {
                        val = true;
                        break;
                    }
                }
            }

            return val;
        }

        //
        public static int get_type( String phone, String region )
        {
            PhoneNumberImpl impl = new PhoneNumberImpl();
            return impl.get_type( phone, region );
        }

        //
        public static int get_countrycode( String phone, String region )
        {
            PhoneNumberImpl impl = new PhoneNumberImpl();
            return impl.get_countrycode( phone, region );
        }

        //
        public static long get_national( String phone, String region )
        {
            PhoneNumberImpl impl = new PhoneNumberImpl();
            return impl.get_national( phone, region );
        }

        //
        public static String truncate_number( String phone )
        {
            PhoneNumberImpl impl = new PhoneNumberImpl();
            return impl.truncate_number( phone );
        }

        //
        public static String probable( String phone, int style )
        {
            PhoneNumberImpl impl = new PhoneNumberImpl();
            return impl.probable( phone, style );
        }
    }

/

show errors

--
-- ... done!
--
