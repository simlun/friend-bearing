#!/bin/bash
set -e

cd friend-bearing-client-ios-lib/friend-bearing-client-ios-libIntegrationTests

prettifyAbbrevations() {
    sed 's/NS/Ns/g' | sed 's/URL/Url/g' | sed 's/HTTP/Http/g' | sed 's/JSON/Json/g'
}

for FILE in `ls *Test.m`
do
    echo
    FILE=`echo $FILE | prettifyAbbrevations`
    echo ">>>${FILE}:" | sed 's/\.m//g' | sed 's/Test:/:/g' | sed 's/\([A-Z]\)/_\1/g' | sed "s/_/ /g"
    grep -h "(void)test" "$FILE" | prettifyAbbrevations | cut -d '_' -f 2- | sed 's/\([A-Z]\)/_\1/g' | sed "s/_/ /g" | tr '[A-Z]' '[a-z]' | awk '''{ printf ("%s%s\n", toupper (substr ($0, 1, 1)), substr ($0, 2)); }''' | sed 's/.*/- &/g'
done
    
