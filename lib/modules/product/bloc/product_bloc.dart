import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopdig/core/repository/product_repository.dart';
import 'package:kopdig/core/repository/user_repository.dart';
import 'package:kopdig/modules/product/bloc/product_event.dart';
import 'package:kopdig/modules/product/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  late ProductRepository _repository;

  ProductBloc() : super(InitProductState()) {
    _repository = ProductRepository.instance;
    on<GetProducts>((event, emit) async {
      emit(ShowLoadingProduct());
      var data = await _repository.getProducts("");
      emit(ShowProducts(data));

      // try {
      // } catch (ex) {
      //   print(ex.toString());
      //   emit(ShowErrorProduct());
      // }
    });
  }
}
