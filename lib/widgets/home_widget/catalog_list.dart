import 'package:flutter/material.dart';
import 'package:flutter_catelog/Pages/home_details.dart';
import 'package:flutter_catelog/models/Item.dart';
import 'package:flutter_catelog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatelogList extends StatelessWidget {
  const CatelogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Store.items.length,
      itemBuilder: (context, index) {
        final catelog = Store.items[index];
        return InkWell(
          child: CateglogItem(categlog: catelog),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeDetailsPage(catelog: catelog))),
        );
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
        Hero(
            tag: Key(categlog.id.toString()),
            child: CatelogImage(image: categlog.image)),
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
