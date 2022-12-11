class Product {
  int? id;
  late String name;
  late String description;
  late double price;

  Product({required this.name, required this.description, required this.price});

  Product.withId(
      {required this.id,
      required this.name,
      required this.description,
      required this.price});

  Map<String, dynamic>? toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["description"] = description;
    map["price"] = price;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Product.fromObject(dynamic o) {
    this.id = int.tryParse(o["id"].toString())!;
    this.name = o["name"];
    this.description = o["description"];
    this.price = double.tryParse(o["price"].toString())!;
  }
}
