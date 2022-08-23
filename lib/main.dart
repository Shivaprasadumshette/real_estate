import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:real_estate/utils/constants.dart';
import 'package:real_estate/screens/LandingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'design1',
      theme: ThemeData(
          primaryColor: COLOR_WHITE,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: COLOR_DARK_BLUE),
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          fontFamily: "Montserrats"),
      home: LandingPage(),
    );
  }
}
