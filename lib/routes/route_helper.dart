import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/constants/app_constants.dart';
import 'package:safecheck_techno/routes/app_routes.dart';
import 'package:safecheck_techno/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safecheck_techno/features/common/webview/presentation/pages/webview_screen.dart';
import 'package:safecheck_techno/features/auth/presentation/bloc/login_bloc.dart';
import 'package:safecheck_techno/features/auth/presentation/bloc/signup_bloc.dart';
import 'package:safecheck_techno/features/auth/presentation/pages/login_screen.dart';
import 'package:safecheck_techno/features/auth/presentation/pages/signup_screen.dart';
import 'package:safecheck_techno/features/auth/presentation/pages/email_login_screen.dart';
import 'package:safecheck_techno/features/auth/presentation/pages/otp_screen.dart';
import 'package:safecheck_techno/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:safecheck_techno/features/auth/presentation/pages/role_selection_screen.dart';
import 'package:safecheck_techno/features/auth/presentation/pages/set_new_password_screen.dart';
import 'package:safecheck_techno/features/admin/dashboard/presentation/pages/admin_home_screen.dart';
import 'package:safecheck_techno/features/admin/dashboard/presentation/pages/admin_main_layout_screen.dart';
import 'package:safecheck_techno/features/admin/dashboard/presentation/pages/more_screen.dart';
import 'package:safecheck_techno/features/customer/dashboard/presentation/pages/customer_home_screen.dart';
import 'package:safecheck_techno/features/customer/dashboard/presentation/pages/customer_main_layout_screen.dart';
import 'package:safecheck_techno/features/customer/site_management/presentation/pages/customer_sites_screen.dart';
import 'package:safecheck_techno/features/customer/certificate_management/presentation/pages/customer_certificates_screen.dart';
import 'package:safecheck_techno/features/engineer/dashboard/presentation/pages/engineer_home_screen.dart';
import 'package:safecheck_techno/features/engineer/dashboard/presentation/pages/engineer_main_layout_screen.dart';
import 'package:safecheck_techno/features/engineer/site_management/presentation/pages/engineer_site_list_screen.dart';
import 'package:safecheck_techno/features/common/profile/presentation/pages/profile_screen.dart';
import 'package:safecheck_techno/features/common/notifications/presentation/pages/notifications_screen.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/presentation/pages/checkpoints_list_screen.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/presentation/pages/add_checkpoint_screen.dart';
import 'package:safecheck_techno/features/admin/certificate_configurator/presentation/pages/certificate_configurator_screen.dart';
import 'package:safecheck_techno/features/admin/renewals_master/presentation/pages/renewals_master_screen.dart';
import 'package:safecheck_techno/features/admin/reports_master/presentation/pages/reports_master_screen.dart';
import 'package:safecheck_techno/features/engineer/inspection_history/presentation/pages/engineer_history_screen.dart';
import 'package:safecheck_techno/features/engineer/inspection_history/presentation/pages/certificate_preview_screen.dart';
import 'package:safecheck_techno/features/customer/renewals_tracker/presentation/pages/customer_renewals_screen.dart';
import 'package:safecheck_techno/features/engineer/site_management/presentation/pages/engineer_site_overview_screen.dart';
import 'package:safecheck_techno/features/engineer/inspection_execution/presentation/pages/inspection_scanner_screen.dart';
import 'package:safecheck_techno/features/engineer/inspection_execution/presentation/pages/checklist_form_screen.dart';
import 'package:safecheck_techno/features/admin/dashboard/presentation/bloc/admin_dashboard_bloc.dart';
import 'package:safecheck_techno/features/admin/user_management/presentation/pages/user_list_screen.dart';
import 'package:safecheck_techno/features/admin/user_management/presentation/pages/add_user_screen.dart';
import 'package:safecheck_techno/features/admin/user_management/presentation/bloc/user_list_bloc.dart';
import 'package:safecheck_techno/features/admin/user_management/presentation/bloc/user_list_event.dart';
import 'package:safecheck_techno/features/admin/user_management/data/datasources/user_remote_data_source.dart';
import 'package:safecheck_techno/features/admin/user_management/data/repositories/user_repository_impl.dart';
import 'package:safecheck_techno/features/admin/user_management/domain/usecases/get_users.dart';
import 'package:dio/dio.dart';
import 'package:safecheck_techno/features/admin/customer_management/data/datasources/customer_remote_data_source.dart';
import 'package:safecheck_techno/features/admin/customer_management/data/repositories/customer_repository_impl.dart';
import 'package:safecheck_techno/features/admin/customer_management/domain/usecases/get_customers.dart';
import 'package:safecheck_techno/features/admin/site_management/data/datasources/site_remote_data_source.dart';
import 'package:safecheck_techno/features/admin/site_management/data/repositories/site_repository_impl.dart';
import 'package:safecheck_techno/features/admin/site_management/domain/usecases/get_sites.dart';
import 'package:safecheck_techno/features/admin/equipment_management/data/datasources/equipment_remote_data_source.dart';
import 'package:safecheck_techno/features/admin/equipment_management/data/repositories/equipment_repository_impl.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/usecases/get_equipments.dart';
import 'package:safecheck_techno/features/admin/certificate_management/data/datasources/certificate_remote_data_source.dart';
import 'package:safecheck_techno/features/admin/certificate_management/data/repositories/certificate_repository_impl.dart';
import 'package:safecheck_techno/features/admin/certificate_management/domain/usecases/get_certificates.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/bloc/customer_list_bloc.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/bloc/customer_list_event.dart';
import 'package:safecheck_techno/features/admin/site_management/presentation/bloc/site_list_bloc.dart';
import 'package:safecheck_techno/features/admin/site_management/presentation/bloc/site_list_event.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/bloc/equipment_list_bloc.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/bloc/equipment_list_event.dart';
import 'package:safecheck_techno/features/admin/certificate_management/presentation/bloc/certificate_list_bloc.dart';
import 'package:safecheck_techno/features/admin/certificate_management/presentation/bloc/certificate_list_event.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/pages/customer_list_screen.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/pages/add_customer_screen.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/pages/customer_details_screen.dart';
import 'package:safecheck_techno/features/admin/site_management/presentation/pages/site_list_screen.dart';
import 'package:safecheck_techno/features/admin/site_management/presentation/pages/add_site_screen.dart';
import 'package:safecheck_techno/features/admin/site_management/presentation/pages/site_details_screen.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/pages/equipment_list_screen.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/pages/add_equipment_screen.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/pages/equipment_details_screen.dart';
import 'package:safecheck_techno/features/admin/certificate_management/presentation/pages/certificate_list_screen.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/bloc/customer_form_bloc.dart';
import 'package:safecheck_techno/features/admin/customer_management/domain/usecases/add_customer.dart';
import 'package:safecheck_techno/features/admin/customer_management/domain/usecases/update_customer.dart';
import 'package:safecheck_techno/features/admin/site_management/presentation/bloc/site_form_bloc.dart';
import 'package:safecheck_techno/features/admin/site_management/domain/usecases/add_site.dart';
import 'package:safecheck_techno/features/admin/site_management/domain/usecases/update_site.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/bloc/equipment_form_bloc.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/usecases/add_equipment.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/usecases/update_equipment.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/data/datasources/checkpoint_remote_data_source.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/data/repositories/checkpoint_repository_impl.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/domain/usecases/get_checkpoints.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/presentation/bloc/checkpoint_list_bloc.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/presentation/bloc/checkpoint_list_event.dart';
import 'package:safecheck_techno/features/admin/renewals_master/data/repositories/renewal_repository_impl.dart';
import 'package:safecheck_techno/features/admin/renewals_master/domain/usecases/get_renewals.dart';
import 'package:safecheck_techno/features/admin/renewals_master/presentation/bloc/renewal_list_bloc.dart';
import 'package:safecheck_techno/features/admin/renewals_master/presentation/bloc/renewal_list_event.dart';



