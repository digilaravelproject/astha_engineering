import 'package:equatable/equatable.dart';
import 'package:astha_engineering/features/admin/customer_management/domain/entities/customer_entity.dart';

abstract class CustomerFormEvent extends Equatable {
  const CustomerFormEvent();
  @override
  List<Object?> get props => [];
}

class LoadCustomerForEdit extends CustomerFormEvent {
  final CustomerEntity customer;
  const LoadCustomerForEdit(this.customer);
  @override
  List<Object?> get props => [customer];
}

class SaveCustomer extends CustomerFormEvent {
  final CustomerEntity customer;
  const SaveCustomer(this.customer);
  @override
  List<Object?> get props => [customer];
}
