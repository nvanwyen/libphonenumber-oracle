#!/bin/bash

#
if [[ -z ${@} ]] ; then

    echo "Usage $0 <jar> [<connection>]"
    exit 1

fi

#
dts=`date +%Y%m%d%H%M%S`
dir=`dirname $0`

jar=$1 ; shift

#
if [ -f ${jar} ] ; then

    #
    u=$1
    p=$2

    #
    if [[ -z ${u} ]] ; then

        #
        echo -n "User [sys]: "
        read u

        #
        if [[ -z ${u} ]] ; then

            u="SYS"

        fi

    fi

    #
    if [[ -z ${u} ]] ; then

        #
        echo "User must be supplied!"
        exit 1

    fi

    #
    if [[ -z ${p} ]] ; then

        #
        echo -n "Password [none]: "
        read p

        #
        if [[ -z ${p} ]] ; then

            p="sys"

        fi

    fi

    #
    if [[ -z ${p} ]] ; then

        #
        echo "Password must be supplied!"
        exit 1

    fi

    #
    st="`date +%Y-%b-%d` `date +%H:%M:%S`" ; st=${st^^}

    #
    echo
    echo "Loading jar: ${jar}"

    #
    (
        loadjava -force \
                 -genmissing \
                 -order \
                 -verbose \
                 -resolve \
                 -recursivejars \
                 -resolver "((* google) (* sys) (* public))" \
                 -user "${u}" \
                 -schema google \
                 ${jar} << !
${p}

!
    ) 2>&1

    #
    et="`date +%Y-%b-%d` `date +%H:%M:%S`" ; et=${et^^}

    #
    echo
    echo "Jar Load start: ${st}"
    echo "Jar Load ended: ${et}"
    echo

else

    #
    echo "No Jar to load found!"
    exit 1

fi

#
exit $?
