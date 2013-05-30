#!/bin/bash -ex

./build-projects.sh
./test-projects.sh
./test-system.sh

echo "$0 completed successfully"

