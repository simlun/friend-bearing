#!/bin/bash -x
set +e

for PROJECT in lib webservice server
do
    echo "> Started testing $PROJECT"
    cd $PROJECT
    lein clean
    lein deps
    lein test
    lein install
    cd ..
    echo "> Done testing $PROJECT"
done

