class Store {
  static final items = [
    Product(
        id: "Codepur0001",
        name: "iPhone12 Pro",
        desc: "Apple iPhone 12 Generatio",
        price: 999,
        color: "#33505a",
        imageUrl:
            "https://cdn.myimaginestore.com/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/1/2/12-12pro_silicon_plum.jpeg")
  ];
}

class Product {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageUrl;

// creating named constructor by using {}
  Product(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.imageUrl});
}
