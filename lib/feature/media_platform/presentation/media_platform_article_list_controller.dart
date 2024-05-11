import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/media_platform/data/media_platform_repository.dart';
import 'package:wan_android/feature/project/data/project_list_item.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

part 'media_platform_article_list_controller.g.dart';

@riverpod
class MediaPlatformArticleListController
    extends _$MediaPlatformArticleListController {
  @override
  FutureOr<List<ProjectListItem>> build({required int authorId}) {
    return _loadMediaPlatformArticleList(authorId: authorId)
        .then((value) => value.datas);
  }

  Future<BasePaginationData<ProjectListItem>> _loadMediaPlatformArticleList(
      {required int authorId}) {
    return ref
        .watch(mediaPlatformRepositoryProvider)
        .getMediaPlatformArticleList(authorId: authorId, pageIndex: 1)
        .then((value) => value.data);
  }
}
