import 'package:flutter/material.dart';
import 'package:flutter_catelog/models/Item.dart';
import 'package:flutter_catelog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catelog;
  const HomeDetailsPage({Key? key, required this.catelog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemes.creamyColor,
      appBar: AppBar(
        title: catelog.name.text.color(MyThemes.blueishColor).xl2.make(),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catelog.price}".text.xl4.bold.red500.make(),
            ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyThemes.blueishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    onPressed: () {},
                    child: "Buy".text.bold.make())
                .wh(100, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catelog.id.toString()),
                    child: Image.network(catelog.image))
                .h32(context),
            Expanded(
                child: VxArc(
                    height: 15,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      width: context.screenWidth,
                      color: Colors.white,
                      child: Column(
                        children: [
                          catelog.name.text.xl2.bold
                              .color(MyThemes.blueishColor)
                              .make(),
                          catelog.desc.text.make()
                        ],
                      ).py24(),
                    )))
          ],
        ),
      ),
    );
  }
}
