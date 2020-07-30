import 'package:flutter_time/enums/location.dart';

class LocationUrl {
  Location location;
  Map<Location, String> _locationUrlMap = {
    Location.London: "/Europe/London",
    Location.LosAngeles: "/America/Los_Angeles",
    Location.Warsaw: "/Europe/Warsaw",
  };

  LocationUrl({this.location});

  @override
  String toString() {
    return _locationUrlMap[location];
  }
}
