import 'Item.dart';

class CartModel {
  static final cartModel = CartModel.internal();

  CartModel.internal();

  factory CartModel() => cartModel;

  //store field
  Store _store = Store();

  // item ids
  final List<int> cartItemIds = [];

  // Get store
  Store get store => _store;

  // set store

  set store(Store store) {
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
