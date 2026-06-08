class Product {
  final int id;
  final String name;
  final String? image;
  final double price;
  final String? description;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  static List<Product> products = [
    Product(
      id: 1,
      name: "Teddy bear",
      image:
          "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400",
      price: 120,
      description:
          "This is a teddy bear. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute.",
    ),
    Product(
      id: 2,
      name: "Computer",
      image:
          "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400",
      price: 30,
      description:
          "This is a computer. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute.",
    ),
    Product(
      id: 3,
      name: "Barbie Doll",
      image:
          "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400",
      price: 97,
      description:
          "This is a doll. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute.",
    ),
    Product(
      id: 4,
      name: "Mobile",
      image:
          "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400",
      price: 89,
      description:
          "This is a mobile. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute.",
    ),
    Product(
      id: 5,
      name: "Teddy bear",
      image:
          "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=400",
      price: 120,
      description:
          "This is a teddy bear. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute. It is very cute.",
    ),
  ];

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map["id"],
      name: map["name"] ?? "Unknown",
      image: map["image"],
      price: map["price"].toDouble(),
      description: map["description"],
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"] ?? "Unknown",
      image: json["image"],
      price: json["price"].toDouble(),
      description: json["description"],
    );
  }

  Product copyTo({
    int? id,
    String? name,
    String? image,
    double? price,
    String? description,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return 'Product(id: $id | name: $name | image: $image | price: $price | description: $description)';
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
    for (var product in Product.products) {
      if (product.id == id) {
        return product;
      }
    }

    return null;
  }

  bool editById({
    required int id,
    String? name,
    String? image,
    double? price,
    String? description,
  }) {
    int index = Product.products.indexWhere((p) => p.id == id);

    if (index == -1) {
      print("Product not found");
      return false;
    }

    Product oldProduct = Product.products[index];

    Product updatedProduct = oldProduct.copyTo(
      name: name,
      image: image,
      price: price,
      description: description,
    );

    Product.products[index] = updatedProduct;

    print("Product updated successfully");
    return true;
  }

  void searchByName(String keyword) {
    List<Product> list = [];
    String lowerKeyWord = keyword.toLowerCase();
    for (var prod in Product.products) {
      String lowerProductName = prod.name.toLowerCase();
      if (lowerProductName.contains(lowerKeyWord)) {
        list.add(prod);
      }
    }

    if (list.isEmpty) {
      print("No items contain that keyword");
    } else {
      for (var p in list) {
        print(p);
      }
    }
  }

  void increasePrice() {
    Product.products = Product.products.map((product) {
      return Product(
        id: product.id,
        name: product.name,
        image: product.image,
        price: product.price * 1.1,
        description: product.description,
      );
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
    description: "This is a phone.",
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
    description: "This is another phone.",
  );

  repo.add(duplicateProduct);

  print("\n===== TEST ADD JSON PRODUCT =====");
  final jsonProduct = {
    "id": 7,
    "name": "Tablet",
    "image": "assets/images/tablet.png",
    "price": 7000000,
    "description": "This is a tablet.",
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

  repo.editById(
    id: 2,
    name: "Gaming Mouse",
    image: "assets/images/gaming_mouse.png",
    price: 500000,
    description: "This is a gaming mouse.",
  );

  for (var product in Product.products) {
    print(product);
  }

  print("\n===== TEST EDIT NON-EXISTING PRODUCT =====");

  repo.editById(
    id: 999,
    name: "Fake Product",
    image: "assets/images/fake.png",
    price: 1,
    description: "This product does not exist.",
  );

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
