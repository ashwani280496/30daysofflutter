import 'package:flutter/material.dart';
import 'package:flutter_catelog/Pages/home_details.dart';
import 'package:flutter_catelog/models/Item.dart';
import 'package:flutter_catelog/models/cart_model.dart';
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
                AddToCartButton(
                  item: categlog,
                )
              ],
            )
          ],
        ))
      ],
    )).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}

class AddToCartButton extends StatefulWidget {
  final Item item;
  const AddToCartButton({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        onPressed: () {
          print("Button pressed");
          isAdded = isAdded.toggle();
          final _cart = CartModel();
          _cart.store = Store();
          _cart.add(widget.item);
          setState(() {});
        },
        child:
            isAdded ? Icon(Icons.do_disturb) : "Add to cart".text.bold.make());
  }
}
