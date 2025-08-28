import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/project/data/project_list_item.dart';
import 'package:wan_android/services/network/api_interface.dart';
import 'package:wan_android/services/network/api_service_provider.dart';
import 'package:wan_android/services/network/data/api_base_response.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

import 'media_platform_author.dart';

part 'media_platform_repository.g.dart';

class MediaPlatformRepository {
  final ApiInterface _apiService;

  MediaPlatformRepository({required ApiInterface apiService})
      : _apiService = apiService;

  // 15.1 获取公众号列表
  // https://wanandroid.com/wxarticle/chapters/json
  Future<ApiBaseResponse<List<MediaPlatformAuthor>>>
      getMediaPlatformAuthorList() {
    return _apiService.getListData(
      path: "/wxarticle/chapters/json",
      dataItemConverter: MediaPlatformAuthor.fromJson,
    );
  }

  // 15.2 查看某个公众号历史数据
  // https://wanandroid.com/wxarticle/list/405/1/json?k=Java
  Future<ApiBaseResponse<BasePaginationData<ProjectListItem>>>
      getMediaPlatformArticleList(
          {required int authorId, required int pageIndex, String? keyword}) {
    return _apiService.getPaginationData(
      path: "/wxarticle/list/$authorId/$pageIndex/json",
      queryParams: {"k": keyword},
      paginationItemConverter: ProjectListItem.fromJson,
    );
  }
}

@riverpod
MediaPlatformRepository mediaPlatformRepository(Ref ref) {
  return MediaPlatformRepository(apiService: ref.watch(apiServiceProvider));
}
