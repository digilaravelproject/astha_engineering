import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SubmitLogin>(_onSubmitLogin);
  }

  void _onSubmitLogin(SubmitLogin event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 1)); // Simulate API call
    emit(LoginSuccess());
  }
}
