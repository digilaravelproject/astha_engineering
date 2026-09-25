import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class SubmitLogin extends LoginEvent {
  final String identifier; // phone or email
  final String password;
  const SubmitLogin({required this.identifier, required this.password});
  @override
  List<Object> get props => [identifier, password];
}
