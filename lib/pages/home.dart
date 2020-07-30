import 'package:flutter/material.dart';
import 'package:flutter_time/constants/argument_keys.dart';
import 'package:flutter_time/models/location_time.dart';
import 'package:flutter_time/services/date_format_service.dart';
import 'package:flutter_time/services/day_night_service.dart';
import 'package:flutter_time/services/flag_service.dart';
import 'package:flutter_time/services/location_name_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LocationTime locationTime;
  FlagService flagService = FlagService();
  LocationNameService locationNameService = LocationNameService();
  DateFormatService dateFormatService = DateFormatService();
  DayNightService dayNightService = DayNightService();

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    LocationTime locationTime = arguments[locationTimeKey];
    String locationName = locationNameService.getName(locationTime.location);
    String time = dateFormatService.formatTime(locationTime.dateTime);
    bool isDayTime = dayNightService.isDay(locationTime.dateTime);

    Color textColor = isDayTime ? Colors.black : Colors.white;
    Color backgroundColor = isDayTime ? Colors.white : Colors.blueGrey[900];

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text(
                    "Edit location",
                    style: TextStyle(color: textColor),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(locationName,
                      style: TextStyle(
                          fontSize: 28, letterSpacing: 2, color: textColor)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(time, style: TextStyle(fontSize: 66, color: textColor))
            ],
          ),
        )));
  }
}
