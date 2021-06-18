import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Material(
        child: Center(
          child: Container(
            child: Text("Welcome to flutter"),
          ),
        ),
      ),
    );
  }
}
