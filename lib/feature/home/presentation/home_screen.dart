import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wan_android/common/widgets/async_value_widget.dart';
import 'package:wan_android/feature/home/data/home_article_list_item.dart';
import 'package:wan_android/feature/home/presentation/home_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: AsyncValueWidget(
        value: ref.watch(homeControllerProvider),
        data: (data) => _listViewBuilder(
          context,
          data: data.datas,
        ),
      ),
    );
  }

  Widget _listViewBuilder(BuildContext context,
      {required List<HomeArticleListItem> data}) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: data.length,
      itemBuilder: (_, index) {
        final itemData = data[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  itemData.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  itemData.superChapterName,
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
