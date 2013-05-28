#!/bin/bash -ex

for PROJECT in lib webservice server
do
    echo "> Started testing $PROJECT"
    cd $PROJECT
    lein midje
    cd ..
    echo "> Done testing $PROJECT"
done

