# Diamond Kinetics Coding Challenge

A simple video search based on starting and endtime parameters.

## Key project details

- 30 mock video objects are created with a start time between 0 and 0.5 seconds and end time between 0.5 seconds and 1 second.

- Videos are sorted by start time in ascending order. 

- Video data is sorted in a "Live" format, on each action of segment controllers.

## Getting Started

Clone or download the VideoSearch repo.

### Prerequisites

This project does include the following pods:

Mixpanel,
Fabric,
Crashlytics

Due to including these analytic based pods you must first install them and create the xcode workspace. In order to install cocoapods enter the following line into Terminal.

```
Open Terminal
$ sudo gem install cocoapods 
```

### Installing

After installing cocoapods, follow the directions below to install all project dependencies.

```
cd VideoSearch
pod install
open VideoSearch.xcworkspace
```

## Running the application

Once all pods are installed and the workspace is open you are able to run the project.

## Built With

* [Crashlytics](https://try.crashlytics.com/) - Crash analytics
* [Fabric](https://get.fabric.io/ios) - Install and crash analytics
* [Mixpanel](https://mixpanel.com/help/) - Action analytics

## Versioning

I am using [SemVer](http://semver.org/) for versioning.

## Authors

* **Mike Stuck** - [www.mikestuck.com](http://www.mikestuck.com)

