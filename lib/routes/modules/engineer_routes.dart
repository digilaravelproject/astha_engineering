import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/routes/app_routes.dart';
import 'package:safecheck_techno/features/common/profile/presentation/pages/profile_screen.dart';
import 'package:safecheck_techno/features/engineer/dashboard/presentation/pages/engineer_home_screen.dart';
import 'package:safecheck_techno/features/engineer/dashboard/presentation/pages/engineer_main_layout_screen.dart';
import 'package:safecheck_techno/features/engineer/inspection_execution/presentation/pages/checklist_form_screen.dart';
import 'package:safecheck_techno/features/engineer/inspection_execution/presentation/pages/inspection_scanner_screen.dart';
import 'package:safecheck_techno/features/engineer/inspection_history/presentation/pages/certificate_preview_screen.dart';
import 'package:safecheck_techno/features/engineer/inspection_history/presentation/pages/engineer_history_screen.dart';
import 'package:safecheck_techno/features/engineer/site_management/presentation/pages/engineer_site_list_screen.dart';
import 'package:safecheck_techno/features/engineer/site_management/presentation/pages/engineer_site_overview_screen.dart';

class EngineerRoutes {
  static List<RouteBase> get routes => [
        // ── Engineer Shell (Bottom Nav) ───────────────────────────────
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

        // ── Standalone Engineer Routes ─────────────────────────────────
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
          path: Routes.certificatePreview,
          builder: (context, state) => const CertificatePreviewScreen(),
        ),
      ];
}
