import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catelog/models/Item.dart';
import 'package:flutter_catelog/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

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
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.cartItems.contains(widget.item);
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        onPressed: () {
          print("Button pressed");
          _cart.store = Store();
          if (isInCart) {
            _cart.remove(widget.item);
          } else {
            _cart.add(widget.item);
          }
          setState(() {});
        },
        child: isInCart
            ? Icon(Icons.done_sharp)
            : Icon(CupertinoIcons.cart_badge_plus));
  }
}
