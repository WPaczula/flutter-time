import 'package:flutter/material.dart';
import 'package:flutter_time/constants/argument_keys.dart';
import 'package:flutter_time/enums/location.dart';
import 'package:flutter_time/models/location_time.dart';
import 'package:flutter_time/models/location_url.dart';
import 'package:flutter_time/services/flag_service.dart';
import 'package:flutter_time/services/location_name_service.dart';
import 'package:flutter_time/services/world_time_service.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<Location> locations = Location.values;
  FlagService flagService = FlagService();
  LocationNameService locationNameService = LocationNameService();
  WorldTimeService worldTimeService = WorldTimeService();

  void updateTime(Location location) async {
    DateTime time =
        await worldTimeService.getTime(LocationUrl(location: location));
    LocationTime locationTime =
        LocationTime(dateTime: time, location: location);

    Navigator.pop(context, {locationTimeKey: locationTime});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            var location = locations[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(location);
                  },
                  title: Text(locationNameService.getName(location)),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(flagService.getFlag(location)),
                  ),
                ),
              ),
            );
          },
          itemCount: locations.length),
    );
  }
}
