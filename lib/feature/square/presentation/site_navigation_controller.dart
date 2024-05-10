import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/square/data/site_navigation_item.dart';
import 'package:wan_android/feature/square/data/square_repository.dart';

part 'site_navigation_controller.g.dart';

@riverpod
class SiteNavigationController extends _$SiteNavigationController {
  @override
  FutureOr<List<SiteNavigationItem>> build() async {
    return _loadSiteNavigation();
  }

  Future<List<SiteNavigationItem>> _loadSiteNavigation() {
    return ref
        .watch(squareRepositoryProvider)
        .getSiteNavigationData()
        .then((value) => value.data);
  }
}
