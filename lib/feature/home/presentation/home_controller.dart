import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wan_android/feature/home/data/home_article_list_item.dart';
import 'package:wan_android/feature/home/data/home_banner_item.dart';
import 'package:wan_android/feature/home/data/home_repository.dart';
import 'package:wan_android/services/network/data/base_pagination_data.dart';

part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeController extends _$HomeController {
  @override
  FutureOr<BasePaginationData<HomeArticleListItem>> build() async {
    return _fetch();
  }

  Future<BasePaginationData<HomeArticleListItem>> _fetch(
      {int pageIndex = 0}) async {
    final response = await ref
        .watch(homeRepositoryProvider)
        .getArticlePaginationList(pageIndex: pageIndex);
    return response.data;
  }
}

@Riverpod(keepAlive: true)
Future<List<HomeBannerItem>> homeBannerList(HomeBannerListRef ref) async {
  final response = await ref.watch(homeRepositoryProvider).getHomeBannerList();
  return response.data;
}
