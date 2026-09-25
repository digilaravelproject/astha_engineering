import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/routes/app_routes.dart';

// Dashboard
import 'package:safecheck_techno/features/admin/dashboard/presentation/bloc/admin_dashboard_bloc.dart';
import 'package:safecheck_techno/features/admin/dashboard/presentation/pages/admin_home_screen.dart';
import 'package:safecheck_techno/features/admin/dashboard/presentation/pages/admin_main_layout_screen.dart';
import 'package:safecheck_techno/features/admin/dashboard/presentation/pages/more_screen.dart';

// User Management
import 'package:safecheck_techno/features/admin/user_management/data/datasources/user_remote_data_source.dart';
import 'package:safecheck_techno/features/admin/user_management/data/repositories/user_repository_impl.dart';
import 'package:safecheck_techno/features/admin/user_management/domain/usecases/get_users.dart';
import 'package:safecheck_techno/features/admin/user_management/presentation/bloc/user_list_bloc.dart';
import 'package:safecheck_techno/features/admin/user_management/presentation/bloc/user_list_event.dart';
import 'package:safecheck_techno/features/admin/user_management/presentation/pages/add_user_screen.dart';
import 'package:safecheck_techno/features/admin/user_management/presentation/pages/user_list_screen.dart';

// Customer Management
import 'package:safecheck_techno/features/admin/customer_management/data/datasources/customer_remote_data_source.dart';
import 'package:safecheck_techno/features/admin/customer_management/data/repositories/customer_repository_impl.dart';
import 'package:safecheck_techno/features/admin/customer_management/domain/usecases/add_customer.dart';
import 'package:safecheck_techno/features/admin/customer_management/domain/usecases/get_customers.dart';
import 'package:safecheck_techno/features/admin/customer_management/domain/usecases/update_customer.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/bloc/customer_form_bloc.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/bloc/customer_list_bloc.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/bloc/customer_list_event.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/pages/add_customer_screen.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/pages/customer_details_screen.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/pages/customer_list_screen.dart';

// Site Management
import 'package:safecheck_techno/features/admin/site_management/data/datasources/site_remote_data_source.dart';
import 'package:safecheck_techno/features/admin/site_management/data/repositories/site_repository_impl.dart';
import 'package:safecheck_techno/features/admin/site_management/domain/usecases/add_site.dart';
import 'package:safecheck_techno/features/admin/site_management/domain/usecases/get_sites.dart';
import 'package:safecheck_techno/features/admin/site_management/domain/usecases/update_site.dart';
import 'package:safecheck_techno/features/admin/site_management/presentation/bloc/site_form_bloc.dart';
import 'package:safecheck_techno/features/admin/site_management/presentation/bloc/site_list_bloc.dart';
import 'package:safecheck_techno/features/admin/site_management/presentation/bloc/site_list_event.dart';
import 'package:safecheck_techno/features/admin/site_management/presentation/pages/add_site_screen.dart';
import 'package:safecheck_techno/features/admin/site_management/presentation/pages/site_details_screen.dart';
import 'package:safecheck_techno/features/admin/site_management/presentation/pages/site_list_screen.dart';

// Equipment Management
import 'package:safecheck_techno/features/admin/equipment_management/data/datasources/equipment_remote_data_source.dart';
import 'package:safecheck_techno/features/admin/equipment_management/data/repositories/equipment_repository_impl.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/usecases/add_equipment.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/usecases/get_equipments.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/usecases/update_equipment.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/bloc/equipment_form_bloc.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/bloc/equipment_list_bloc.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/bloc/equipment_list_event.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/pages/add_equipment_screen.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/pages/equipment_details_screen.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/pages/equipment_list_screen.dart';

// Certificate Management
import 'package:safecheck_techno/features/admin/certificate_management/data/datasources/certificate_remote_data_source.dart';
import 'package:safecheck_techno/features/admin/certificate_management/data/repositories/certificate_repository_impl.dart';
import 'package:safecheck_techno/features/admin/certificate_management/domain/usecases/get_certificates.dart';
import 'package:safecheck_techno/features/admin/certificate_management/presentation/bloc/certificate_list_bloc.dart';
import 'package:safecheck_techno/features/admin/certificate_management/presentation/bloc/certificate_list_event.dart';
import 'package:safecheck_techno/features/admin/certificate_management/presentation/pages/certificate_list_screen.dart';

