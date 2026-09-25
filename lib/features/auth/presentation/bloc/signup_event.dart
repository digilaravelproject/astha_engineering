import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
  @override
  List<Object> get props => [];
}

class SubmitSignup extends SignupEvent {
  final String name;
  final String email;
  final String password;
  const SubmitSignup({required this.name, required this.email, required this.password});
  @override
  List<Object> get props => [name, email, password];
}
