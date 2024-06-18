import 'package:flutter/material.dart';
import 'package:wan_android/feature/project/data/project_list_item.dart';
import 'package:wan_android/routers/go_router_builder.dart';

class SquareListItemView extends StatelessWidget {
  const SquareListItemView({super.key, required this.data});

  final ProjectListItem data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              _authorAndDate(context),
              Text(
                data.title,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _authorAndDate(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context)
          .textTheme
          .labelSmall!
          .copyWith(color: Colors.grey[600]),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Share by: ${data.shareUser}",
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
