import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/media_platform/data/media_platform_author.dart';
import 'package:wan_android/feature/media_platform/data/media_platform_repository.dart';

part 'media_platform_controller.g.dart';

@riverpod
class MediaPlatformController extends _$MediaPlatformController {
  @override
  FutureOr<List<MediaPlatformAuthor>> build() async {
    return _loadProjectList();
  }

  Future<List<MediaPlatformAuthor>> _loadProjectList() {
    return ref
        .watch(mediaPlatformRepositoryProvider)
        .getMediaPlatformAuthorList()
        .then((value) => value.data);
  }
}
