import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astha_engineering/features/admin/customer_management/domain/usecases/add_customer.dart';
import 'package:astha_engineering/features/admin/customer_management/domain/usecases/update_customer.dart';
import 'package:astha_engineering/features/admin/customer_management/presentation/bloc/customer_form_event.dart';
import 'package:astha_engineering/features/admin/customer_management/presentation/bloc/customer_form_state.dart';

class CustomerFormBloc extends Bloc<CustomerFormEvent, CustomerFormState> {
  final AddCustomer addCustomer;
  final UpdateCustomer updateCustomer;

  CustomerFormBloc({
    required this.addCustomer,
    required this.updateCustomer,
  }) : super(CustomerFormInitial()) {
    on<LoadCustomerForEdit>(_onLoadForEdit);
    on<SaveCustomer>(_onSaveCustomer);
  }

  void _onLoadForEdit(LoadCustomerForEdit event, Emitter<CustomerFormState> emit) {
    emit(CustomerFormPrefilled(event.customer));
  }

  Future<void> _onSaveCustomer(SaveCustomer event, Emitter<CustomerFormState> emit) async {
    emit(CustomerFormLoading());
    try {
      final isEdit = event.customer.id.isNotEmpty;
      final result = isEdit
          ? await updateCustomer(event.customer)
          : await addCustomer(event.customer);

      result.fold(
        (failure) => emit(CustomerFormError(failure.message)),
        (_) => emit(CustomerFormSuccess(
          isEdit ? 'Customer updated successfully' : 'Customer added successfully',
        )),
      );
    } catch (e) {
      emit(CustomerFormError(e.toString()));
    }
  }
}
