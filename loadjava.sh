#!/bin/bash

dir=$1
bin="jar"
jar="libphonenumber-7.0.jar PhoneNumberImpl.jar"

if [ "${dir}" = "" ] ; then

    dir=`pwd`

fi

if [ -d ${dir}/${bin} ] ; then

    for j in ${jar} ; do

        if [ ! -f ${dir}/${bin}/${j} ] ; then

            echo "Google binary release JAR [${dir}/${bin}/${j}] not found"
            exit 1

        fi

    done

else

    echo "Directory provided [${dir}] does not contain ./jar binary directory"
    exit 1

fi

sqlplus=`which sqlplus`

if [ ! -f ${sqlplus} ] ; then

    echo "SQL*Plus utility [sqlplus] cannot be found"
    exit 1

fi

cd ${dir}/${bin}

for j in ${jar} ; do

    j="`pwd`/${j}"

    if [ -f ${j} ] ; then

        rc=$?

        if [ ${rc} -eq 0 ] ; then

            echo "Loading JAR ${j} ..."

            ${sqlplus} -S "/ as sysdba" << !

                --
                whenever sqlerror exit sql.sqlcode;

                --
                exec dbms_java.loadjava('-v -resolve -schema google ${j}' );

                --
                set serveroutput on
                declare

                    c number := 0;

                begin

                    select count(0) into c
                      from dba_tables
                     where owner = 'GOGGLE'
                       and table_name = 'CREATE\$JAVA\$LOB\$TABLE';

                    if ( c > 0 ) then

                        execute immediate 'select count(0) from google\$java\$lob\$table'
                           into c;

                        if ( c = 0 ) then

                            execute immediate 'drop table google\$java\$lob\$table purge';

                        else

                            dbms_output.put_line( 'Refused to drop load table [CREATEi\$JAVAi\$LOB\$TABLE], with existing data' );

                        end if;

                    end if;

                end;
                /
!
            rc=$?

            if [ ${rc} -ne 0 ] ; then

                echo "Failed to clean up Load Table, may need manual intervention"
                exit $?
            fi

        else

            echo "Load Java falied with return code ${rc}"
            exit ${rc}

        fi

    else

        echo "JAR ${j} does not exist"
        exit 1

    fi

done

exit ${rc}
