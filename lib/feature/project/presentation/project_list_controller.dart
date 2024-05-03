import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/project/data/project_list_item.dart';
import 'package:wan_android/feature/project/data/project_repository.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

part 'project_list_controller.g.dart';

@riverpod
class ProjectListController extends _$ProjectListController {
  @override
  FutureOr<List<ProjectListItem>> build({required int cid}) async {
    return _loadProjectList(cid: cid).then((value) => value.datas);
  }

  Future<BasePaginationData<ProjectListItem>> _loadProjectList({int? cid}) {
    return ref
        .watch(projectRepositoryProvider)
        .getProjectPaginationList(pageIndex: 1, cid: cid)
        .then((value) => value.data);
  }
}
