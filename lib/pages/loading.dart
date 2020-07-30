import 'package:flutter/material.dart';
import 'package:flutter_time/constants/argument_keys.dart';
import 'package:flutter_time/constants/default_location.dart';
import 'package:flutter_time/models/location_time.dart';
import 'package:flutter_time/models/location_url.dart';
import 'package:flutter_time/services/world_time_service.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  void setUpWorldTime() async {
    var worldTimeService = WorldTimeService();
    var locationUrl = LocationUrl(location: defaultLocation);
    var currentTime = await worldTimeService.getTime(locationUrl: locationUrl);

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      locationTimeKey:
          LocationTime(dateTime: currentTime, location: defaultLocation)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text('Loading'),
        ),
      ),
    );
  }
}
