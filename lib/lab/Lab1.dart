import 'package:collection/collection.dart'; //for firstwhereornull :) (no linq xDDDD)

class Product {
  int id;
  String name;
  String image;
  double price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  static List<Product> products = [
    Product(
      id: 1,
      name: "Laptop",
      image: "assets/images/laptop.png",
      price: 15000000,
    ),
    Product(
      id: 2,
      name: "Mouse",
      image: "assets/images/mouse.png",
      price: 250000,
    ),
    Product(
      id: 3,
      name: "Keyboard",
      image: "assets/images/keyboard.png",
      price: 750000,
    ),
    Product(
      id: 4,
      name: "Monitor",
      image: "assets/images/monitor.png",
      price: 3500000,
    ),
    Product(
      id: 5,
      name: "Headphone",
      image: "assets/images/headphone.png",
      price: 1200000,
    ),
  ];

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map["id"],
      name: map["name"] ?? "Unknown",
      image: map["image"] ?? "kekw",
      price: map["price"].toDouble(),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"] ?? "Unknown",
      image: json["image"] ?? "Mama mia",
      price: json["price"].toDouble(),
    );
  }

  @override
  String toString() {
    return 'Product(id: $id | name: $name | image: $image | price: $price)';
  }
}

class ProductRepo {
  void add(Product prod) {
    for (var p in Product.products) {
      if (prod.id == p.id) {
        print("Item already exists");
        return;
      }
    }

    Product.products.add(prod);
  }

  void addJson(Map<String, dynamic> jsonProd) {
    Product p = Product.fromJson(jsonProd);

    add(p);
  }

  Product? findById(int id) {
    return Product.products.firstWhereOrNull((product) => product.id == id);
  }

  bool editById(Product? product) {
    if (product == null) {
      print("Product is null");
      return false;
    }

    int index = Product.products.indexWhere((p) => p.id == product.id);

    if (index == -1) {
      print("Product not found");
      return false;
    }

    Product.products[index] = product;
    print("Product updated successfully");
    return true;
  }

  void searchByName(String keyword) {
    List<Product> list = [];
    String lowerKeyWord = keyword.toLowerCase();
    for(var prod in Product.products) {
      String lowerProductName = prod.name.toLowerCase();
      if(lowerProductName.contains(lowerKeyWord)) {
        list.add(prod);
      }
    }

    if (list.isEmpty) {
      print("No items contain that keyword");
    }
    else {
      for(var p in list) {
        print(p);
      }
    }
  }

  void increasePrice() {
    Product.products = Product.products.map((product) {
      return Product(id: product.id, name: product.name, image: product.image, price: product.price * 1.1);
    }).toList();
  }
}

void main() {
  final repo = ProductRepo();

  print("===== INITIAL PRODUCTS =====");
  for (var product in Product.products) {
    print(product);
  }

  print("\n===== TEST ADD PRODUCT =====");
  final newProduct = Product(
    id: 6,
    name: "Phone",
    image: "assets/images/phone.png",
    price: 9000000,
  );

  repo.add(newProduct);

  for (var product in Product.products) {
    print(product);
  }

  print("\n===== TEST ADD DUPLICATE PRODUCT =====");
  final duplicateProduct = Product(
    id: 6,
    name: "Another Phone",
    image: "assets/images/another_phone.png",
    price: 10000000,
  );

  repo.add(duplicateProduct);

  print("\n===== TEST ADD JSON PRODUCT =====");
  final jsonProduct = {
    "id": 7,
    "name": "Tablet",
    "image": "assets/images/tablet.png",
    "price": 7000000,
  };

  repo.addJson(jsonProduct);

  for (var product in Product.products) {
    print(product);
  }

  print("\n===== TEST FIND BY ID =====");
  final foundProduct = repo.findById(3);

  if (foundProduct != null) {
    print("Found product:");
    print(foundProduct);
  } else {
    print("Product not found");
  }

  print("\n===== TEST FIND NON-EXISTING ID =====");
  final notFoundProduct = repo.findById(999);

  if (notFoundProduct != null) {
    print("Found product:");
    print(notFoundProduct);
  } else {
    print("Product not found");
  }

  print("\n===== TEST EDIT PRODUCT =====");
  final updatedProduct = Product(
    id: 2,
    name: "Gaming Mouse",
    image: "assets/images/gaming_mouse.png",
    price: 500000,
  );

  repo.editById(updatedProduct);

  for (var product in Product.products) {
    print(product);
  }

  print("\n===== TEST EDIT NON-EXISTING PRODUCT =====");
  final fakeProduct = Product(
    id: 999,
    name: "Fake Product",
    image: "assets/images/fake.png",
    price: 1,
  );

  repo.editById(fakeProduct);

  print("\n===== TEST SEARCH BY NAME =====");
  repo.searchByName("phone");

  print("\n===== TEST SEARCH BY NAME - NO RESULT =====");
  repo.searchByName("banana");

  print("\n===== TEST INCREASE PRICE BY 10% =====");
  repo.increasePrice();

  for (var product in Product.products) {
    print(product);
  }
}