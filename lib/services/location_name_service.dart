import 'package:flutter_time/enums/location.dart';

class LocationNameService {
  LocationNameService();

  Map<Location, String> _locationMap = {
    Location.London: "London",
    Location.Warsaw: "Warsaw",
    Location.LosAngeles: "Los Angeles",
  };

  String getName(Location location) {
    var name = _locationMap[location];

    if (name == null) {
      throw Exception("Name not found for location $location");
    }

    return name;
  }
}
