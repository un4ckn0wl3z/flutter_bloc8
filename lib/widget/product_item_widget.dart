import 'package:flutter/material.dart';
import 'package:flutter_bloc8/model/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('ราคาสินค้า ${product.price.toString()} USD'),
      leading: Image.network(
          'https://www.enterpriseitpro.net/wp-content/uploads/2021/06/nvidia-logo.jpg'),
    );
  }
}
