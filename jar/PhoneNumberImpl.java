//
package oracle.google;

//
import java.lang.*;
import java.util.*;
import com.google.i18n.phonenumbers.*;

import com.google.i18n.phonenumbers.PhoneNumberUtil;
import com.google.i18n.phonenumbers.PhoneNumberUtil.PhoneNumberType;
import com.google.i18n.phonenumbers.PhoneNumberUtil.PhoneNumberFormat;

import com.google.i18n.phonenumbers.Phonenumber;
import com.google.i18n.phonenumbers.Phonenumber.PhoneNumber;

//
public class PhoneNumberImpl
{
    //
    public static final int TYPE_UNKNOWN         =  0;
    public static final int TYPE_FIXED_LINE      =  1;
    public static final int TYPE_MOBILE          =  2;
    public static final int TYPE_FIXED_MOBILE    =  3;
    public static final int TYPE_TOLL_FREE       =  4;
    public static final int TYPE_PREMIUM_RATE    =  5;
    public static final int TYPE_SHARED_COST     =  6;
    public static final int TYPE_VOIP            =  7;
    public static final int TYPE_PERSONAL        =  8;
    public static final int TYPE_PAGER           =  9;
    public static final int TYPE_UAN             = 10;
    public static final int TYPE_VOICEMAIL       = 11;

    //
    public static final int FORMAT_INTERNATIONAL =  0;
    public static final int FORMAT_NATIONAL      =  1;
    public static final int FORMAT_RFC3966       =  2;
    public static final int FORMAT_E164          =  3;

    //
    public PhoneNumberImpl()
    {
        // ctor
    }

    //
    private static PhoneNumberType type_to_enum( int type )
    {
        PhoneNumberType e = PhoneNumberType.UNKNOWN;

        switch ( type )
        {
            case TYPE_FIXED_LINE:
                e = PhoneNumberType.FIXED_LINE;
                break;

            case TYPE_MOBILE:
                e = PhoneNumberType.MOBILE;
                break;

            case TYPE_FIXED_MOBILE:
                e = PhoneNumberType.FIXED_LINE_OR_MOBILE;
                break;

            case TYPE_TOLL_FREE:
                e = PhoneNumberType.TOLL_FREE;
                break;

            case TYPE_PREMIUM_RATE:
                e = PhoneNumberType.PREMIUM_RATE;
                break;

            case TYPE_SHARED_COST:
                e = PhoneNumberType.SHARED_COST;
                break;

            case TYPE_VOIP:
                e = PhoneNumberType.VOIP;
                break;

            case TYPE_PERSONAL:
                e = PhoneNumberType.PERSONAL_NUMBER;
                break;

            case TYPE_PAGER:
                e = PhoneNumberType.PAGER;
                break;

            case TYPE_UAN:
                e = PhoneNumberType.UAN;
                break;

            case TYPE_VOICEMAIL:
                e = PhoneNumberType.VOICEMAIL;
                break;

            case TYPE_UNKNOWN:
            default:
                e = PhoneNumberType.UNKNOWN;
                break;
        }

        return e;
    }

    //
    private static int enum_to_type( PhoneNumberType type )
    {
        int e = TYPE_UNKNOWN;

        switch ( type )
        {
            case FIXED_LINE:
                e = TYPE_FIXED_LINE;
                break;

            case MOBILE:
                e = TYPE_MOBILE;
                break;

            case FIXED_LINE_OR_MOBILE:
                e = TYPE_FIXED_MOBILE;
                break;

            case TOLL_FREE:
                e = TYPE_TOLL_FREE;
                break;

            case PREMIUM_RATE:
                e = TYPE_PREMIUM_RATE;
                break;

            case SHARED_COST:
                e = TYPE_SHARED_COST;
                break;

            case VOIP:
                e = TYPE_VOIP;
                break;

            case PERSONAL_NUMBER:
                e = TYPE_PERSONAL;
                break;

            case PAGER:
                e = TYPE_PAGER;
                break;

            case UAN:
                e = TYPE_UAN;
                break;

            case VOICEMAIL:
                e = TYPE_VOICEMAIL;
                break;

            case UNKNOWN:
            default:
                e = TYPE_UNKNOWN;
                break;
        }

        return e;
    }

