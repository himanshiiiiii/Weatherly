
import 'package:flutter/material.dart';
import 'package:weather_app/home.dart';
import 'package:weather_app/loading.dart';
import 'package:weather_app/location.dart';
void main() {
  runApp( MaterialApp(
    // home: Home(),
    debugShowCheckedModeBanner: false,
    routes: {
  "/" :(context)=>Loading(),
    "/home" : (context)=>Home(),
    },
  ));
}

