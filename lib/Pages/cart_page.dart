import 'package:flutter/material.dart';
import 'package:flutter_catelog/models/cart_model.dart';
import 'package:flutter_catelog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [CartList().p32().expand(), Divider(), CartTotal()],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${CartModel().totalPrice}"
              .text
              .xl5
              .color(context.accentColor)
              .make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () => {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: "Buying not supported yet.".text.make()))
                      },
                  child: "Buy".text.make())
              .w32(context)
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  CartModel _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.cartItems.isEmpty
        ? "No item to show".text.make().centered()
        : ListView.builder(
            itemCount: _cart.cartItems.count(),
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      _cart.remove(_cart.cartItems[index]);
                      setState(() {});
                    },
                  ),
                  title: _cart.cartItems[index].name.text.make(),
                ));
  }
}
