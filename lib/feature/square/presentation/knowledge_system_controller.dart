import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/project/data/project_list_item.dart';
import 'package:wan_android/feature/square/data/knowledge_system_tree.dart';
import 'package:wan_android/feature/square/data/square_repository.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

part 'knowledge_system_controller.g.dart';

@riverpod
class KnowledgeSystemController extends _$KnowledgeSystemController {
  @override
  FutureOr<List<KnowledgeSystemTree>> build() async {
    return _loadKnowledgeSystemTree();
  }

  Future<List<KnowledgeSystemTree>> _loadKnowledgeSystemTree() {
    return ref
        .watch(squareRepositoryProvider)
        .getKnowledgeSystemTree()
        .then((value) => value.data);
  }
}
