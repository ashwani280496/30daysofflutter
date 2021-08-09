import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catelog/models/Item.dart';
import 'package:flutter_catelog/widgets/home_widget/catalog_header.dart';
import 'package:flutter_catelog/widgets/home_widget/catalog_list.dart';
import 'package:flutter_catelog/widgets/themes.dart';
import "package:velocity_x/velocity_x.dart";

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
        backgroundColor: MyThemes.creamyColor,
        body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CateglogHeader(),
                  if (Store.items.isNotEmpty)
                    Expanded(child: CatelogList().pOnly(top: 16))
                  else
                    CircularProgressIndicator().centered().expand(),
                ],
              )),
        ));
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
