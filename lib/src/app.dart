import 'package:flutter/material.dart';
import 'package:travel_app/src/utils/ColorLib.dart';
import './home.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        // textTheme: GoogleFonts.openSansTextTheme(
        //   Theme.of(context).textTheme,
        // ),
        // textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
        //   headline6: GoogleFonts.oswald(textStyle: textTheme.headline6),
        // ),
        primaryTextTheme: TextTheme(
          headline6:
              TextStyle(color: ColorLib.text, fontWeight: FontWeight.w700),
        ),
      ),
      home: Home(),
    );
  }
}
