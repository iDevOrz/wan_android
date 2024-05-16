import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/services/network/api_interface.dart';
import 'package:wan_android/services/network/api_service_provider.dart';
import 'package:wan_android/services/network/data/api_base_response.dart';

import 'user_info.dart';

part 'profile_repository.g.dart';

class ProfileRepository {
  final ApiInterface _apiService;
  ProfileRepository(ApiInterface apiService) : _apiService = apiService;

  Future<ApiBaseResponse<UserInfo>> getUserInfo() {
    return _apiService.getData(
      path: "/user/lg/userinfo/json",
      converter: UserInfo.fromJson,
    );
  }
}

@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  return ProfileRepository(ref.watch(apiServiceProvider));
}
