import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc8/bloc/common_bloc.dart';
import 'package:flutter_bloc8/model/product.dart';
import 'package:http/http.dart' as http;

class ProductBloc extends Bloc<MyEvent, MyState> {
  ProductBloc() : super(StateInitialzed()) {
    on<GetProductEvent>(_onGetProducts);
  }

  void _onGetProducts(GetProductEvent event, Emitter<MyState> emit) async {
    emit(StateLoading());
    final res = await http.get(
      Uri.parse('http://192.168.61.105:3002/products'),
    );

    if (res.statusCode != HttpStatus.ok) {
      emit(StateError(message: res.body));
      return;
    }

    final json = jsonDecode(utf8.decode(res.bodyBytes)) as List;
    final products = json.map((e) => Product.fromJson(e)).toList();
    emit(GetProductStateSuccess(products: products));
  }
}

class GetProductEvent extends MyEvent {}

class GetProductStateSuccess extends MyState {
  final List<Product> products;
  GetProductStateSuccess({required this.products});
}
