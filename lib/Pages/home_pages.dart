import 'package:flutter/material.dart';
import 'package:flutter_catelog/widgets/myDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: [
              // Image.network(
              //     "https://homepages.cae.wisc.edu/~ece533/images/airplane.png")
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
