import 'package:flutter/material.dart';
import 'package:login_screen/core/themes/app_theme.dart';
import 'package:login_screen/views/home/home_view.dart';
import 'package:login_screen/views/sign_in/sign_in_view.dart';
import 'package:login_screen/views/sign_up/sign_up_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Screen',
      theme: AppTheme.mainTheme,
      home: const SignInView(),
      routes: {
        '/signIn': (context) => const SignInView(),
        '/signUp': (context) => const SignUpView(),
        '/home': (context) => const HomeView(),
      },
    );
  }
}