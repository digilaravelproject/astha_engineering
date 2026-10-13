import 'package:go_router/go_router.dart';
import 'package:astha_engineering/routes/app_routes.dart';
import 'package:astha_engineering/features/common/profile/presentation/pages/profile_screen.dart';
import 'package:astha_engineering/features/customer/certificate_management/presentation/pages/customer_certificates_screen.dart';
import 'package:astha_engineering/features/customer/dashboard/presentation/pages/customer_home_screen.dart';
import 'package:astha_engineering/features/customer/dashboard/presentation/pages/customer_main_layout_screen.dart';
import 'package:astha_engineering/features/customer/renewals_tracker/presentation/pages/customer_renewals_screen.dart';
import 'package:astha_engineering/features/customer/site_management/presentation/pages/customer_sites_screen.dart';

class CustomerRoutes {
  static List<RouteBase> get routes => [
        // ── Customer Shell (Bottom Nav) ───────────────────────────────
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

        // ── Standalone Customer Routes ────────────────────────────────
        GoRoute(
          path: Routes.customerRenewals,
          builder: (context, state) => const CustomerRenewalsScreen(),
        ),
      ];
}
