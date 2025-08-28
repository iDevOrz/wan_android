import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/project/data/project_tree_item.dart';
import 'package:wan_android/services/network/api_interface.dart';
import 'package:wan_android/services/network/api_service_provider.dart';
import 'package:wan_android/services/network/data/api_base_response.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

import 'project_list_item.dart';

part 'project_repository.g.dart';

class ProjectRepository {
  final ApiInterface _apiService;

  ProjectRepository({required ApiInterface apiService})
      : _apiService = apiService;

  /// 项目分类
  /// https://www.wanandroid.com/project/tree/json
  Future<ApiBaseResponse<List<ProjectTreeItem>>> getProjectTree() {
    return _apiService.getListData(
      path: "/project/tree/json",
      dataItemConverter: ProjectTreeItem.fromJson,
    );
  }

  /// 项目列表数据
  /// https://www.wanandroid.com/project/list/1/json?cid=294
  Future<ApiBaseResponse<BasePaginationData<ProjectListItem>>>
      getProjectPaginationList({required pageIndex, int? cid}) {
    return _apiService.getPaginationData(
      path: "/project/list/1/json",
      queryParams: {"cid": cid},
      paginationItemConverter: ProjectListItem.fromJson,
    );
  }
}

@Riverpod(keepAlive: true)
ProjectRepository projectRepository(Ref ref) {
  return ProjectRepository(apiService: ref.watch(apiServiceProvider));
}