class RouteHelper {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.roleSelection,
        builder: (context, state) => const RoleSelectionScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginBloc(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: Routes.signup,
        builder: (context, state) => BlocProvider(
          create: (context) => SignupBloc(),
          child: const SignupScreen(),
        ),
      ),
      GoRoute(
        path: Routes.emailLogin,
        builder: (context, state) => const EmailLoginScreen(),
      ),
      GoRoute(
        path: Routes.otpVerify,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          final email = extra['email'] as String? ?? '';
          final nextRoute = extra['nextRoute'] as String? ?? AppConstants.defaultDashboardRoute;
          return OtpScreen(email: email, nextRoute: nextRoute);
        },
      ),
      GoRoute(
        path: Routes.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: Routes.setNewPassword,
        builder: (context, state) => const SetNewPasswordScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AdminMainLayoutScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.adminDashboard,
                builder: (context, state) => BlocProvider(
                  create: (context) => AdminDashboardBloc(),
                  child: const AdminHomeScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.manageUsers,
                builder: (context, state) => BlocProvider(
                  create: (context) {
                    final remoteDataSource = UserRemoteDataSourceImpl(Dio());
                    final repo = UserRepositoryImpl(remoteDataSource);
                    final getUsers = GetUsers(repo);
                    return UserListBloc(getUsers: getUsers)..add(LoadUserList());
                  },
                  child: const UserListScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.manageCustomers,
                builder: (context, state) => BlocProvider(
                  create: (context) {
                    final remoteDataSource = CustomerRemoteDataSourceImpl(Dio());
                    final repo = CustomerRepositoryImpl(remoteDataSource);
                    final getCustomers = GetCustomers(repo);
                    return CustomerListBloc(getCustomers: getCustomers)..add(LoadCustomerList());
                  },
                  child: const CustomerListScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.manageSites,
                builder: (context, state) => BlocProvider(
                  create: (context) {
                    final remoteDataSource = SiteRemoteDataSourceImpl(Dio());
                    final repo = SiteRepositoryImpl(remoteDataSource);
                    final getSites = GetSites(repo);
                    return SiteListBloc(getSites: getSites)..add(LoadSiteList());
                  },
                  child: const SiteListScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.adminMore,
                builder: (context, state) => const MoreScreen(),
              ),
            ],
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return CustomerMainLayoutScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.customerDashboard,
                builder: (context, state) => const CustomerHomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.customerSites,
                builder: (context, state) => const CustomerSitesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.customerCertificates,
                builder: (context, state) => const CustomerCertificatesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.customerMore,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return EngineerMainLayoutScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.engineerDashboard,
                builder: (context, state) => const EngineerHomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.engineerSites,
                builder: (context, state) => const EngineerSiteListScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.engineerInspections,
                builder: (context, state) => const EngineerHistoryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.engineerMore,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: Routes.addUser,
        builder: (context, state) => const AddUserScreen(),
      ),
      GoRoute(
        path: Routes.addCustomer,
        builder: (context, state) => BlocProvider(
          create: (_) {
            final repo = CustomerRepositoryImpl(CustomerRemoteDataSourceImpl(Dio()));
            return CustomerFormBloc(
              addCustomer: AddCustomer(repo),
              updateCustomer: UpdateCustomer(repo),
            );
          },
          child: const AddCustomerScreen(),
        ),
      ),
      GoRoute(
        path: Routes.customerDetails,
        builder: (context, state) => const CustomerDetailsScreen(),
      ),
      GoRoute(
        path: Routes.addSite,
        builder: (context, state) => BlocProvider(
          create: (_) {
            final repo = SiteRepositoryImpl(SiteRemoteDataSourceImpl(Dio()));
            return SiteFormBloc(
              addSite: AddSite(repo),
              updateSite: UpdateSite(repo),
            );
          },
          child: const AddSiteScreen(),
        ),
      ),
      GoRoute(
        path: Routes.siteDetails,
        builder: (context, state) => const SiteDetailsScreen(),
      ),
      GoRoute(
        path: Routes.manageEquipment,
        builder: (context, state) => BlocProvider(
          create: (context) {
            final remoteDataSource = EquipmentRemoteDataSourceImpl(Dio());
            final repo = EquipmentRepositoryImpl(remoteDataSource);
            final getEquipments = GetEquipments(repo);
            return EquipmentListBloc(getEquipments: getEquipments)..add(LoadEquipmentList());
          },
          child: const EquipmentListScreen(),
        ),
      ),
      GoRoute(
        path: Routes.addEquipment,
        builder: (context, state) => BlocProvider(
          create: (_) {
            final repo = EquipmentRepositoryImpl(EquipmentRemoteDataSourceImpl(Dio()));
            return EquipmentFormBloc(
              addEquipment: AddEquipment(repo),
              updateEquipment: UpdateEquipment(repo),
            );
          },
          child: const AddEquipmentScreen(),
        ),
      ),
      GoRoute(
        path: Routes.equipmentDetails,
        builder: (context, state) => const EquipmentDetailsScreen(),
      ),
      GoRoute(
        path: Routes.manageCertificates,
        builder: (context, state) => BlocProvider(
          create: (context) {
            final remoteDataSource = CertificateRemoteDataSourceImpl(Dio());
            final repo = CertificateRepositoryImpl(remoteDataSource);
            final getCertificates = GetCertificates(repo);
            return CertificateListBloc(getCertificates: getCertificates)..add(LoadCertificateList());
          },
          child: const CertificateListScreen(),
        ),
      ),

      GoRoute(
        path: Routes.webview,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          final title = extra['title'] as String? ?? 'Webview';
          final endpoint = extra['endpoint'] as String? ?? '';
          return WebviewScreen(title: title, endpoint: endpoint);
        },
      ),
      GoRoute(
        path: Routes.engineerSiteOverview,
        name: Routes.engineerSiteOverview.substring(1),
        builder: (context, state) {
          final siteName = state.extra as String? ?? 'Site Overview';
          return EngineerSiteOverviewScreen(siteName: siteName);
        },
      ),
      GoRoute(
        path: Routes.engineerInspectionScanner,
        name: Routes.engineerInspectionScanner.substring(1),
        builder: (context, state) => const InspectionScannerScreen(),
      ),
      GoRoute(
        path: Routes.engineerChecklistForm,
        name: Routes.engineerChecklistForm.substring(1),
        builder: (context, state) {
          final equipmentId = state.extra as String? ?? 'Unknown';
          return ChecklistFormScreen(equipmentId: equipmentId);
        },
      ),
      GoRoute(
        path: Routes.profile,
        name: Routes.profile.substring(1),
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: Routes.notifications,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: Routes.checkpoints,
        builder: (context, state) => BlocProvider(
          create: (_) {
            final repo = CheckpointRepositoryImpl(CheckpointRemoteDataSourceImpl(Dio()));
            return CheckpointListBloc(getCheckpoints: GetCheckpoints(repo))..add(LoadCheckpointList());
          },
          child: const CheckpointsListScreen(),
        ),
      ),
      GoRoute(
        path: Routes.addCheckpoint,
        builder: (context, state) => const AddCheckpointScreen(),
      ),
      GoRoute(
        path: Routes.certificateConfigurator,
        builder: (context, state) => const CertificateConfiguratorScreen(),
      ),
      GoRoute(
        path: Routes.renewalsMaster,
        builder: (context, state) => BlocProvider(
          create: (_) {
            final repo = RenewalRepositoryImpl();
            return RenewalListBloc(getRenewals: GetRenewals(repo))..add(LoadRenewalList());
          },
          child: const RenewalsMasterScreen(),
        ),
      ),
      GoRoute(
        path: Routes.reportsMaster,
        builder: (context, state) => const ReportsMasterScreen(),
      ),
      GoRoute(
        path: Routes.certificatePreview,
        builder: (context, state) => const CertificatePreviewScreen(),
      ),
      GoRoute(
        path: Routes.customerRenewals,
        builder: (context, state) => const CustomerRenewalsScreen(),
      ),
    ],
  );
}
