import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catelog/models/Item.dart';
import 'package:flutter_catelog/widgets/myDrawer.dart';
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
                  if (Store.items != null && Store.items.isNotEmpty)
                    Expanded(child: CatelogList())
                  else
                    Center(
                      child: CircularProgressIndicator(),
                    ),
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

class CateglogHeader extends StatelessWidget {
  const CateglogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catelog App".text.xl5.color(MyThemes.blueishColor).bold.make(),
        "Trending Apps".text.xl2.make()
      ],
    );
  }
}

class CatelogList extends StatelessWidget {
  const CatelogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Store.items.length,
      itemBuilder: (context, index) {
        final catelog = Store.items[index];
        return CateglogItem(categlog: catelog);
      },
    );
  }
}

class CateglogItem extends StatelessWidget {
  final Item categlog;
  const CateglogItem({Key? key, required this.categlog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatelogImage(image: categlog.image),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            categlog.name.text.lg.bold.color(MyThemes.blueishColor).make(),
            categlog.desc.text.textStyle(context.captionStyle!).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${categlog.price}".text.bold.make(),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyThemes.blueishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    onPressed: () {},
                    child: "Buy".text.bold.make())
              ],
            )
          ],
        ))
      ],
    )).white.square(150).make().py16();
  }
}

class CatelogImage extends StatelessWidget {
  final String image;
  const CatelogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyThemes.creamyColor)
        .make()
        .p16()
        .w40(context);
  }
}
