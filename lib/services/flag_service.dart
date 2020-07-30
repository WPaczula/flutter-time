import 'package:flutter_time/enums/location.dart';

class FlagService {
  FlagService();

  Map _flagMap = {
    Location.London: 'assets/england.png',
    Location.Warsaw: 'assets/poland.png',
    Location.LosAngeles: 'assets/usa.png',
  };

  String getFlag({Location location}) {
    return _flagMap[location];
  }
}