    //
    public static String to_type( int type )
    {
        String t = "";

        switch ( type )
        {
            case TYPE_FIXED_LINE:
                t = "FIXED_LINE";
                break;

            case TYPE_MOBILE:
                t = "MOBILE";
                break;

            case TYPE_FIXED_MOBILE:
                t = "FIXED_MOBILE";
                break;

            case TYPE_TOLL_FREE:
                t = "TOLL_FREE";
                break;

            case TYPE_PREMIUM_RATE:
                t = "PREMIUM_RATE";
                break;

            case TYPE_SHARED_COST:
                t = "SHARED_COST";
                break;

            case TYPE_VOIP:
                t = "VOIP";
                break;

            case TYPE_PERSONAL:
                t = "PERSONAL";
                break;

            case TYPE_PAGER:
                t = "PAGER";
                break;

            case TYPE_UAN:
                t = "UAN";
                break;

            case TYPE_VOICEMAIL:
                t = "VOICEMAIL";
                break;

            case TYPE_UNKNOWN:
            default:
                t = "UNKNOWN";
                break;
        }

        return t;
    }

    //
    public static int to_type( String type )
    {
        int t = TYPE_UNKNOWN;

        if ( type.equalsIgnoreCase( "FIXED_LINE" ) )
            t = TYPE_FIXED_LINE;

        if ( type.equalsIgnoreCase( "MOBILE" ) )
            t = TYPE_MOBILE;

        if ( type.equalsIgnoreCase( "FIXED_MOBILE" ) )
            t = TYPE_FIXED_MOBILE;

        if ( type.equalsIgnoreCase( "TOLL_FREE" ) )
            t = TYPE_TOLL_FREE;

        if ( type.equalsIgnoreCase( "PREMIUM_RATE" ) )
            t = TYPE_PREMIUM_RATE;

        if ( type.equalsIgnoreCase( "SHARED_COST" ) )
            t = TYPE_SHARED_COST;

        if ( type.equalsIgnoreCase( "VOIP" ) )
            t = TYPE_VOIP;

        if ( type.equalsIgnoreCase( "PERSONAL" ) )
            t = TYPE_PERSONAL;

        if ( type.equalsIgnoreCase( "PAGER" ) )
            t = TYPE_PAGER;

        if ( type.equalsIgnoreCase( "UAN" ) )
            t = TYPE_UAN;

        if ( type.equalsIgnoreCase( "VOICEMAIL" ) )
            t = TYPE_VOICEMAIL;

        if ( type.equalsIgnoreCase( "UNKNOWN" ) )
            t = TYPE_UNKNOWN;

        return t;
    }

    //
    private static PhoneNumberFormat format_to_enum( int type )
    {
        PhoneNumberFormat e = PhoneNumberFormat.INTERNATIONAL;

        switch ( type )
        {
            case FORMAT_RFC3966:
                 e = PhoneNumberFormat.RFC3966;
                break;

            case FORMAT_E164:
                e = PhoneNumberFormat.E164;
                break;

            case FORMAT_NATIONAL:
                e = PhoneNumberFormat.NATIONAL;
                break;

            case FORMAT_INTERNATIONAL:
            default:
                e = PhoneNumberFormat.INTERNATIONAL;
                break;
        }

        return e;
    }

    //
    private static int enum_to_format( PhoneNumberFormat type )
    {
        int e = FORMAT_INTERNATIONAL;

        switch ( type )
        {
            case RFC3966:
                e = FORMAT_RFC3966;
                break;

            case E164:
                e = FORMAT_E164;
                break;

            case NATIONAL:
                e = FORMAT_NATIONAL;
                break;

            case INTERNATIONAL:
            default:
                e = FORMAT_INTERNATIONAL;
                break;
        }

        return e;
    }

    //
    public static String to_format( int type )
    {
        String t = "";

        switch ( type )
        {
            case FORMAT_RFC3966:
                t = "RFC3966";
                break;

            case FORMAT_E164:
                t = "E164";
                break;

            case FORMAT_NATIONAL:
                t = "NATIONAL";
                break;

            case FORMAT_INTERNATIONAL:
            default:
                t = "INTERNATIONAL";
                break;
        }

        return t;
    }

    //
    public static int to_format( String type )
    {
        int t = FORMAT_INTERNATIONAL;

        if ( type.equalsIgnoreCase( "RFC3966" ) )
            t = FORMAT_RFC3966;

        if ( type.equalsIgnoreCase( "E164" ) )
            t = FORMAT_E164;

        if ( type.equalsIgnoreCase( "NATIONAL" ) )
            t = FORMAT_NATIONAL;

        if ( type.equalsIgnoreCase( "INTERNATIONAL" ) )
            t = FORMAT_INTERNATIONAL;

        return t;
    }

