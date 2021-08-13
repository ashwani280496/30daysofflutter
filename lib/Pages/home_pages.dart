import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catelog/Helper/routes.dart';
import 'package:flutter_catelog/core/store.dart';
import 'dart:convert';
import 'package:flutter_catelog/models/Item.dart';
import 'package:flutter_catelog/models/cart_model.dart';
import 'package:flutter_catelog/widgets/home_widget/catalog_header.dart';
import 'package:flutter_catelog/widgets/home_widget/catalog_list.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxConsumer(
          notifications: {},
          mutations: {RemoveMutation, AddMutation},
          builder: (context, _, _1) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cart),
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
            backgroundColor: context.theme.buttonColor,
          ).badge(
              color: Vx.red500,
              size: 25,
              count: _cart.cartItems.length,
              textStyle:
                  TextStyle(color: Vx.black, fontWeight: FontWeight.bold)),
        ),
        body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CateglogHeader(),
                  if (CatelogModel.items.isNotEmpty)
                    Expanded(child: CatelogList().pOnly(top: 16))
                  else
                    CircularProgressIndicator().centered().expand(),
                ],
              )),
        ));
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final catalogJson =
    //     await rootBundle.loadString('assets/files/catalog.json');

    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;

    var decodedData = jsonDecode(catalogJson); // it is  Json string
    final productData = decodedData['products']; // it is in map form
    CatelogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }
}
