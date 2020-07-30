import 'package:flutter_time/enums/location.dart';

class LocationNameService {
  LocationNameService();

  Map _locationMap = {
    Location.London: "London",
    Location.Warsaw: "Warsaw",
    Location.LosAngeles: "Los Angeles",
  };

  String getName(Location location) {
    return _locationMap[location];
  }
}
