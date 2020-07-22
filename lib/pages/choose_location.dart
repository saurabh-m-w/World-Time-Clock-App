import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class chooseLocation extends StatefulWidget {
  @override
  _chooseLocationState createState() => _chooseLocationState();
}

class _chooseLocationState extends State<chooseLocation> {

  List<World_Time> locations = [
    World_Time(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
    World_Time(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    World_Time(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    World_Time(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    World_Time(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    World_Time(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    World_Time(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    World_Time(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
  ];

  void updateTime(index) async
  {
      World_Time instance = locations[index];

      await instance.getTime();

      Navigator.pop(context,{
        'location':instance.location,'time':instance.time,'flag':instance.flag,'isdaytime':instance.isdaytime
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(backgroundColor: Colors.blue[900],title: Text('Choose Location'),centerTitle: true,),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
                  child: Card(
                    child: ListTile(
                      onTap: (){updateTime(index); },
                      title: Text(locations[index].location),
                      leading: CircleAvatar(backgroundImage: AssetImage('assets/${locations[index].flag}'),),
                    ),
                  ),
                );
          }

      ),
    );
  }
}
