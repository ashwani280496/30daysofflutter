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
        final catelog = Store.getItemAt(postion: index);
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
            child: CatelogImage(image: categlog.image)
                .wPCT(context: context, widthPCT: 30)),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            categlog.name.text.lg.bold.color(context.accentColor).make(),
            categlog.desc.text.textStyle(context.captionStyle!).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${categlog.price}".text.bold.make(),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.buttonColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    onPressed: () {},
                    child: "Add to cart".text.bold.make())
              ],
            )
          ],
        ))
      ],
    )).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}
