import 'package:flutter/material.dart';
import 'package:login_screen/views/widgets/divider_widget.dart';
import 'package:login_screen/views/widgets/form/button_form_widget.dart';
import 'package:login_screen/views/widgets/form/Text_form_field_widget.dart';
import 'package:login_screen/views/widgets/form/custom_checkbox_widget.dart';
import 'package:login_screen/views/widgets/form/social_buttons_widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
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
                    'Hi, Welcome Back! 👋',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Hello again, you’ve been missed!',
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
                          hintText: 'Please Enter Your Email',
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'O e-mail não pode ser nulo!';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormFieldWidget(
                          label: 'Password',
                          controller: _passwordController,
                          hintText: 'Please Enter Your Password',
                          securityField: true,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'A senha não pode ser nulo!';
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
                          title: 'Login',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Tentar logar
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
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
                              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                              Text(
                                'Don’t have an account ? ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextButton(
                                onPressed: () => Navigator.pushNamed(context, '/signUp'),
                                child: Text(
                                  'Sign Up',
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
