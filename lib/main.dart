import 'package:demo_news/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo_news/screen/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final routes = {
    'splash_screen': (BuildContext context) => Screen(),
    'home_page' : (BuildContext context) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'splash_screen',
      routes: routes,
      debugShowCheckedModeBanner: false,

    );
  }
}




