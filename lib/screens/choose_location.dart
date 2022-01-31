import 'package:flutter/material.dart';
import 'package:world_clock/services/servers.dart';



class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations =[
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png', isDayTime: true, time: 'now.hour'),
    WorldTime(url: 'Europe/Athens', location: 'Greece', flag: 'greece.png', isDayTime: true, time: 'now.hour'),
    WorldTime(url: 'Europe/Berlin', location: 'Germany', flag: 'germany.png', isDayTime: true, time: 'now.hour'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png', isDayTime: true, time: 'now.hour'),
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'nigeria.png', isDayTime: true, time: 'now.hour'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png', isDayTime: true, time: 'now.hour'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png', isDayTime: true, time: 'now.hour'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png', isDayTime: true, time: 'now.hour'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png', isDayTime: true, time: 'now.hour'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png', isDayTime: true, time: 'now.hour'),
    WorldTime(url: 'America/Ottawa', location: 'Ottawa', flag: 'canada.png', isDayTime: true, time: 'now.hour'),
    WorldTime(url: 'Asia/Beijing', location: 'Beijing', flag: 'china.png', isDayTime: true, time: 'now.hour'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'france.png', isDayTime: true, time: 'now.hour'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'spain.png', isDayTime: true, time: 'now.hour'),
    WorldTime(url: 'Russia/Moscow', location: 'Moscow', flag: 'russia.png', isDayTime: true, time: 'now.hour'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigating to home screen
     Navigator.pop(context, {
       'location': instance.location,
       'flag': instance.flag,
       'time': instance.time,
       'isDayTime': instance.isDayTime,
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                     backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          })
    );
  }
}
