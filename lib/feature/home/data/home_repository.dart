import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/home/data/home_article_list_item.dart';
import 'package:wan_android/feature/home/data/home_banner_item.dart';
import 'package:wan_android/services/network/api_service_provider.dart';
import 'package:wan_android/services/network/data/api_base_response.dart';
import 'package:wan_android/services/network/api_interface.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

import 'search_hotkey.dart';

part 'home_repository.g.dart';

class HomeRepository {
  final ApiInterface _apiService;
  HomeRepository({required ApiInterface apiService}) : _apiService = apiService;

  /// 首页文章列表
  Future<ApiBaseResponse<BasePaginationData<HomeArticleListItem>>>
      getArticlePaginationList({required pageIndex}) {
    return _apiService.getPaginationData(
      path: "/article/list/$pageIndex/json",
      paginationItemConverter: HomeArticleListItem.fromJson,
    );
  }

  /// 首页banner
  Future<ApiBaseResponse<List<HomeBannerItem>>> getHomeBannerList() {
    return _apiService.getListData(
      path: "/banner/json",
      dataItemConverter: HomeBannerItem.fromJson,
    );
  }

  /// 搜索热词
  Future<ApiBaseResponse<List<SearchHotkey>>> getSearchHotkeyList() {
    return _apiService.getListData(
      path: "/hotkey/json",
      dataItemConverter: SearchHotkey.fromJson,
    );
  }
}

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepository(apiService: ref.watch(apiServiceProvider));
}
