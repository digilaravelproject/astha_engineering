import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:astha_engineering/core/constants/app_constants.dart';
import 'package:astha_engineering/routes/app_routes.dart';
import 'package:astha_engineering/features/auth/presentation/bloc/login_bloc.dart';
import 'package:astha_engineering/features/auth/presentation/bloc/signup_bloc.dart';
import 'package:astha_engineering/features/auth/presentation/pages/email_login_screen.dart';
import 'package:astha_engineering/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:astha_engineering/features/auth/presentation/pages/login_screen.dart';
import 'package:astha_engineering/features/auth/presentation/pages/otp_screen.dart';
import 'package:astha_engineering/features/auth/presentation/pages/role_selection_screen.dart';
import 'package:astha_engineering/features/auth/presentation/pages/set_new_password_screen.dart';
import 'package:astha_engineering/features/auth/presentation/pages/signup_screen.dart';
import 'package:astha_engineering/features/splash/presentation/pages/splash_screen.dart';

class AuthRoutes {
  static List<RouteBase> get routes => [
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
      ];
}
