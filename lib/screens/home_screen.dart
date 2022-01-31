import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 Map data = {};


  @override
  Widget build(BuildContext context) {

  data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
  print(data);

  String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
  Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[800];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async{
                        dynamic result = await Navigator.pushNamed(context, '/choose_location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'flag': result['flag'],
                            'isDayTime': result['isDayTime']
                          };
                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text(
                          'Edit Location',
                        style: TextStyle(color: Colors.grey[300],
                        ),
                      ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text(data['location'],
                        style: const TextStyle(
                            fontSize: 30, letterSpacing: 2,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(data['time'],
                    style: const TextStyle(
                        fontSize: 60, color: Colors.white
                    ),
                  ),
                  Container(
                    child: const Text('Inzzline V 1.1.0',
                      style: TextStyle(
                          color: Colors.white,fontSize: 10
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
