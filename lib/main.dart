import 'package:flutter_time/pages/choose_location.dart';
import 'package:flutter_time/pages/home.dart';
import 'package:flutter_time/pages/loading.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/home', routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  }));
}
