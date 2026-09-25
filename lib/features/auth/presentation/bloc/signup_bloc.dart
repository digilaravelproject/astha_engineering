import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SubmitSignup>(_onSubmitSignup);
  }

  void _onSubmitSignup(SubmitSignup event, Emitter<SignupState> emit) async {
    emit(SignupLoading());
    await Future.delayed(const Duration(seconds: 1)); // Simulate API call
    emit(SignupSuccess());
  }
}
