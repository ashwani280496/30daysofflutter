import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: (Store.items != null && Store.items.isNotEmpty)
          ? ListView.builder(
              itemCount: Store.items.length,
              itemBuilder: (context, index) {
                return ItemWidget(item: Store.items[index]);
              })
          : Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
      drawer: MyDrawer(),
    );
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString('assets/files/catalog.json');
    var decodedData = jsonDecode(catalogJson); // it is  Json string
    final productData = decodedData['products']; // it is in map form
    Store.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }
}
