import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/home/data/home_article_list_item.dart';
import 'package:wan_android/services/network/api_service_provider.dart';
import 'package:wan_android/services/network/data/api_base_response.dart';
import 'package:wan_android/services/network/api_interface.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

part 'home_repository.g.dart';

class HomeRepository {
  final ApiInterface _apiService;
  HomeRepository({required ApiInterface apiService}) : _apiService = apiService;

  Future<ApiBaseResponse<BasePaginationData<HomeArticleListItem>>>
      getArticleList({required pageIndex}) {
    return _apiService.getPaginationData(
      path: "/article/list/$pageIndex/json",
      paginationItemConverter: HomeArticleListItem.fromJson,
    );
  }
}

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepository(apiService: ref.watch(apiServiceProvider));
}
