#!/bin/bash
set -e
xcodebuild -project friend-bearing-client-ios-lib/friend-bearing-client-ios-lib.xcodeproj -target friend-bearing-client-ios-libTests -sdk iphonesimulator6.0 -configuration Release clean build TEST_AFTER_BUILD=yes
