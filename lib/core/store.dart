import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catelog/models/Item.dart';
import 'package:flutter_catelog/models/cart_model.dart';

class MyStore extends VxStore {
  late CatelogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatelogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
