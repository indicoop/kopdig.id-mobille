import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopdig/core/repository/product_repository.dart';
import 'package:kopdig/core/repository/user_repository.dart';
import 'package:kopdig/modules/product/bloc/product_event.dart';
import 'package:kopdig/modules/product/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  late ProductRepository _repository;
  late String _userToken;

  ProductBloc() : super(InitProductState()) {
    _repository = ProductRepository.instance;
    on<GetProducts>((event, emit) async {
      _userToken =
          await UserRepository().readSecureData('token') as String ?? "";
      emit(ShowLoadingProduct());
      try {
        var data = await _repository.getProducts(_userToken);
        emit(ShowProducts(data));
      } catch (ex) {
        print(ex.toString());
      }
    });
  }
}
