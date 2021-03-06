#!/bin/bash

#
if [[ -z ${@} ]] ; then

    echo "Usage $0 <connection>"
    exit 1

fi

#
dts=`date +%Y%m%d%H%M%S`
dir=`dirname $0`

#
if [ `ls ${dir}/jar/*.jar | wc -l` -gt 0 ] ; then

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
    for jar in `ls ${dir}/jar/*.jar` ; do

        #
        ${dir}/loadjar.sh "${jar}" "${u}" "${p}" \
            | tee --append ${dir}/load-jdbc.${dts}.log

    done ;

    #
    et="`date +%Y-%b-%d` `date +%H:%M:%S`" ; et=${et^^}

    #
    echo                | tee --append ${dir}/load-jdbc.${dts}.log
    echo "Start: ${st}" | tee --append ${dir}/load-jdbc.${dts}.log
    echo "Ended: ${et}" | tee --append ${dir}/load-jdbc.${dts}.log
    echo                | tee --append ${dir}/load-jdbc.${dts}.log

else

    #
    echo "No Jar files to load found!"
    exit 1

fi

#
exit 0
