import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safecheck_techno/core/theme/bloc/theme_bloc.dart';
import 'package:safecheck_techno/core/theme/bloc/theme_state.dart';

import 'package:safecheck_techno/core/services/storage/hive_storage.dart';
import 'package:safecheck_techno/core/services/storage/shared_prefs.dart';
import 'package:safecheck_techno/core/services/local_notification_service.dart';
import 'package:safecheck_techno/core/theme/light_theme.dart';
import 'package:safecheck_techno/core/theme/dark_theme.dart';
import 'package:safecheck_techno/routes/route_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Core Services
  await SharedPrefs.init();
  await HiveStorage.init();
  await LocalNotificationService.initialize();

  runApp(const SafeCheckApp());
}

class SafeCheckApp extends StatelessWidget {
  const SafeCheckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'SafeCheck Techno',
            debugShowCheckedModeBanner: false,
            theme: getLightTheme(),
            darkTheme: getDarkTheme(),
            themeMode: state.themeMode,
            routerConfig: RouteHelper.router,
          );
        },
      ),
    );
  }
}
