#!/bin/bash -ex

for PROJECT in lib webservice server
do
    echo "> Started testing $PROJECT"
    cd $PROJECT
    lein clean
    lein deps
    lein midje
    lein install
    cd ..
    echo "> Done testing $PROJECT"
done

