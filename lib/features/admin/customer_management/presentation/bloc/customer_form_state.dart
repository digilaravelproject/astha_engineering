import 'package:equatable/equatable.dart';
import 'package:safecheck_techno/features/admin/customer_management/domain/entities/customer_entity.dart';

abstract class CustomerFormState extends Equatable {
  const CustomerFormState();
  @override
  List<Object?> get props => [];
}

class CustomerFormInitial extends CustomerFormState {}

class CustomerFormPrefilled extends CustomerFormState {
  final CustomerEntity customer;
  const CustomerFormPrefilled(this.customer);
  @override
  List<Object?> get props => [customer];
}

class CustomerFormLoading extends CustomerFormState {}

class CustomerFormSuccess extends CustomerFormState {
  final String message;
  const CustomerFormSuccess(this.message);
  @override
  List<Object?> get props => [message];
}

class CustomerFormError extends CustomerFormState {
  final String message;
  const CustomerFormError(this.message);
  @override
  List<Object?> get props => [message];
}
