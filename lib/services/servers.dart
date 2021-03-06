import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({ required this.location, required this.time,
    required this.flag, required this.isDayTime, required this.url });

  Future<void> getTime() async{

    try {
      //make request to get time data
      Response response = await get(Uri.parse(
          'http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //this is to set the time property
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('Caught Error: $e');
      time = 'Unable to fetch time';
    }


  }

}

