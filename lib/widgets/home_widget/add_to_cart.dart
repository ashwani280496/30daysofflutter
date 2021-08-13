import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catelog/core/store.dart';
import 'package:flutter_catelog/models/Item.dart';
import 'package:flutter_catelog/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCartButton extends StatelessWidget {
  final Item item;
  AddToCartButton({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.cartItems.contains(item);
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        onPressed: () {
          print("Button pressed");
          if (!isInCart) {
            AddMutation(item);
          }
          // setState(() {});
        },
        child: isInCart
            ? Icon(Icons.done_sharp)
            : Icon(CupertinoIcons.cart_badge_plus));
  }
}
