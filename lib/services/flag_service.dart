import 'package:flutter_time/enums/location.dart';

class FlagService {
  FlagService();

  Map<Location, String> _flagMap = {
    Location.London: 'assets/england.png',
    Location.Warsaw: 'assets/poland.png',
    Location.LosAngeles: 'assets/usa.png',
  };

  String getFlag(Location location) {
    var flag = _flagMap[location];

    if (flag == null) {
      throw Exception('Flag not found');
    }

    return flag;
  }
}
