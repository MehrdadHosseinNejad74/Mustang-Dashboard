import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mustang_dashboard/constant.dart';
import 'package:mustang_dashboard/screen/login/screen/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mustang Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          accentColor: kAccentColor,
          backgroundColor: kBackgroundColor,
          primaryColor: kBackgroundColor,
          textTheme: TextTheme(
              subtitle1: GoogleFonts.montserrat(
                color: kPrimaryTextColor,
                letterSpacing: 2,
                fontWeight: FontWeight.w200,
              ),
              bodyText1: GoogleFonts.montserrat(
                color: kPrimaryTextColor,
                letterSpacing: 1,
                fontWeight: FontWeight.w300,
              ),
              bodyText2: GoogleFonts.montserrat(
                color: kSecondaryTextColor,
                letterSpacing: 1,
                fontWeight: FontWeight.w200,
              ))),
      home: LoginScreen(),
    );
  }
}
