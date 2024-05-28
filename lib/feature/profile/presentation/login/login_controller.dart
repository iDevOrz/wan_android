import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/profile/data/profile_repository.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() {}

  Future<AsyncValue<void>> login(
      {required String username, required String password}) async {
    final repository = ref.read(profileRepositoryProvider);
    state = await AsyncValue.guard(
        () => repository.login(username: username, password: password));
    return state;
  }
}
