import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopdig/core/repository/user_repository.dart';
import 'package:kopdig/modules/auth/bloc/auth_event.dart';
import 'package:kopdig/modules/auth/bloc/auth_state.dart';
import 'package:kopdig/modules/auth/helper/auth_delegate.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late UserRepository _repository;
  late AuthDelegate _delegate;

  AuthBloc() : super(InitAuthState()) {
    _repository = UserRepository.instance;
    on<RegisterUser>((event, emit) async {
      _delegate = event.delegate;
      emit(ShowLoading());
      _delegate.onLoading();
      try {
        var data = await _repository.submitRegister(event.map);
        if (data.data?.code != null && data.data?.code == 200) {
          _delegate.onSuccess();
        } else {
          _delegate.onError("Terjadi kesalahan");
        }
      } catch (ex) {
        _delegate.onError("Terjadi kesalahan : $ex");
      }
    });

    on<LoginUser>((event, emit) async {
      _delegate = event.delegate;
      emit(ShowLoading());
      _delegate.onLoading();
      try {
        var data = await _repository.submitLogin(event.email, event.password);
        if (data.data?.code != null && data.data?.code == 200) {
          _delegate.onSuccess();
        } else {
          _delegate.onError("Terjadi kesalahan");
        }
      } catch (ex) {
        _delegate.onError("Terjadi kesalahan : $ex");
      }
    });
  }
}
