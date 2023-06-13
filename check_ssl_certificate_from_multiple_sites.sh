#!/usr/bin/env bash

# Sanity check
if [ -z $1 ];
then
    echo -e "\nUsage: $0 {domains_file} {output_file}";
    echo -e "\nPlease specify exiting 'domains_file' that has the fallowing format.\nExample: \n\twww.example1.com\n\twww.example2.com";
    exit;
fi

# Variables
domains=$1;
outputfile=$2;

if [ -f $domains ];
then
    DOMAINS=($(cat $domains | xargs))

    if [ ! -z $2 ];
    then
        for site in ${DOMAINS[@]};
        do
            echo "==================================================================================================" >> $outputfile ;
            echo "Website: $site" >> $outputfile;
            curl -kvI --connect-timeout 5 "https://$site" 2>&1 | awk '/Server certificate/,/issuer/ { print "\t"$0 }' >> $outputfile;
        done
    else
        for site in ${DOMAINS[@]};
        do
            echo "==================================================================================================";
            echo "Website: $site";
            curl -kvI --connect-timeout 5 "https://$site" 2>&1 | awk '/Server certificate/,/issuer/ { print "\t"$0 }';
        done
    fi
fi
