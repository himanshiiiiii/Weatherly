
import 'dart:convert';
import 'dart:math';
import 'dart:core';
import 'package:flutter/src/widgets/routes.dart';
import 'package:weather_app/loading.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/loading.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_app/worker/get.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import 'loading.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchcontroller=new TextEditingController();
String temper="";
String hum="";
String air_speed="";
String des="";
String main_desc="";
String icon_="";
String t="";
String i="";
String h="";
String air="";
String d="";
String c="Lucknow";
String md="";
void startApp() async
{
 worker instance= worker(location: "$c");
 await instance.getData();
 temper=instance.temp;
 hum=instance.humidity;
 air_speed=instance.air_speed;
 des=instance.description;
 main_desc=instance.main;
 icon_=instance.icon;
 c=instance.location;
}

@override
  void initState() {
    // TODO: implement initState

    super.initState();
    startApp();
  }
  // @override
  // void dispose() {
    // TODO: implement dispose
  //
  //
  // }
  @override
  Widget build(BuildContext context) {
 // final Map<String,dynamic> search=ModalRoute.of(context).settings.arguments;
  var city_name=["Mumbai","Delhi","Ghaziabad","Lucknow","Chennai","Kolkata","London","Kanpur"];
  final rand=new Random();
  var city = city_name[rand.nextInt(city_name.length)];
   t=temper.toString().substring(0,4) ;
   i=icon_;
   h=hum;
   // air=air_speed.toString().substring(0,4);
   d=des;
   md=main_desc;
  // print("$t");
  // t= int.parse("temper");
  // Map info=ModalRoute.of(context).settings.arguments as Map<String,String>;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(3),
        child: AppBar(
          title: Text("rf"),
          backgroundColor: Colors.teal,
        ),
      ),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(0),
      //   child: NewGradientAppBar(
      //     gradient:LinearGradient(
      //       colors: [
      //         Colors.teal,
      //         Colors.yellowAccent,
      //         Colors.blue,
      // //       ]
      //     ) ,
      //   )
      // ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  // 0.1,
                  0.2 ,
                  0.9,

                ],
                colors: [
                  // Colors.teal,
                  // Colors.yellow
                  Colors.blue,
                  Colors.yellowAccent,
                   // Colors.teal
                ]
            )
          ),
          child: Column(
            children: [
              Container(

                padding: EdgeInsets.symmetric(horizontal: 8.0),
                margin: EdgeInsets.symmetric(vertical: 15.0,horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  children: [
                  GestureDetector(
                    onTap: (){
                      // String rawJson='{ "searchText":searchcontroller.text}';
                      // Map<String, dynamic> map = jsonDecode(rawJson);
                      // print(searchcontroller.text);
                      // Navigator.pushNamed(context,VerifyCode.Loading(),arguments: map);
                    },
                    child: Container(child: Icon(Icons.search),
                    padding: EdgeInsets.fromLTRB(3, 0, 10, 0),),
                  ),
                Expanded(
                  child: TextField(
                    controller: searchcontroller,
                    decoration: InputDecoration(
                      hintText: "Search $city",

                      border: InputBorder.none,
                    ),
                  ),
                )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        color: Colors.white.withOpacity(0.5),

                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Image.network("https://openweathermap.org/img/wn/10d@2x.png"),
                         SizedBox(
                           width: 10,
                         ),
                          Column(
                            children: [
                              Text("$d",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              Text("$c",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ],
                          )
                        ],
                      ),

                    ),
                  ),
                ],
              ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 200,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  color: Colors.white.withOpacity(0.5),

                ),
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
               Icon(WeatherIcons.thermometer),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("$t",style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold)),
                        Text("C",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                )

              ),
            ),
          ],
        ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        color: Colors.white.withOpacity(0.5),

                      ),
                      padding: EdgeInsets.all(30),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.day_windy),
                            ],
                          ),
SizedBox(
  height: 20,

),
                          Text("$air",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                          Text("km/hr",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                        ],
                      ),
height: 200,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        color: Colors.white.withOpacity(0.5),

                      ),
                      height: 200,
                      padding: EdgeInsets.all(30),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.humidity),
                            ],
                          ),
                          SizedBox(
                            height: 20,

                          ),
                          Text("$h",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
                          Text("percent",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                        ],
                      ),

                    ),
                  ),
                ],
              )
         ],
          ),
        ),
      ),
    );
  }
}


