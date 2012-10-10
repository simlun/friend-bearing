#!/bin/bash
set -e

# TODO: Start a web server so the integration tests have something to integrate with

xcodebuild -project friend-bearing-client-ios-lib/friend-bearing-client-ios-lib.xcodeproj -target friend-bearing-client-ios-libIntegrationTests -sdk iphonesimulator6.0 -configuration Release clean build TEST_AFTER_BUILD=yes
