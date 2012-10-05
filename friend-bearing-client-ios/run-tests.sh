#!/bin/bash
set -e
xcodebuild -project friend-bearing-client-ios-lib/friend-bearing-client-ios-lib.xcodeproj -target friend-bearing-client-ios-libTests -sdk iphonesimulator5.1 -configuration Release clean build TEST_AFTER_BUILD=yes
