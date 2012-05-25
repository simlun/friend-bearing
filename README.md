# Friend Bearing

My name is Simon Lundmark and this is a pet (software development) project of mine.


## Project Goals

The goals of this project are purely selfish. I want...

- ... a pet (software development) project of my own, to fiddle with on my spare time.
- ... to learn the Objective-C programming language.
- ... to learn the Clojure programming language.
- ... to release an app in the iOS App Store.
- ... to create this app using TDD.


## App Pitch

_It can be hard to be away from your friends and family for a prolonged time. Perhaps your friend is studying abroad. Maybe you are a parent and your adult child have a job that requires traveling. Just knowing in what direction someone is might sooth your worried soul._

_Go outside to an elevated place where you can see the horizon. Open up the "Friend Bearing" app in your smartphone. Select who you are looking for, and slowly start turning around until you feel a buzz and the app shows you the exact direction of that person. Look up and know that far far away - that's the direction of your dear friend._


## Architectural Decisions

- The main model is a client/server model.
- The client will be implemented as two modules written in Objective-C:
 	1. A `Client Library` module which contains all "client business logic". This part only specifies the GUI, it does not implement it or knows exactly how the app will look.
	2. An `iOS App` module which only contains "view logic". It will depend on the `Client Library` and gets its functionality that way.
- The server will be implemented as four modules, all written in Clojure:
	1. A main `Server Library` module. Responsible for all "server business logic". By default this module lives entirely in-memory, the full server state is lost on server restart.
	2. A `Web Service` module. Implements the delivery mechanism of the `Server Library` for communicating with the `Client Library`.
	3. A `Data` module. Responsible for persisting `Server Library` data between server restarts and such.
	4. A `Backend` module, which combines the `Web Service` and `Data` modules.

Notice how both the `Client Library` and `Server Library` are free from dependencies (they only depend on the implicit protocol between them). This will allow me to focus on the business logic, implement use cases free from complex dependencies like database systems, graphical user interfaces, web services and stuff like that.

Dependencies:
```
                       +----------------+
                       | Server Library |
                       +----------------+
                          /         \
                         /           \
            +-------------+         +------+
            | Web Service |         | Data |
            +-------------+         +------+
                        \            /
                         \          /
                          +---------+
                          | Backend |
                          +---------+
```


## Git Repository Structure

Client:

- `friend-bearing-client-ios/friend-bearing-client-ios-lib`: `Client Library`
- `friend-bearing-client-ios/friend-bearing-client-ios-app`: `iOS App`

Server:

- `friend-bearing-server-lib`: `Server Library`
- `friend-bearing-server-webservice`: `Web Service`
- `friend-bearing-server-data`: `Data`
- `friend-bearing-server`: `Backend`


## Features / Use Cases

_TODO: Link to a [Trello](http://www.trello.com/) board?_


## Future Ideas / Brainstorming

_TODO: Move this to a [Trello](http://www.trello.com/) board?_

- Only update location while app is opened?
- Use Google Latitude API for updating location?
- When both are using the app at the same time and are turned towards each other, it switches to webcam mode? (or initiates a FaceTime call)?
- Vibrate when you are turned towards your friend?
- Send a notification to notify that someone detected your location, someone thought of you?
- Show a picture of the friend when directed towards it. Use some kind of photo frame as UI?
- Only share angles publicly to increase personal integrity?
- Use formulas from the [Calculate distance, bearing and more between Latitude/Longitude points](http://www.movable-type.co.uk/scripts/latlong.html) website to calculate the bearing.

## License

Copyright © 2012 Simon Lundmark &lt;<simon.lundmark@gmail.com>&gt;. All rights reserved.