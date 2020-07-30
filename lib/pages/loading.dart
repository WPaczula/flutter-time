import 'package:flutter/material.dart';
import 'package:flutter_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time;

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  void setUpWorldTime() async {
    var service = WorldTimeService();
    try {
      var currentTime = await service.getTime(locationUrl: '/Europe/Warsaw');
      setState(() {
        time = currentTime.toString();
      });
    } catch (e) {
      setState(() {
        time = 'Could not fetch the time';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(time == null ? 'Loading' : time),
        ),
      ),
    );
  }
}
