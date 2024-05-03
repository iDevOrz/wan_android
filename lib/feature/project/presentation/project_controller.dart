import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/project/data/project_repository.dart';
import 'package:wan_android/feature/project/data/project_tree_item.dart';

part 'project_controller.g.dart';

@Riverpod(keepAlive: true)
class ProjectController extends _$ProjectController {
  @override
  FutureOr<List<ProjectTreeItem>> build() async {
    return _loadTree();
  }

  Future<List<ProjectTreeItem>> _loadTree() {
    return ref
        .watch(projectRepositoryProvider)
        .getProjectTree()
        .then((value) => value.data);
  }
}
