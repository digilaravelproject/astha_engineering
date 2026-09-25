import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/bloc/customer_form_event.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/bloc/customer_form_state.dart';

class CustomerFormBloc extends Bloc<CustomerFormEvent, CustomerFormState> {
  CustomerFormBloc() : super(CustomerFormInitial()) {
    on<LoadCustomerForEdit>(_onLoadForEdit);
    on<SaveCustomer>(_onSaveCustomer);
  }

  void _onLoadForEdit(LoadCustomerForEdit event, Emitter<CustomerFormState> emit) {
    emit(CustomerFormPrefilled(event.customer));
  }

  Future<void> _onSaveCustomer(SaveCustomer event, Emitter<CustomerFormState> emit) async {
    emit(CustomerFormLoading());
    try {
      // TODO: Inject and call AddCustomerUseCase or UpdateCustomerUseCase
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      emit(const CustomerFormSuccess('Customer saved successfully'));
    } catch (e) {
      emit(CustomerFormError(e.toString()));
    }
  }
}
