import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc8/bloc/common_bloc.dart';
import 'package:flutter_bloc8/bloc/product_bloc.dart';
import 'package:flutter_bloc8/widget/product_item_widget.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ร้านค้า'),
      ),
      body: BlocConsumer<ProductBloc, MyState>(
        builder: (context, state) {
          if (state is StateLoading) {
            return Column(
              children: [
                Center(
                  child: Image.network(
                      'https://cutewallpaper.org/21/loading-gif-transparent-background/Free-Content-Discovery-Influencer-Marketing-Tool-Buzzsumo-.gif'),
                ),
              ],
            );
          } else if (state is GetProductStateSuccess) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (ctx, i) => ProductItem(product: state.products[i]),
            );
          }
          return Container();
        },
        listener: (context, state) {
          if (state is StateError) {
            print(state);
          }
        },
      ),
    );
  }
}
