import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Pages/home_pages.dart';
import 'Pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primaryColor: Colors.purple,
          fontFamily: GoogleFonts.lato().fontFamily),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the Login Screen widget.
        '/': (context) => LoginPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => HomePage(),
      },
    );
  }
}
