import 'package:flutter/material.dart';
import 'package:flutter_catelog/models/Item.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catelog;
  const HomeDetailsPage({Key? key, required this.catelog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: catelog.name.text.color(context.accentColor).xl2.make(),
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catelog.price}".text.xl4.bold.red500.make(),
            ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.buttonColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    onPressed: () {},
                    child: "Add to cart".text.bold.make())
                .wh(150, 50)
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
                      color: context.cardColor,
                      child: Column(
                        children: [
                          catelog.name.text.xl4.bold
                              .color(context.accentColor)
                              .make(),
                          catelog.desc.text.make(),
                          14.heightBox,
                          "Eirmod justo et dolor duo justo ipsum, sit diam dolor stet duo duo ipsum lorem. Invidunt sanctus diam dolores consetetur dolor nonumy, consetetur rebum labore ipsum sit amet kasd magna aliquyam. Diam justo lorem et duo amet diam stet ut. Voluptua sed eos dolores tempor stet eirmod, dolore ipsum sit no sit, est aliquyam duo voluptua stet ut takimata lorem magna et. Sed invidunt sanctus dolor et, vero vero et."
                              .text
                              .textStyle(context.captionStyle!)
                              .make()
                              .p16()
                        ],
                      ).py24(),
                    )))
          ],
        ),
      ),
    );
  }
}
