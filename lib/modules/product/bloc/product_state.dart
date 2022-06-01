import 'package:kopdig/core/network/response/product/product_response.dart';

abstract class ProductState {}

class InitProductState extends ProductState {}

class ShowLoadingProduct extends ProductState {}

class ShowErrorProduct extends ProductState {}


class ShowProducts extends ProductState {
  List<Product> products;
  ShowProducts(this.products);
}