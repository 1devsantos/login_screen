import 'package:flutter/material.dart';
import 'package:login_screen/container_injection.dart';
import 'package:login_screen/core/routes/app_routes.dart';
import 'package:login_screen/dtos/register_dto.dart';
import 'package:login_screen/view_models/auth/states/auth_states.dart';
import 'package:login_screen/view_models/auth/stores/auth_store.dart';
import 'package:login_screen/views/widgets/divider_widget.dart';
import 'package:login_screen/views/widgets/form/button_form_widget.dart';
import 'package:login_screen/views/widgets/form/custom_checkbox_widget.dart';
import 'package:login_screen/views/widgets/form/phone_text_form_field_widget.dart';
import 'package:login_screen/views/widgets/form/social_buttons_widget.dart';
import 'package:login_screen/views/widgets/form/text_form_field_widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String selectedCountryCode = '+55';
  bool _rememberMe = false;

  final AuthStore _authStore = getIt<AuthStore>();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void showError(String errorMessage) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    String getPhone() {
      String currentValue = _phoneController.text.replaceAll(RegExp(r'^\+\d+\s*'), '');
      String phone = '$selectedCountryCode$currentValue';

      return phone;
    }

    Future<void> register(BuildContext context) async {
      if (_formKey.currentState!.validate()) {
        String fullPhone = getPhone();
        RegisterDto registerDto = RegisterDto(
          email: _emailController.text,
          password: _passwordController.text,
          phone: fullPhone,
        );
        await _authStore.register(registerDto);

        if (_authStore.value is ErrorAuthState) {
          final errorState = _authStore.value as ErrorAuthState;

          showError(errorState.errorMessage);
        } else {
          if (context.mounted) {
            Navigator.pushReplacementNamed(context, AppRoutes.signIn);
          }
        }
      }
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 28,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create an account',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Connect with your friends today!',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 52),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormFieldWidget(
                          label: 'E-mail',
                          controller: _emailController,
                          hintText: 'Please enter your email',
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'The email cannot be null!';
                            } else if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Invalid email!';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 12),
                        PhoneTextFormFieldWidget(
                          controller: _phoneController,
                          label: 'Phone',
                          selectedCountryCode: selectedCountryCode,
                          hintText: 'Enter your phone number',
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'The phone cannot be null!';
                            } else {
                              return null;
                            }
                          },
                          onCountryCodeChanged: (value) {
                            setState(() {
                              selectedCountryCode = value;
                            });
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormFieldWidget(
                          label: 'Password',
                          controller: _passwordController,
                          hintText: 'Please enter your password',
                          securityField: true,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'The password cannot be null!';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomCheckboxWidget(
                              label: 'Remember Me',
                              onChange: (bool value) {
                                setState(() {
                                  _rememberMe = value;
                                });
                              },
                              isChecked: _rememberMe,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        ButtonFormWidget(
                          title: 'Register',
                          onPressed: () => register(context),
                        ),
                        const SizedBox(height: 22),
                        const DividerWidget(),
                        const SizedBox(height: 22),
                        const SocialButtonsWidget(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1),
                              Text(
                                'Already have an account? ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, AppRoutes.signIn),
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
