import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

class AuthService {
  AuthService(this.ref);

  final Ref ref;
}

@riverpod
AuthService authService(Ref ref) {
  return AuthService(ref);
}
