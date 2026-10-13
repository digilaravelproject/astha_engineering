import 'package:equatable/equatable.dart';


import 'package:astha_engineering/features/admin/customer_management/domain/entities/customer_entity.dart';

abstract class CustomerListState extends Equatable {
  const CustomerListState();
  @override
  List<Object> get props => [];
}

class CustomerListInitial extends CustomerListState {}
class CustomerListLoading extends CustomerListState {}
class CustomerListLoaded extends CustomerListState {
  final List<CustomerEntity> customers;
  const CustomerListLoaded(this.customers);
  @override
  List<Object> get props => [customers];
}
class CustomerListError extends CustomerListState {
  final String message;
  const CustomerListError(this.message);
  @override
  List<Object> get props => [message];
}
