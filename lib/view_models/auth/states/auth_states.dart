abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {
  final String token;

  SuccessAuthState(this.token);
}

class ErrorAuthState extends AuthState {
  final String errorMessage;

  ErrorAuthState(this.errorMessage);
}

class AuthenticatedAuthState extends AuthState {}