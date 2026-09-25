import 'package:equatable/equatable.dart';

abstract class AdminDashboardState extends Equatable {
  const AdminDashboardState();
  
  @override
  List<Object?> get props => [];
}

class AdminDashboardInitial extends AdminDashboardState {}

class AdminDashboardLoading extends AdminDashboardState {}

class AdminDashboardLoaded extends AdminDashboardState {
  final int totalCustomers;
  final int totalSites;
  final int totalUsers;
  final int totalEngineers;
  final int totalEquipment;
  final int totalCertificates;
  final int totalInspections;
  final int renewalsPending;

  const AdminDashboardLoaded({
    this.totalCustomers = 40,
    this.totalSites = 86,
    this.totalUsers = 24,
    this.totalEngineers = 9,
    this.totalEquipment = 76,
    this.totalCertificates = 101,
    this.totalInspections = 99,
    this.renewalsPending = 12,
  });

  @override
  List<Object?> get props => [
        totalCustomers,
        totalSites,
        totalUsers,
        totalEngineers,
        totalEquipment,
        totalCertificates,
        totalInspections,
        renewalsPending,
      ];
}

class AdminDashboardError extends AdminDashboardState {
  final String message;
  
  const AdminDashboardError(this.message);
  
  @override
  List<Object?> get props => [message];
}
