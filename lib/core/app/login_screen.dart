import 'package:flutter/material.dart';
import 'package:login_screen/core/routes/app_routes.dart';
import 'package:login_screen/core/themes/app_theme.dart';
import 'package:login_screen/views/home/home_view.dart';
import 'package:login_screen/views/sign_in/sign_in_view.dart';
import 'package:login_screen/views/sign_up/sign_up_view.dart';
import 'package:login_screen/views/widgets/check_auth.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Screen',
      theme: AppTheme.mainTheme,
      home: const CheckAuth(),
      routes: {
        AppRoutes.signIn: (context) => const SignInView(),
        AppRoutes.signUp: (context) => const SignUpView(),
        AppRoutes.home: (context) => const HomeView(),
      },
    );
  }
}