import 'package:flutter_time/enums/location.dart';

class LocationUrl {
  Location location;
  Map<Location, String> _locationUrlMap = {
    Location.London: "/Europe/London",
    Location.LosAngeles: "/NorthAmerica/LosAngeles",
    Location.Warsaw: "/Europe/Warsaw",
  };

  LocationUrl({this.location});

  @override
  String toString() {
    return _locationUrlMap[location];
  }
}
