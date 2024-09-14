import 'package:flutter/material.dart';

import '../../module/auth/forgot_password.dart';
import '../../module/auth/loading_page.dart';
import '../../module/auth/login_screen.dart';
import '../../module/dashboard/dashboard_screen.dart';
import '../../module/dashboard/status_statistics_screen.dart';

final routes = {
  '/': (BuildContext context) => const LoadingPage(),
  '/login': (BuildContext context) => const LoginScreen(),
  '/forgot-password': (BuildContext context) => const ForgotPassword(),
  '/dashboard': (BuildContext context) => const DashboardScreen(),
  '/status-statistics': (BuildContext context) =>
      const StatusStatisticsScreen(),
};
