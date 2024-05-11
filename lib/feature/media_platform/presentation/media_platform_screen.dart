import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/common/widgets/async_value_widget.dart';
import 'package:wan_android/common/widgets/wa_tabbar.dart';
import 'package:wan_android/feature/media_platform/presentation/media_platform_controller.dart';

import 'media_platform_article_list_view.dart';

// 微信公众平台的简称“MP”是哪两个英文单词的缩写？
// https://www.zhihu.com/question/22746683
class MediaPlatformScreen extends ConsumerWidget {
  const MediaPlatformScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
        value: ref.watch(mediaPlatformControllerProvider),
        data: (authorList) {
          return DefaultTabController(
            length: authorList.length,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                title: WATabBar(
                    tabLabelList: authorList.map((e) => e.name).toList()),
              ),
              body: TabBarView(
                children: authorList
                    .map((e) => MediaPlatformArticleListView(authorId: e.id))
                    .toList(),
              ),
            ),
          );
        });
  }
}
