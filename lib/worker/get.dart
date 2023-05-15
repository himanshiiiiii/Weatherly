import 'package:flutter/material.dart';
import 'package:http/http.dart' ;
import 'dart:convert';
class worker{
  String location="";

  //constructor
  worker({required this.location})
  {
 location=this.location;
  }

  String temp="";
  String humidity="";
  String air_speed="";
String description="";
  String main ="";
  String icon="";
  String l="";
  //method
 Future <void> getData() async
  {
    try{
      Response response = await get( Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=a19003e3dc2a7bb526066305a5214060"));
      Map data=jsonDecode(response.body );

      print(data);
      //get temp,humidity
      Map temp_data=data['main'];
      double getTemp=temp_data['temp']-273.15;
      String getHumidity=temp_data['humidity'].toString();

      //description
      List weather_data=data['weather'];
      Map main_weather_data=weather_data[0];
      String getmain_des=main_weather_data['main'];
      String getdesc=main_weather_data['description'];
       icon=main_weather_data["icon"].toString();
       print(icon);
      //airspeed
      Map wind=data['wind'];
      double getAir_speed=wind['speed']/0.2777777777778;

      //assigning values
      temp=getTemp.toString();
      humidity=getHumidity;
      air_speed=getAir_speed.toString();
      description=getdesc;
      main =getmain_des;
    }
    catch(e) {
      temp="error occurred";
      humidity="error occurred";
      air_speed="error occurred";
      description="error occurred";
      main ="error occurred";
      icon="03n";
    }


  }

}
