import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/project/data/project_list_item.dart';
import 'package:wan_android/feature/square/data/square_repository.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

part 'square_list_controller.g.dart';

@riverpod
class SquareListController extends _$SquareListController {
  @override
  FutureOr<List<ProjectListItem>> build() async {
    return _loadProjectList().then((value) => value.datas);
  }

  Future<BasePaginationData<ProjectListItem>> _loadProjectList() {
    return ref
        .watch(squareRepositoryProvider)
        .getSquarePaginationList(pageIndex: 1)
        .then((value) => value.data);
  }
}
