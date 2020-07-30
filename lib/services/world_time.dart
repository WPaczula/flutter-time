import 'package:http/http.dart';
import 'dart:convert';

class WorldTimeService {
  WorldTimeService();

  Future<DateTime> getTime({String locationUrl}) async {
    Response response =
        await get('http://worldtimeapi.org/api/timezoddne/$locationUrl');
    Map data = jsonDecode((response.body));

    String dateTime = data['datetime'];
    String offset = data['utc_offset'];
    int offsetHours = int.parse(offset.substring(1, 3));

    DateTime now = DateTime.parse(dateTime);

    return now.add(Duration(hours: offsetHours));
  }
}
