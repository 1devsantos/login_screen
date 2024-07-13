import 'package:get_it/get_it.dart';
import 'package:login_screen/repositories/secure_repository.dart';
import 'package:login_screen/view_models/auth/stores/auth_store.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<SecureRepository>(() => SecureRepository());
  getIt.registerFactory<AuthStore>(() => AuthStore(
     getIt<SecureRepository>(),
  ));
}
