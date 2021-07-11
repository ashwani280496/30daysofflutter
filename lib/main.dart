import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catelog/Helper/routes.dart';
import 'package:flutter_catelog/widgets/themes.dart';
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
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: MyThemes.lightTheme(context),
      initialRoute: MyRoutes.home,
      // darkTheme: ThemeData(brightness: Brightness.dark),
      routes: {
        '/': (context) => LoginPage(),
        MyRoutes.home: (context) => HomePage(),
      },
    );
  }
}
