import 'package:flutter/material.dart';
import 'package:flutter_catelog/models/Item.dart';
import 'package:flutter_catelog/widgets/item_widget.dart';
import 'package:flutter_catelog/widgets/myDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(50, (index) => Store.items.first);
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: dummyList[index]);
          }),
      drawer: MyDrawer(),
    );
  }
}
