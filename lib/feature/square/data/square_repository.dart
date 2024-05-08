import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/project/data/project_list_item.dart';
import 'package:wan_android/feature/square/data/knowledge_system_tree.dart';
import 'package:wan_android/services/network/api_interface.dart';
import 'package:wan_android/services/network/api_service_provider.dart';
import 'package:wan_android/services/network/data/api_base_response.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

part 'square_repository.g.dart';

class SquareRepository {
  final ApiInterface _apiService;
  SquareRepository({required ApiInterface apiService})
      : _apiService = apiService;

  /// 广场列表数据
  /// https://wanandroid.com/user_article/list/0/json
  Future<ApiBaseResponse<BasePaginationData<ProjectListItem>>>
      getSquarePaginationList({required pageIndex}) {
    return _apiService.getPaginationData(
      path: "/user_article/list/$pageIndex/json",
      paginationItemConverter: ProjectListItem.fromJson,
    );
  }

  /// 问答
  /// https://wanandroid.com/wenda/list/1/json
  Future<ApiBaseResponse<BasePaginationData<ProjectListItem>>>
      getQuestionPaginationList({required pageIndex}) {
    return _apiService.getPaginationData(
      path: "/wenda/list/$pageIndex/json",
      paginationItemConverter: ProjectListItem.fromJson,
    );
  }

  // 体系数据
  // https://www.wanandroid.com/tree/json
  Future<ApiBaseResponse<List<KnowledgeSystemTree>>> getKnowledgeSystemTree() {
    return _apiService.getListData(
      path: "/tree/json",
      dataItemConverter: KnowledgeSystemTree.fromJson,
    );
  }
}

@Riverpod(keepAlive: true)
SquareRepository squareRepository(SquareRepositoryRef ref) {
  return SquareRepository(apiService: ref.watch(apiServiceProvider));
}
