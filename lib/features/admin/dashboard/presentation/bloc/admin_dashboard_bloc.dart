import 'package:flutter_bloc/flutter_bloc.dart';
import 'admin_dashboard_event.dart';
import 'admin_dashboard_state.dart';

class AdminDashboardBloc extends Bloc<AdminDashboardEvent, AdminDashboardState> {
  AdminDashboardBloc() : super(AdminDashboardInitial()) {
    on<LoadAdminDashboardData>(_onLoadAdminDashboardData);
  }

  Future<void> _onLoadAdminDashboardData(LoadAdminDashboardData event, Emitter<AdminDashboardState> emit) async {
    emit(AdminDashboardLoading());
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 600));
    emit(const AdminDashboardLoaded());
  }
}
