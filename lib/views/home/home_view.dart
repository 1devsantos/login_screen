import 'package:flutter/material.dart';
import 'package:login_screen/container_injection.dart';
import 'package:login_screen/view_models/auth/stores/auth_store.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final AuthStore _authStore;

  @override
  void initState() {
    super.initState();

    _authStore = getIt<AuthStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome to HomeView!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextButton(
              onPressed: () async {
                await _authStore.logout();
                if(context.mounted) Navigator.pushReplacementNamed(context, '/signIn');
              },
              child: Text(
                'Log out of account',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
