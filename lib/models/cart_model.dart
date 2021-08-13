import 'package:flutter_catelog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Item.dart';

class CartModel {
  //store field
  CatelogModel _store = CatelogModel();

  // item ids
  final List<int> cartItemIds = [];

  // Get store
  CatelogModel get catalog => _store;

  // set store

  set catalog(CatelogModel store) {
    // ignore: unnecessary_null_comparison
    assert(_store != null);
    this._store = store;
  }

  // get items of the carts using cartItemIds
  List<Item> get cartItems =>
      cartItemIds.map((id) => _store.getByID(id)).toList();

  // get total price of the cart items

  num get totalPrice => cartItems.fold(0, (total, item) => total + item.price);

  // add item
  void add(Item item) => cartItemIds.add(item.id);

  // remove item
  void remove(Item item) => cartItemIds.remove(item.id);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart.cartItemIds.add(item.id);
  }
}
