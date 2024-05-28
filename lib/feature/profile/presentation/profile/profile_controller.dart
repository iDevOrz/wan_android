import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/profile/data/profile_repository.dart';
import 'package:wan_android/feature/profile/data/user_info.dart';

part 'profile_controller.g.dart';

@Riverpod(keepAlive: true)
class ProfileController extends _$ProfileController {
  @override
  FutureOr<UserInfo> build() {
    return _fetchProfile();
  }

  Future<UserInfo> _fetchProfile() {
    return ref
        .watch(profileRepositoryProvider)
        .getUserInfo()
        .then((value) => value.data);
  }
}
