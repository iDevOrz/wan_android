import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/common/widgets/async_value_widget.dart';
import 'package:wan_android/feature/home/data/home_article_list_item.dart';
import 'package:wan_android/feature/home/data/home_banner_item.dart';
import 'package:wan_android/feature/home/presentation/home_controller.dart';
import 'package:wan_android/feature/home/presentation/home_list_view.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: AspectRatio(
                aspectRatio: 900 / 500,
                child: AsyncValueWidget(
                  value: ref.watch(homeBannerListProvider),
                  data: (data) => _homeBannerBuilder(context, data: data),
                ),
              ),
            ),
          ];
        },
        body: AsyncValueWidget(
          value: ref.watch(homeControllerProvider),
          data: (data) => _listViewBuilder(context, ref, data: data.datas),
        ),
      ),
    );
  }

  Widget _listViewBuilder(
    BuildContext context,
    WidgetRef ref, {
    required List<HomeArticleListItem> data,
  }) {
    final controller = ref.read(homeControllerProvider.notifier);
    return EasyRefresh(
      onRefresh: controller.onRefresh,
      onLoad: controller.onLoad,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: data.length,
        itemBuilder: (_, index) => HomeListView(data: data[index]),
      ),
    );
  }

  Widget _homeBannerBuilder(
    BuildContext context, {
    required List<HomeBannerItem> data,
  }) {
    if (data.isEmpty) {
      return const Text("暂无数据", textAlign: TextAlign.center);
    }
    return PageView.builder(
      itemBuilder: (ct, index) {
        final itemData = data[index % data.length];
        return CachedNetworkImage(imageUrl: itemData.imagePath);
      },
    );
  }
}
