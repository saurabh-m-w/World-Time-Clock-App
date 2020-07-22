import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class World_Time{
  String location,time,flag,url;
  bool isdaytime;
  World_Time({this.location,this.flag,this.url});

  Future<void> getTime() async
  {
    Response responce = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(responce.body);

    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));


    isdaytime = now.hour>6 && now.hour<19 ? true : false;
    time = DateFormat.jm().format(now);
  }
}

