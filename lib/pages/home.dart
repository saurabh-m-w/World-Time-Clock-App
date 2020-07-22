import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data:ModalRoute.of(context).settings.arguments;

    String bgimage = data['isdaytime'] ? 'day.png':'night.png';
    Color bgcolor = data['isdaytime'] ? Colors.blue:Colors.indigo[900];
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(child:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgimage'),
            fit: BoxFit.cover,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(children: <Widget>[
            FlatButton.icon(
              onPressed: () async{
               dynamic result=await Navigator.pushNamed(context, '/location');
               setState(() {
                 data = {
                   'time':result['time'],
                   'location':result['location'],
                   'flag':result['flag'],
                   'isdaytime':result['isdaytime'],
                 };
               });
              },
              icon: Icon(Icons.edit_location,color: Colors.grey[300],),
              label: Text('Edit Location',style: TextStyle(color: Colors.grey[300]),),
              ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(data['location'],style: TextStyle(fontSize: 28.0,letterSpacing: 2,color: Colors.white),)
            ],),
            SizedBox(height: 20,),
            Text(data['time'],style: TextStyle(fontSize: 66,color: Colors.white),)
          ],),
        ),
      )),
    );
  }
}
