import 'package:flutter/material.dart';
import 'package:login_screen/container_injection.dart';
import 'package:login_screen/view_models/auth/states/auth_states.dart';
import 'package:login_screen/view_models/auth/stores/auth_store.dart';

class ButtonFormWidget extends StatefulWidget {
  final String title;
  final void Function() onPressed;

  const ButtonFormWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  State<ButtonFormWidget> createState() => _ButtonFormWidgetState();
}

class _ButtonFormWidgetState extends State<ButtonFormWidget> {
  final AuthStore _authStore = getIt<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ValueListenableBuilder(
        valueListenable: _authStore,
        builder: (context, state, _) {
          return ElevatedButton(
            onPressed: state is LoadingAuthState ? null : widget.onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: state is LoadingAuthState
                ? const Center(child: CircularProgressIndicator())
                : Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