// Checkpoints Master
import 'package:safecheck_techno/features/admin/checkpoints_master/data/datasources/checkpoint_remote_data_source.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/data/repositories/checkpoint_repository_impl.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/domain/usecases/get_checkpoints.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/presentation/bloc/checkpoint_list_bloc.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/presentation/bloc/checkpoint_list_event.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/presentation/pages/add_checkpoint_screen.dart';
import 'package:safecheck_techno/features/admin/checkpoints_master/presentation/pages/checkpoints_list_screen.dart';

// Certificate Configurator
import 'package:safecheck_techno/features/admin/certificate_configurator/presentation/pages/certificate_configurator_screen.dart';

// Renewals Master
import 'package:safecheck_techno/features/admin/renewals_master/data/repositories/renewal_repository_impl.dart';
import 'package:safecheck_techno/features/admin/renewals_master/domain/usecases/get_renewals.dart';
import 'package:safecheck_techno/features/admin/renewals_master/presentation/bloc/renewal_list_bloc.dart';
import 'package:safecheck_techno/features/admin/renewals_master/presentation/bloc/renewal_list_event.dart';
import 'package:safecheck_techno/features/admin/renewals_master/presentation/pages/renewals_master_screen.dart';

// Reports Master
import 'package:safecheck_techno/features/admin/reports_master/presentation/pages/reports_master_screen.dart';

class AdminRoutes {
  static List<RouteBase> get routes => [
        // ── Admin Shell (Bottom Nav) ──────────────────────────────────
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
                      final repo = UserRepositoryImpl(UserRemoteDataSourceImpl(Dio()));
                      return UserListBloc(getUsers: GetUsers(repo))..add(LoadUserList());
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
                      final repo = CustomerRepositoryImpl(CustomerRemoteDataSourceImpl(Dio()));
                      return CustomerListBloc(getCustomers: GetCustomers(repo))..add(LoadCustomerList());
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
                      final repo = SiteRepositoryImpl(SiteRemoteDataSourceImpl(Dio()));
                      return SiteListBloc(getSites: GetSites(repo))..add(LoadSiteList());
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

        // ── User Management ───────────────────────────────────────────
        GoRoute(
          path: Routes.addUser,
          builder: (context, state) => const AddUserScreen(),
        ),

        // ── Customer Management ───────────────────────────────────────
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

        // ── Site Management ───────────────────────────────────────────
        GoRoute(
          path: Routes.addSite,
          builder: (context, state) => BlocProvider(
            create: (_) {
              final repo = SiteRepositoryImpl(SiteRemoteDataSourceImpl(Dio()));
              return SiteFormBloc(addSite: AddSite(repo), updateSite: UpdateSite(repo));
            },
            child: const AddSiteScreen(),
          ),
        ),
        GoRoute(
          path: Routes.siteDetails,
          builder: (context, state) => const SiteDetailsScreen(),
        ),

        // ── Equipment Management ──────────────────────────────────────
        GoRoute(
          path: Routes.manageEquipment,
          builder: (context, state) => BlocProvider(
            create: (context) {
              final repo = EquipmentRepositoryImpl(EquipmentRemoteDataSourceImpl(Dio()));
              return EquipmentListBloc(getEquipments: GetEquipments(repo))..add(LoadEquipmentList());
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

        // ── Certificate Management ────────────────────────────────────
        GoRoute(
          path: Routes.manageCertificates,
          builder: (context, state) => BlocProvider(
            create: (context) {
              final repo = CertificateRepositoryImpl(CertificateRemoteDataSourceImpl(Dio()));
              return CertificateListBloc(getCertificates: GetCertificates(repo))..add(LoadCertificateList());
            },
            child: const CertificateListScreen(),
          ),
        ),

        // ── Checkpoints Master ────────────────────────────────────────
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

        // ── Certificate Configurator ──────────────────────────────────
        GoRoute(
          path: Routes.certificateConfigurator,
          builder: (context, state) => const CertificateConfiguratorScreen(),
        ),

        // ── Renewals Master ───────────────────────────────────────────
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

        // ── Reports Master ────────────────────────────────────────────
        GoRoute(
          path: Routes.reportsMaster,
          builder: (context, state) => const ReportsMasterScreen(),
        ),

      ];
}
