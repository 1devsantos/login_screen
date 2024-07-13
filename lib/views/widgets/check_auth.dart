import 'package:flutter/material.dart';
import 'package:login_screen/container_injection.dart';
import 'package:login_screen/view_models/auth/states/auth_states.dart';
import 'package:login_screen/view_models/auth/stores/auth_store.dart';
import 'package:login_screen/views/home/home_view.dart';
import 'package:login_screen/views/sign_in/sign_in_view.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  late final AuthStore _authStore;

  @override
  void initState() {
    super.initState();

    _authStore = getIt<AuthStore>();
    _authStore.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _authStore,
      builder: (context, state, _) {
        switch(state.runtimeType) {
          case const (InitialAuthState):
            return const HomeView();
          case const (AuthenticatedAuthState):
            return const SignInView();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
