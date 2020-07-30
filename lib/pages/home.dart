import 'dart:async';

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
  Timer timer;
  FlagService flagService = FlagService();
  LocationNameService locationNameService = LocationNameService();
  DateFormatService dateFormatService = DateFormatService();
  DayNightService dayNightService = DayNightService();

  @override
  void initState() {
    super.initState();

    setUpTimer();
  }

  void setUpTimer() {
    if (timer != null) {
      timer.cancel();
    }

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      var newDateTime = locationTime.dateTime.add(Duration(seconds: 1));

      setState(() {
        locationTime = LocationTime(
            dateTime: newDateTime, location: locationTime.location);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;

    if (locationTime == null) {
      setState(() {
        locationTime = arguments[locationTimeKey];
      });
    }

    setUpTimer();

    String locationName = locationNameService.getName(locationTime.location);
    String time = dateFormatService.formatTime(locationTime.dateTime);
    bool isDayTime = dayNightService.isDay(locationTime.dateTime);

    Color textColor = isDayTime ? Colors.black : Colors.white;
    Color backgroundColor = isDayTime ? Colors.blue[700] : Colors.blueGrey[900];
    String backgroundImage = isDayTime ? 'assets/day.png' : 'assets/night.png';

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(backgroundImage), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');

                      if (result != null) {
                        setState(() {
                          locationTime = result[locationTimeKey];
                        });
                      }
                      setUpTimer();
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: textColor,
                    ),
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
          ),
        )));
  }
}