    //
    public static String format( String phone, String region, int style )
    {
        PhoneNumberUtil utl = PhoneNumberUtil.getInstance();
        String val = "";

        try
        {
            Phonenumber.PhoneNumber num = utl.parse( phone, region );
            val =  utl.format( num, format_to_enum( style ) );
        }
        catch ( Exception e )
        {
            val = phone;
        }

        return val;
    }

    //
    public static String get_region_code( String phone )
    {
        PhoneNumberUtil utl = PhoneNumberUtil.getInstance();
        String val = "";

        try
        {
            Phonenumber.PhoneNumber num = utl.parse( phone, "" );
            val =  utl.getRegionCodeForNumber( num );
        }
        catch ( Exception e )
        {
            val = "";
        }

        return val;
    }

    //
    public static boolean is_possible_number( String phone, String region )
    {
        return PhoneNumberUtil.getInstance().isPossibleNumber( phone, region );
    }

    //
    public static boolean is_valid_for_region( String phone, String region )
    {
        boolean ok = false;

        PhoneNumberUtil utl = PhoneNumberUtil.getInstance();

        try
        {
            Phonenumber.PhoneNumber num = utl.parse( phone, region );
            ok = utl.isValidNumberForRegion( num, region );
        }
        catch ( Exception e )
        {
            ok = false;
        }

        return ok;
    }

    //
    public static Set<String> get_supported_regions()
    {
        PhoneNumberUtil utl = PhoneNumberUtil.getInstance();
        return utl.getSupportedRegions();
    }

    //
    public static int get_type( String phone, String region )
    {
        PhoneNumberUtil utl = PhoneNumberUtil.getInstance();
        int val = TYPE_UNKNOWN;

        try
        {
            Phonenumber.PhoneNumber num = utl.parse( phone, region );
            val =  enum_to_type( utl.getNumberType( num ) );
        }
        catch ( Exception e )
        {
            val = TYPE_UNKNOWN;
        }

        return val;
    }

    //
    public static int get_countrycode( String phone, String region )
    {
        PhoneNumberUtil utl = PhoneNumberUtil.getInstance();
        int val = 0;

        try
        {
            Phonenumber.PhoneNumber num = utl.parse( phone, region );
            val = num.getCountryCode();
        }
        catch ( Exception e )
        {
            val = 0;
        }

        return val;
    }

    //
    public static long get_national( String phone, String region )
    {
        PhoneNumberUtil utl = PhoneNumberUtil.getInstance();
        long val = 0;

        try
        {
            Phonenumber.PhoneNumber num = utl.parse( phone, region );
            val = num.getNationalNumber();
        }
        catch ( Exception e )
        {
            val = 0;
        }

        return val;
    }

    //
    public static String truncate_number( String phone )
    {
        PhoneNumberUtil utl = PhoneNumberUtil.getInstance();
        String val = "";

        try
        {
            Phonenumber.PhoneNumber num = utl.parse( phone, "" );
            val = format( phone, "", FORMAT_INTERNATIONAL );
        }
        catch ( Exception e )
        {
            val = phone;
        }

        return val;
    }

    //
    public static String probable( String phone, int style )
    {
        String val = "";
        PhoneNumber num;
        PhoneNumberUtil utl = PhoneNumberUtil.getInstance();

        try
        {
            num = utl.parse( phone, "" );

            if ( utl.isPossibleNumber( num ) )
            {
                // try US first
                try
                {
                    num = utl.parse( phone, "US" );

                    if ( utl.isValidNumberForRegion( num, "US" ) )
                        val = format( phone, "US", style );
                }
                catch ( Exception e ) {}

                // if US, does match, then find the first probable country in the supported list
                if ( val.length() == 0 )
                {
                    try
                    {
                        for ( String reg : utl.getSupportedRegions() )
                        {
                            // skip over US, since we tried that already
                            if ( ! reg.equalsIgnoreCase( "US" ) )
                            {
                                num = utl.parse( phone, reg );

                                if ( utl.isValidNumberForRegion( num, reg ) )
                                {
                                    val = format( phone, reg, style );
                                    break;  // find the first one
                                }
                            }
                        }
                    }
                    catch ( Exception e ) {}
                }
            }
        }
        catch ( Exception e ) {}

        return val;
    }
}
