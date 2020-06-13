import 'package:flutter/material.dart';
import 'package:travel_app/src/utils/ColorLib.dart';
import './home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discount Tour',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        primaryTextTheme: TextTheme(
          headline6:
              TextStyle(color: ColorLib.text, fontWeight: FontWeight.w700),
        ),
      ),
      home: Home(),
    );
  }
}
