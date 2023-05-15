import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/home.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

backgroundColor: Colors.white12,
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/sun.png",height: 200,width: 200,),
            Text("Weather App",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 35),),
          Text("Made by Himanshi",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 15),),
       SizedBox(
         height: 30,
       ),
        SpinKitWave(
          color: Colors.blue,
          size: 50.0,
        ),
  SizedBox(
    height: 80,
  ),
FloatingActionButton(onPressed: (){
   Navigator.pushReplacementNamed(context, '/home');

},backgroundColor: Colors.yellowAccent,
  child: TextButton.icon(onPressed:(){
    Future.delayed(Duration(seconds: 2),(){Navigator.pushReplacementNamed(context, '/home');}
    );
    }, icon: Icon(Icons.forward,color: Colors.blue,), label: Text("")),
)
  // TextButton(onPressed: (){
  //   Navigator.pushReplacementNamed(context, '/home');
  // }, child: Text("Explore"),
  // )
  // Navigator.pushReplacementNamed(context, '/home');
          ],
        )

      ), );
  }
}
