#!/bin/bash -ex

for PROJECT in domain webservice server
do
    echo "> Started testing $PROJECT"
    cd $PROJECT
    lein midje
    cd ..
    echo "> Done testing $PROJECT"
done

