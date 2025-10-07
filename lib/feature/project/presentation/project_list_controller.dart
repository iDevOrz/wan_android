import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/common/pagination/pagination_mixin.dart';
import 'package:wan_android/feature/project/data/project_list_item.dart';
import 'package:wan_android/feature/project/data/project_repository.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

part 'project_list_controller.g.dart';

@riverpod
class ProjectListController extends _$ProjectListController
    with PaginationMixin<ProjectListItem> {
  @override
  FutureOr<BasePaginationData<ProjectListItem>> build({
    required int cid,
  }) async {
    return onBuild();
  }

  @override
  Future<BasePaginationData<ProjectListItem>> paginationRequest(
    int pageIndex,
    int pageSize,
  ) {
    return ref
        .read(projectRepositoryProvider)
        .getProjectPaginationList(pageIndex: pageIndex, cid: cid)
        .then((value) => value.data);
  }
}
