// {
//   "id": 1,
//   "name": "NVDIA RTX 3060 TI",
//   "price": 300,
//   "image": "images/p1.jpg"
// },

import 'dart:convert';

class Product {
  int id;
  String name;
  int price;
  String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        image: json['image']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
    };
  }

  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
