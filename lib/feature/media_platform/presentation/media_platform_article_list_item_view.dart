import 'package:flutter/material.dart';
import 'package:wan_android/feature/project/data/project_list_item.dart';
import 'package:wan_android/routers/go_router_builder.dart';

class MediaPlatformArticleListItemView extends StatelessWidget {
  const MediaPlatformArticleListItemView({super.key, required this.data});

  final ProjectListItem data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _textContent(context),
        ),
      ),
    );
  }

  Widget _textContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          data.title,
          maxLines: 2,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        Text(
          data.desc,
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: 4,
        ),
        _authorAndDate(context),
      ],
    );
  }

  Widget _authorAndDate(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.labelSmall!,
      child: Row(
        children: [
          const Icon(
            Icons.person,
            size: 20,
          ),
          Expanded(
            child: Text(
              data.author,
            ),
          ),
          const SizedBox(width: 8),
          Text(data.niceDate),
        ],
      ),
    );
  }

  void _onTap(BuildContext context) {
    WebviewRouteData(link: data.link).push(context);
  }
}
