import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safecheck_techno/features/admin/customer_management/domain/usecases/get_customers.dart';

import 'customer_list_event.dart';
import 'customer_list_state.dart';

class CustomerListBloc extends Bloc<CustomerListEvent, CustomerListState> {
  final GetCustomers getCustomers;

  CustomerListBloc({required this.getCustomers}) : super(CustomerListInitial()) {
    on<LoadCustomerList>(_onLoadCustomerList);
  }

  Future<void> _onLoadCustomerList(LoadCustomerList event, Emitter<CustomerListState> emit) async {
    emit(CustomerListLoading());
    final result = await getCustomers();
    result.fold(
      (failure) => emit(CustomerListError(failure.message)),
      (customers) => emit(CustomerListLoaded(customers)),
    );
  }
}
