import 'package:flutter/material.dart';
import 'package:recap/pages/loading.dart';
import 'package:recap/pages/home.dart';
import 'package:recap/pages/choose_location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation()
      },
    );
  }
}

