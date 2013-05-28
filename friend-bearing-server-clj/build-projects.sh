#!/bin/bash -ex

for PROJECT in lib webservice server
do
    echo "> Started building $PROJECT"
    cd $PROJECT
    lein clean
    lein deps
    lein install
    cd ..
    echo "> Done building $PROJECT"
done

