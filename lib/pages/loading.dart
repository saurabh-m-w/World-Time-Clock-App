import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getworldTime() async{
    World_Time instance = World_Time(location: 'India',flag: 'india.png',url:'Asia/Kolkata');
     await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {'location':instance.location,'time':instance.time,'flag':instance.flag,'isdaytime':instance.isdaytime});

  }

  @override
  void initState() {
    super.initState();
    getworldTime();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
          child:  SpinKitFadingCube(
            color: Colors.white,
            size: 80.0,
          ),
      ),
    );
  }
}
