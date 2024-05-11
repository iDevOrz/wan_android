import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/common/widgets/async_value_widget.dart';
import 'package:wan_android/feature/media_platform/presentation/media_platform_article_list_controller.dart';
import 'media_platform_article_list_item_view.dart';

class MediaPlatformArticleListView extends ConsumerWidget {
  const MediaPlatformArticleListView({super.key, required this.authorId});

  final int authorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
        value: ref.watch(mediaPlatformArticleListControllerProvider.call(
            authorId: authorId)),
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (ct, index) =>
                MediaPlatformArticleListItemView(data: data[index]),
          );
        });
  }
}
