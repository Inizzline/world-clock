import 'package:flutter/material.dart';
import 'package:world_clock/screens/choose_location.dart';
import 'package:world_clock/screens/home_screen.dart';
import 'package:world_clock/screens/loading.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'World Clock',
     initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home_screen': (context) => HomeScreen(),
        '/choose_location': (context) => ChooseLocation(),
      },
    );
  }
}
