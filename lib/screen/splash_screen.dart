// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:demo_news/screen/home_page.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 10),
          () => Navigator.pushNamed(context, 'home_page')

    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[200],
      body: Container(
        child: Center(
          child: Text(
            "Demo News",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}