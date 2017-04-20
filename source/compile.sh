#!/bin/bash

dir=$1
src="jar"
cls="libphonenumber.jar"
flg="-XDignore.symbol.file -Xlint:unchecked"

if [[ -z ${ORACLE_HOME} ]] ; then

    echo "\$ORACLE_HOME is not set"
    exit 1

fi

javac="$ORACLE_HOME/jdk/bin/javac"
jar="$ORACLE_HOME/jdk/bin/jar"

#
function compile()
{
    local f=$1
    local r

    if [ -f ${f} ] ; then

        echo -n "Compiling $f ... "

        ${javac} ${flg} -cp ${cls} ${f}
        r=$?

        if [ ${r} -ne 0 ] ; then

            exit ${r}

        fi
        echo ""

    else

        echo "Could not find source file [${f}] to compile!"
        exit 1

    fi
}

if [[ -z ${javac} ]] ; then

    echo "Could not find java compailer (javac)!"
    exit 1

else

    if [ ! -f ${javac} ] ; then

        echo "File not found: ${javac}"
        exit 1

    fi

fi

if [[ -z ${jar} ]] ; then

    echo "Could not find java archiver (jar)!"
    exit 1

else

    if [ ! -f ${jar} ] ; then

        echo "File not found: ${jar}"
        exit 1

    fi

fi

if [ "${dir}" = "" ] ; then

    dir=`pwd`

fi

if [ -d ${dir}/${src} ] ; then

    if [ -f ${dir}/${src}/${cls} ] ; then

        cd ${dir}/${src}

        compile PhoneNumberImpl.java

        ${jar} cvf PhoneNumberImpl.jar *.class

        rm -f *.class 2>/dev/null

    else

        echo "Google binary release JAR [${dir}/${src}] not found"
        exit 1

    fi

else

    echo "Directory provided [${dir}] does not contain ./${src} directory"
    exit 1

fi

exit 0
