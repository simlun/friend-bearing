#!/bin/bash
set -e

cd integration-test-utils/stubbed-webserver
lein ring server-headless &
webserver_pid=$!
cd ../..

echo "Waiting for stubbed web server to start on port 3000"
until curl http://localhost:3000/ &> /dev/null
do
  printf '.'
  sleep 1
done

set +e
xcodebuild -project friend-bearing-client-ios-lib/friend-bearing-client-ios-lib.xcodeproj -target friend-bearing-client-ios-libIntegrationTests -sdk iphonesimulator6.0 -configuration Release clean build TEST_AFTER_BUILD=yes
set -e

echo "Killing stubbed web server process"
kill $(ps | grep "friend-bearing-client-ios/integration-test-utils/stubbed-webserver" | cut -f 1 -d ' ' | head -n 1)

