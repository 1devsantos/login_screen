import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureRepository {
  static const String _key = 'token';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    String? token = await _storage.read(key: _key);

    return token;
  }

  Future<void> setToken(String token) async {
    await _storage.write(key: _key, value: token);
  }

  Future<void> removeToken() async {
    await _storage.delete(key: _key);
  }
}