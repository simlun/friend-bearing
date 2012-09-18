Friend Bearing iOS Client
=========================

Development Environment
-----------------------

Since Xcode is not very intuitive when it comes to creating a modularized workspace, here follows a quick tutorial on how to get started with running the tests and developing the iOS client.

1. `$ git clone git@github.com:simlun/friend-bearing.git` (or perhaps your fork of the project?)
2. Open Xcode (Version 4.4.1 on Mac OS X 10.8.1 was used while writing this tutorial)
3. _File_, _New_, _Workspace..._
4. Save it as `friend-bearing/friend-bearing-client-ios/friend-bearing.xcworkspace`
5. _File_, _Add Files to "friend-bearing"..._
6. Add the `friend-bearing/friend-bearing-client-ios/friend-bearing-client-ios-lib/friend-bearing-client-ios-lib.xcodeproj` project to the workspace. Make sure _Copy items into destination group's folder (if needed)_ is unchecked.
7. Right click an empty area below the recently imported project in the Project Navigator. There you will find the _Add Files to "friend-bearing"..._ choice again. Now add the `friend-bearing/friend-bearing-client-ios/friend-bearing-client-ios-app/friend-bearing-client-ios-app.xcodeproj` project.
8. _File_, _Workspace Settings..._
9. Change _Derived Data Location_ to _Workspace-relative_

Now running the unit tests for the `-lib` project should be successful, and starting the `-app` project in the simulator should work too.
