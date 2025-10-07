import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/feature/home/data/home_article_list_item.dart';
import 'package:wan_android/routers/go_router_builder.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key, required this.data});

  final HomeArticleListItem data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context),
      child: Hero(
        tag: data.link,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  data.title,
                  style: Theme.of(context).textTheme.titleMedium,
                  semanticsLabel: '文章标题: ${data.title}',
                ),
                const SizedBox(height: 10),
                Text(
                  data.superChapterName,
                  style: Theme.of(context).textTheme.labelSmall,
                  semanticsLabel: '分类: ${data.superChapterName}',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    try {
      if (data.link.isNotEmpty) {
        WebviewRouteData(link: data.link).push(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('无法打开链接')),
      );
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<HomeArticleListItem>('data', data));
  }
}
