import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/project/data/project_list_item.dart';
import 'package:wan_android/feature/square/data/square_repository.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

part 'question_list_controller.g.dart';

@riverpod
class QuestionListController extends _$QuestionListController {
  @override
  FutureOr<List<ProjectListItem>> build() async {
    return _loadQuestionList().then((value) => value.datas);
  }

  Future<BasePaginationData<ProjectListItem>> _loadQuestionList() {
    return ref
        .watch(squareRepositoryProvider)
        .getQuestionPaginationList(pageIndex: 1)
        .then((value) => value.data);
  }
}
