import 'package:flutter/cupertino.dart';
import 'package:login_screen/dtos/login_dto.dart';
import 'package:login_screen/dtos/register_dto.dart';
import 'package:login_screen/repositories/secure_repository.dart';
import 'package:login_screen/view_models/auth/states/auth_states.dart';

class AuthStore extends ValueNotifier<AuthState> {
  final SecureRepository _secureRepository;
  AuthStore(this._secureRepository) : super(InitialAuthState());

  Future<void> onInit() async {
    await _getLocalToken();
  }

  Future<void> _getLocalToken() async {
    value = LoadingAuthState();
    String? token = await _secureRepository.getToken();

    if(token != null) {
      value = AuthenticatedAuthState();
    }
    value = InitialAuthState();
  }

  Future<void> login(LoginDto loginDto) async {
    value = LoadingAuthState();

    if(loginDto.email == 'user@email.com' && loginDto.password == '123456') {
      // simulates receipt of the token via the api
      await Future.delayed(const Duration(seconds: 1));
      String token = 'newToken';

      await _secureRepository.setToken(token);

      value = AuthenticatedAuthState();
    } else {
      value = ErrorAuthState('invalid Credentials!');
    }
  }

  Future<void> register(RegisterDto registerDto) async {
    // send user to api
    print(registerDto.phone);
  }

  Future<void> logout() async {
    await _secureRepository.removeToken();

    value = InitialAuthState();
  }
}